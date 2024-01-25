#!/bin/env python3

import argparse
import os
import shutil
import sys


def rm(dest, dryrun=False):
    print("deleting files: %s" % (dest))
    if not dryrun:
        shutil.rmtree(dest)


def cp(src, dest, dryrun=False):
    print("copying file: %s -> %s" % (src, dest))
    if not dryrun:
        shutil.copytree(src, dest)


def mkdir(path, dryrun=False):
    print("creating directory:", path)
    if not dryrun and not os.path.exists(path):
        os.makedirs(path)


def eprint(*args, **kwargs):
    """Print to the stderr"""
    print(*args, file=sys.stderr, **kwargs)


class Args:
    dry_run: bool
    config_path: str


def parse_arguments():
    r = Args()

    user_config_path = os.path.join(
        os.path.expanduser("~"),
        ".config",
    )

    parser = argparse.ArgumentParser(
        prog="python3 setup.py",
        description="Set up the config files listed here",
    )

    parser.add_argument(
        "--dry_run",
        action=argparse.BooleanOptionalAction,
        dest="dry_run",
        help="see the effects with out making any real change",
    )

    parser.add_argument(
        "-o",
        "--output",
        dest="output",
        default=user_config_path,
        help="set a config destination folder different from %%HOME%%/.config",
    )

    args = parser.parse_args()
    r.dry_run = args.dry_run
    r.config_path = args.output
    if r.config_path == "":
        eprint("no config path or home directory found")
        os._exit(1)

    return r


def copy_config(args: Args, config_name: str):
    cwd = os.getcwd()
    confpath = os.path.join(args.config_path, config_name)

    copy = True
    if not os.path.exists(confpath):
        mkdir(confpath, args.dry_run)
    else:
        # prompt for confirmation
        print("The config destination folder already exists", confpath)
        print("Do you want to delete Y/n")
        for line in sys.stdin:
            line = line.rstrip()
            line = line.lower()
            if line == "yes" or line == "y":
                copy = True
                break
            if line == "no" or line == "n":
                copy = False
                break
            print("Please type `y` for yes or `n` for no")
            print("Do you want to delete Y/n")

    if copy:
        rm(confpath, args.dry_run)
        cp(os.path.join(cwd, config_name), confpath, args.dry_run)
    else:
        print(f"setup of {config_name} could not be completed sucessfully")


def main(args: Args):
    print("main", args.dry_run, args.config_path)

    copy_config(args, "fish")
    copy_config(args, "kitty")


if __name__ == "__main__":
    main(parse_arguments())
