# AtoM documentation

[Access to Memory](https://www.accesstomemory.org/) is a web-based, open source
application for standards-based archival description and access in a
multilingual, multi-repository environment.  Our target users are archivists,
librarians, and anyone working to describe and provide access to archival
material. This repository holds the documentation for the AtoM project,
including the User, Administrator, and Developer Manuals.

## About the AtoM docs

The AtoM documentation can be found on the Access to Memory website, at:

* https://www.accesstomemory.org/docs

We version the documentation for each major AtoM release. The docs are written
in reStructured Text
([reST](http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html)),
and generated using the [Sphinx documentation
generator](http://www.sphinx-doc.org/). Learn more about our documentation here:

* https://wiki.accesstomemory.org/Resources/Documentation/About

You are free to copy, modify, and distribute the AtoM documentation with
attribution under the terms of the Creative Commons Attribution Share Alike 4.0
(CC-BY-SA-4.0) license.  See the [LICENCE](LICENCE) file for details.

## Building the documentation locally

To build a local, offline version of the documentation:

* Decide where the documentation will be stored on your computer.
* In a Terminal window, use the `cd` command to navigate to this location.
* Create a local copy of the documentation by running:

```bash
git clone https://github.com/artefactual/atom-docs.git
```

* Move to the documentation repository with:

```bash
cd atom-docs
```

* Create a Python virtual environment to contain all the required tools:

```bash
python3 -m venv .env
```

* Activate the virtual environment:

```bash
source .env/bin/activate
```

* Install the requirements:

```bash
pip install -r requirements.txt
```

* Build the documentation:

```bash
sphinx-build -D language=en ./ _build/html/en # for English
```

* Access the documentation:

```bash
python3 -m http.server -d _build/html/
```

The HTML files for the documentation will be in
`atom/_build/html/`.
You can open the files in a browser of your choice, without having any access
to the Internet, by accessing `http://localhost:8000`.

While this offline version will not have the AtoM web theme, you will
gain access to improved search features.

## Contributing

Thank you for considering a contribution to the AtoM documentation!  For more
information on contributing, please see the documentation pages on our [AtoM
wiki](https://wiki.accesstomemory.org/Resources/Documentation).  The wiki
describes our AtoM documentation, gives instructions on how to contribute to the
documentation, and includes a tutorial and style guide of best practices for new
contributions.  Following these guidelines helps us assess your changes faster
and makes it easier for us to merge your submission.

## Code of Conduct

As contributors and maintainers of AtoM, we at Artefactual pledge to respect all
people who contribute through reporting issues, posting feature requests,
updating documentation, submitting pull requests or patches, and other
activities, including participating in our User Forum.

We are committed to making participation in the AtoM project a harassment-free
experience for everyone, regardless of level of experience, sex, gender identity
and expression, sexual orientation, ability, personal appearance, body size,
race, age, or religion.

Examples of unacceptable behavior by participants include the use of sexual
language or imagery, derogatory comments or personal attacks, trolling, public
or private harassment, insults, or other unprofessional conduct.

Project maintainers have the right and responsibility to remove, edit, or reject
comments, commits, code, wiki edits, issues, Forum posts, and other
contributions that are not aligned to this Code of Conduct. Project maintainers
who do not follow the Code of Conduct may be removed from the project team.

**If you feel you've encountered instances of abusive, harassing, or otherwise
unacceptable behavior, [please let us know](mailto:info@artefactual.com).**
