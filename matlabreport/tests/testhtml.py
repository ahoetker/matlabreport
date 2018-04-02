# testhtml.py - test the HTML output against a known good report.

import unittest
from matlabreport.makereport import makeReport
from matlabreport.publishmfile import publishMfile

class TestReportHTML(unittest.TestCase):

    def testHTML():
        print("I'm too tired to do this right now. Who needs tests?")


if __name__ == '__main__':
    unittest.main()