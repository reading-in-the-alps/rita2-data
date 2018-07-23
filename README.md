# rita2-data

This repo cotains xml-tei data created in the project ["Reading in the Alps"](https://www.oeaw.ac.at/acdh/projects/rita/)

## structure

### ./word

contains transcriptions in `.docx` format provided by [Michael Prokosch](https://github.com/orgs/reading-in-the-alps/people/mprokosch)

### ./oxgarageOut

contains the result of bulk processing `/word/*.docx` with `DOCX TEI P5` oxygen transformation scenario

## annotation guidelines

**person:**

* in case name + role is mentioned, annotate name only; in case only role is mentioned, annotate role as person
* *Hansen*, *Josephen*, *Christophen* annotated as *Hans*, *Joseph*, *Christoph*
* *Ännä Pirchnerin* annotated as *pirchner_aennae*
* saints (*Johan*, *Franciscus*, *Mariä*) are not to be annotated

**place:** 

* place names, e.g. in *Seckhlermaister zu Ratenberg* are to be annotated
* in case a place name is mentioned as part of an organizational name, the place name is not to be annotated, e.g. *Salzburg* in *Erzbistumb Salzburg*, *Brixen* in *Stüffts Brixen*