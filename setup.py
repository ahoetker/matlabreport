from setuptools import setup, find_packages

setup(
    name="matlabreport",
    version="0.5.0",
    description="Make and publish MATLAB reports.",
    url="https://github.com/ahoetker/matlabreport",
    author="Andrew Hoetker",
    author_email="ahoetker@me.com",
    install_requires=["Click", "pyaml"],
    entry_points="""
        [console_scripts]
        matlabreport=matlabreport.scripts.matlabreport:matlabreport
        autoreport=matlabreport.scripts.autoreport:autoreport
      """,
    packages=find_packages(),
    zip_safe=False,
)
