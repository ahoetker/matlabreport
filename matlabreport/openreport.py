# openreport.py - open the published report for viewing

import os
from sys import platform
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
    If PDFVIEWER is not defined, macOS will use Preview.app
    Other platforms will fall back to the webbrowser module.
    """
    pdf_viewer = os.getenv("PDFVIEWER")

    if pdf_viewer != None:
        try:
            Popen([pdf_viewer, report])
        except FileNotFoundError:
            fallbackPDF(report)
    else:
        fallbackPDF(report)


def fallbackPDF(report):
    if platform == 'darwin':
        Popen(['open', '-a', 'Preview.app', report])
    else:
        webbrowser.open('file://' + report)
