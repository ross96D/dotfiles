import argparse
import os
import shutil
import sys


def cp(src, dest, dryrun=False):
    print("copying file: %s -> %s" % (src, dest))
    if not dryrun:
        shutil.copy(src, dest)


def get_shell():
    return os.path.basename(os.getenv("SHELL", ""))


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
        prog="config_setup",
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
        help="set the output",
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
    cpath = os.path.join(args.config_path, config_name)

    copy = True
    if not os.path.exists(cpath):
        mkdir(cpath, args.dry_run)
    else:
        # prompt for confirmation
        print("The config destination folder already exists", cpath)
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

    if copy:
        cp(os.path.join(cwd, config_name), cpath, args.dry_run)


def main(args: Args):
    print("main", args.dry_run, args.config_path)

    copy_config(args, "fish")
    copy_config(args, "kitty")


if __name__ == "__main__":
    print("as")
    main(parse_arguments())
