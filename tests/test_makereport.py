import pytest
import os
import pkg_resources
from matlabreport.makereport import makeReport

def test_makereport():
    # define the resources directory
    resources = pkg_resources.resource_filename("resources", "")
    # define the outline markup file
    outline_file = os.path.join(resources, "outline.yml")
    # Create the file to write report.m to
    report = os.path.join(resources, "tempreport.m")
    os.chdir(resources)
    makeReport(outline_file, report, funcs=False)
    # test condition: was tempreport.m correctly generated?
    with open(report, 'r') as f1:
        with open(os.path.join(resources, "homework_01.m"), 'r') as f2:
            assert f1.read() == f2.read()
    os.remove(report)
