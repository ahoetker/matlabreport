# matlabreport.py - Click interface to publish MATLAB reports

import click
import os
from matlabreport.makereport import makeReport
from matlabreport.publishmfile import publishMfile
from matlabreport.openreport import openReport


@click.command()
@click.option("--pubformat", default="html")
@click.option("--cleanup", default=True)
@click.option("--funcs", is_flag=True, help="Append user functions.")
@click.option("-p", is_flag=True, help="Publish report after building.")
@click.option("-t", is_flag=True, help="Use pdflatex to typeset report.")
@click.option("-v", is_flag=True, help="Verbose pdflatex console output.")
@click.option("-s", is_flag=True, help="Show published report.")
def autoreport(pubformat, funcs, cleanup, p, t, v, s):
    """
    Make a MATLAB report m-file, and optionally publish it.
    """
    outline = os.path.abspath(os.path.join(".", "outline.json"))
    report_m = os.path.abspath(os.path.join(".", "report.m"))

    makeReport(outline, report_m, funcs, auto=True)

    if p is True:
        published_report = publishMfile(report_m, pubformat, t, v)

        if s is True:
            openReport(published_report)

    if cleanup is True:
        htmldir = os.path.join(os.path.split(outline)[0], "html")
        os.remove(outline)
        os.remove(report_m)

        if pubformat == "latex" and t is True:
            extensions = [".log", ".tex", ".aux"]
            for file in os.listdir(htmldir):
                if os.path.splitext(file)[1] in extensions:
                    os.remove(file)
