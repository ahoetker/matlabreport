# matlabreport.py - Click interface to publish MATLAB reports

import click
from matlabreport.makereport import makeReport
from matlabreport.publishmfile import publishMfile

@click.command()
@click.argument('outline', type=click.Path(exists=True, resolve_path=True))
@click.argument('report_m', type=click.Path(resolve_path=True))
@click.option('--pubformat', default='html')
@click.option('--funcs', is_flag=True, help="Append user functions.")
@click.option('-p', is_flag=True, help="Publish report after building.")
@click.option('-t', is_flag=True, help="Use pdflatex to typeset report.")
@click.option('-v', is_flag=True, help="Verbose pdflatex console output.")


def matlabreport(outline, report_m, pubformat, funcs, p, t, v):
    """
    Make a MATLAB report m-file, and optionally publish it.
    """

    makeReport(outline, report_m, funcs)

    if p is True:
        publishMfile(report_m, pubformat, t, v)
