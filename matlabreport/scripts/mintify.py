import click
import re


@click.command()
@click.argument("texfile", type=click.Path(exists=True, resolve_path=True))
def mintify(texfile):
    with open(texfile, "r") as f:
        old_contents = f.read()

    for line in old_contents:
        if line == "\\begin{verbatim}":
            print(line)


if __name__ == "__main__":
    mintify()
