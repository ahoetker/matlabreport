# matlabreport.py - Click interface to publish MATLAB reports

import click
import os
from matlabreport.makereport import makeReport
from matlabreport.publishmfile import publishMfile
from matlabreport.openreport import openReport


@click.command()
@click.option("--pubformat", default="html")
@click.option("--funcs", is_flag=True, help="Append user functions.")
@click.option("-p", is_flag=True, help="Publish report after building.")
@click.option("-t", is_flag=True, help="Use pdflatex to typeset report.")
@click.option("-v", is_flag=True, help="Verbose pdflatex console output.")
@click.option("-s", is_flag=True, help="Show published report.")
def autoreport(pubformat, funcs, p, t, v, s):
    """
    Make a MATLAB report m-file, and optionally publish it.
    """
    outline = os.path.join(".", "outline.yml")
    report_m = os.path.join(".", "report.m")
    makeReport(outline, report_m, funcs, auto=True)

    if p is True:
        published_report = publishMfile(report_m, pubformat, t, v)

        if s is True:
            openReport(published_report)
