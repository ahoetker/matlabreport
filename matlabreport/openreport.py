# openreport.py - open the published report for viewing

import os
import webbrowser
from subprocess import Popen, call


def openReport(report):
    """
    Open report for viewing. This function calls specific
    viewing functions based on format.

    Please use these environment variables, otherwise defaults
    will be used:
        PDFVIEWER
        EDITOR
    """
    file_ext = os.path.splitext(report)[1]

    if file_ext == '.html':
        openHTML(report)
    elif file_ext == '.pdf':
        openPDF(report)
    elif file_ext == '.xml':
        openXML(report)
    elif file_ext == '.tex':
        openTEX(report)
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
    devnull = open(os.devnull, 'w')

    if pdf_viewer != None:
        try:
            Popen([pdf_viewer, report], stderr=devnull, stdout=devnull)
        except FileNotFoundError:
            webbrowser.open('file://' + report)
    else:
        webbrowser.open('file://' + report)


def openXML(report):
    editor = os.getenv("EDITOR")

    if editor != None:
        try:
            Popen([editor, report])
        except FileNotFoundError:
            webbrowser.open('file://' + report)
    else:
        webbrowser.open('file://' + report)

def openTEX(report):
    editor = os.getenv("EDITOR")

    if editor != None:
        Popen([editor, report])
    else:
        print("/env/EDITOR not defined, LaTeX cannot be displayed.")
