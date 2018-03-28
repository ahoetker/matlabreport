# publishmfile.py - use MATLAB engine to publish the report mfile

import os
import subprocess
import matlab.engine


def publishMfile(mfile, pubformat, t, v):

    if pubformat not in ["html", "pdf", "latex", "xml"]:
        raise AttributeError("{} is not a valid format.".format(pubformat))

    wd, mfilename = os.path.split(mfile)

    eng = startEngine()
    eng.cd(wd)
    print("Publishing {} with format {}...".format(mfilename, pubformat))
    eng.publish(mfile, pubformat)
    eng.quit()
    print("Publishing complete")

    if pubformat == "latex" and t is True:
        filename = os.path.splitext(os.path.split(mfile)[1])[0] + ".tex"
        texfile = os.path.join(wd, "html", filename)
        typeset(texfile, v)


def startEngine():
    if len(matlab.engine.find_matlab()) > 0:
        print("Connecting to shared MATLAB engine...")
        eng = matlab.engine.connect_matlab()
        print("Connected to {}".format(eng.matlab.engine.engineName()))
    else:
        print("No MATLAB engine found, starting new engine...")
        eng = matlab.engine.start_matlab()
        print("MATLAB engine started")

    return eng


def typeset(texfile, v):
    os.chdir('html')
    if v is True:
        subprocess.call(['pdflatex', texfile], shell=False)
    else:
        devnull = open(os.devnull, 'w')
        subprocess.call(['pdflatex', texfile], shell=False, stdout=devnull)

    print("Typesetting complete (pdflatex)")
