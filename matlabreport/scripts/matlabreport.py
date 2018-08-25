# matlabreport.py - Click interface to publish MATLAB reports

import click
from matlabreport.makereport import makeReport
from matlabreport.publishmfile import publishMfile
from matlabreport.openreport import openReport


@click.command()
@click.argument("outline", type=click.Path(resolve_path=True))
@click.argument("report_m", type=click.Path(resolve_path=True))
@click.option("--pubformat", default="html")
@click.option("--funcs", is_flag=True, help="Append user functions.")
@click.option("--auto", is_flag=True, help="Automatically generate outline.")
@click.option("-p", is_flag=True, help="Publish report after building.")
@click.option("-t", is_flag=True, help="Use pdflatex to typeset report.")
@click.option("-v", is_flag=True, help="Verbose pdflatex console output.")
@click.option("-s", is_flag=True, help="Show published report.")
def matlabreport(outline, report_m, pubformat, funcs, auto, p, t, v, s):
    """
    Make a MATLAB report m-file, and optionally publish it.
    """

    makeReport(outline, report_m, funcs, auto)

    if p is True:
        published_report = publishMfile(report_m, pubformat, t, v)

        if s is True:
            openReport(published_report)
