# rita2-data

This is mainly a temparay repo set up to process .docx files towards TEI-docs.

## workflow

1. split the main source file `source/Transkriptionen Geistliche_14112017.docx` manualy (copy&paste) and store them a single files in `source/splitted`. Be aware that the content of this directory was set on gitignore. Save the file as e.g. `1762-I-28.docx`. This means basically don't use whitespace or any special characters.

2. Process the splitted files via Oxgarage into TEI-P5 files. Therefore

 * go to [http://oxgarage.oucs.ox.ac.uk:8080/ege-webclient/](http://oxgarage.oucs.ox.ac.uk:8080/ege-webclient/)
 * select for `Convert from`: 'Documents' -> Microsoft Word (.docx)
  * select for `Convert to`: 'TEI P5 XML Document'
  * upload on of the splitted files (`Choose File`)
  * click `Convert`
  * and save the downloaded file in `oxgarageOut`. The filename should be the same as from the file you uploaded but with `.xml` extension.

### next steps

1. Bulk transform the content of the directory `oxgarageOut` with `xsl/TEI P5 XML Document` into semantically more meaningful TEI-Files

2. Flesh out the TEI-Header

3. Entity linking.

Ideally steps 2 and 3 will be done based on [dsebaseapp](https://github.com/KONDE-AT/dsebaseapp)
