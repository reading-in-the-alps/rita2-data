<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:variable name="filename">
        <xsl:value-of select="tokenize(base-uri(), '/')[last()]"/>
    </xsl:variable>
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Statistische Auswertung der <xsl:value-of select="$filename"/></title>
                        <respStmt>
                            <resp>Sichtung des Quellenbestandes und Erstellung der Auswertung</resp>
                            <name>
                                <rs type="person" ref="#span_michael">Michael Span und Michael Prokosch</rs>
                            </name>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <publisher>Reading in the Alps</publisher>
                        <availability>
                            <licence target="https://creativecommons.org/licenses/by-sa/4.0/">
                                <p>The (CC BY-SA 4.0)-License applies to this document.</p>
                                <p>You are allowed to share (copy and redistribute the material in any medium or format) and adapt (remix, transform, and build upon the material) for any purpose, even commercially.</p>
                                <p>You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.</p>
                                <p>ShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.</p>
                            </licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Konversion einer Excel-Tabelle mittels http://oxgarage.tei-c.org/ zu TEI P5 XML Document</p>
                        <p>Weitere Transformation mittels xsl/excel_to_summary.xsl</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <table xml:id="myTable">
                        <row style="header">
                            <cell>Signatur</cell>
                            <cell>Name(Erklärung aus Verfachbuch)</cell>
                            <cell>Dokumententypus</cell>
                            <cell>Beruf</cell>
                            <cell>Wohnort; Ort des betreffenden Gutes/der betreffenden Behausung</cell>
                            <cell>Ort der Amtshandlung</cell>
                            <cell>Datum der Amtshandlung</cell>
                            <cell>Beteiligte Personen (Beamte, Gerichtsverpflichtete, Zeugen, ...)</cell>
                            <cell>Beteiligte Personen (Erbsinteressenten, Gerhaben, Anweiser, Verkäufer,
                                Verpächter, Käufer, Pächter, ...)</cell>
                            <cell>Genannte Personen</cell>
                            <cell>Summe Inventar</cell>
                            <cell>Barschaft (teilweise eigene Berechnung)</cell>
                            <cell>Gesamtsumme Vermögen (vor Abzug der Passiva)</cell>
                            <cell>Gesamtsumme Vermögen (nach Abzug der Passiva)</cell>
                            <cell>Kaufpreis</cell>
                            <cell>Pacht</cell>
                            <cell>Buch/Bücher</cell>
                            <cell>Foto von</cell>
                            <cell>bis Foto</cell>
                            <cell>[empty]</cell>
                            <cell>[empty]</cell>
                            <cell>Gulden Inventarsumme</cell>
                            <cell>Kreuzer Inventarsumme</cell>
                            <cell>[empty]</cell>
                            <cell>Gulden vor Abzug Passiva</cell>
                            <cell>Kreuzer vor Abzug Passiva</cell>
                            <cell>[empty]</cell>
                            <cell>Gulden nach Abzug Passiva</cell>
                            <cell>Kreuzer nach Abzug Passiva</cell>
                        </row>
                        <xsl:for-each select="//tei:row[not(@n='1') and count(.//tei:cell) gt 20]">
                            <row>
                                <xsl:apply-templates/>
                            </row>
                        </xsl:for-each>
                        <row style="footer">
                            <cell>Signatur</cell>
                            <cell>Name(Erklärung aus Verfachbuch)</cell>
                            <cell>Dokumententypus</cell>
                            <cell>Beruf</cell>
                            <cell>Wohnort; Ort des betreffenden Gutes/der betreffenden Behausung</cell>
                            <cell>Ort der Amtshandlung</cell>
                            <cell>Datum der Amtshandlung</cell>
                            <cell>Beteiligte Personen (Beamte, Gerichtsverpflichtete, Zeugen, ...)</cell>
                            <cell>Beteiligte Personen (Erbsinteressenten, Gerhaben, Anweiser, Verkäufer,
                                Verpächter, Käufer, Pächter, ...)</cell>
                            <cell>Genannte Personen</cell>
                            <cell>Summe Inventar</cell>
                            <cell>Barschaft (teilweise eigene Berechnung)</cell>
                            <cell>Gesamtsumme Vermögen (vor Abzug der Passiva)</cell>
                            <cell>Gesamtsumme Vermögen (nach Abzug der Passiva)</cell>
                            <cell>Kaufpreis</cell>
                            <cell>Pacht</cell>
                            <cell>Buch/Bücher</cell>
                            <cell>Foto von</cell>
                            <cell>bis Foto</cell>
                            <cell>[empty]</cell>
                            <cell>[empty]</cell>
                            <cell>Gulden Inventarsumme</cell>
                            <cell>Kreuzer Inventarsumme</cell>
                            <cell>[empty]</cell>
                            <cell>Gulden vor Abzug Passiva</cell>
                            <cell>Kreuzer vor Abzug Passiva</cell>
                            <cell>[empty]</cell>
                            <cell>Gulden nach Abzug Passiva</cell>
                            <cell>Kreuzer nach Abzug Passiva</cell>
                        </row>
                    </table>
                </body>
            </text>
        </TEI>
    </xsl:template>
    <xsl:template match="tei:cell[not(./text())]">
        <cell>empty</cell>
    </xsl:template>
    <xsl:template match="@* | *">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="#">
            <xsl:matching-substring><lb/></xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
</xsl:stylesheet>