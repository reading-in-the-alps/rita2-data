# rita2-data

This repo contains xml-tei data created in the project ["Reading in the Alps"](https://www.oeaw.ac.at/acdh/projects/rita/)

## structure

### ./word

contains transcriptions in `.docx` format provided by [Michael Prokosch](https://github.com/orgs/reading-in-the-alps/people/mprokosch)

### ./oxgarageOut

contains the result of bulk processing `/word/*.docx` with `DOCX TEI P5` oxygen transformation scenario

#### ./excel

contains the with oxgarage transformed Excel sheets; before the transformation search and replace of line breaks was performed as described [here](https://contexturesblog.com/archives/2013/05/28/find-and-replace-line-breaks-in-excel/)

### ./data/inventare

contains the data from ./excel which were transformed with `xsl/excel_to_summary.xsl`


### verfachbuchregesten.csv

this dataset was created via https://rita-vfbr.acdh-dev.oeaw.ac.at/summaries/verfachbucheintraege/?columns=located_in&columns=start_page&columns=end_page&columns=vollregest&columns=book&columns=trp_page_nr_start&columns=trp_page_nr_end&columns=mentioned_person&vollregest=&entry_signatur=&located_in__year_after=&located_in__year_before=&book=unknown&inventory=unknown&Filter=Search&sort=id