# openreport.py - open the published report for viewing

import os
import webbrowser
from subprocess import Popen


def openReport(report):
    """
    Open report for viewing. This function calls specific
    viewing functions based on format.

    Please use these environment variables, otherwise defaults
    will be used:
        BROWSER
        PDFVIEWER
        EDITOR
    """
    file_ext = os.path.splitext(report)[1]

    if file_ext == '.html':
        openHTML(report)
    elif file_ext == '.pdf':
        openPDF(report)
    else:
        print("Unsupported filetype: {}".format(file_ext))


def openHTML(report):
    webbrowser.open('file://' + report)


def openPDF(report):
    """
    Open report.pdf using /env/PDFVIEWER .

    If PDFVIEWER is not defined, or cannot be called, falls back
    to webbrowser module.
    """
    pdf_viewer = os.getenv("PDFVIEWER")

    if pdf_viewer != None:
        try:
            Popen([pdf_viewer, report])
        except FileNotFoundError:
            webbrowser.open('file://' + report)
    else:
        webbrowser.open('file://' + report)
