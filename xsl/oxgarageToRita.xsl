<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>


    <xsl:variable name="filename">
        <xsl:value-of select="tokenize(base-uri(), '/')[last()]"/>
    </xsl:variable>

    <xsl:variable name="orig-date">
        <xsl:value-of select="substring-before($filename, '.xml')"/>
    </xsl:variable>

    <xsl:variable name="year">
        <xsl:value-of select="tokenize($orig-date, '_')[1]"/>
    </xsl:variable>

    <xsl:variable name="mo">
        <xsl:value-of select="tokenize($orig-date, '_')[2]"/>
    </xsl:variable>

    <xsl:variable name="day">
        <xsl:value-of select="format-number(number(tokenize($orig-date, '_')[3]), '00')"/>
    </xsl:variable>

    <xsl:variable name="mo-iso">
        <xsl:choose>
            <xsl:when test="$mo = 'I'">01</xsl:when>
            <xsl:when test="$mo = 'II'">02</xsl:when>
            <xsl:when test="$mo = 'III'">03</xsl:when>
            <xsl:when test="$mo = 'IV'">04</xsl:when>
            <xsl:when test="$mo = 'V'">05</xsl:when>
            <xsl:when test="$mo = 'VI'">06</xsl:when>
            <xsl:when test="$mo = 'VII'">07</xsl:when>
            <xsl:when test="$mo = 'VIII'">08</xsl:when>
            <xsl:when test="$mo = 'IX'">09</xsl:when>
            <xsl:when test="$mo = 'X'">10</xsl:when>
            <xsl:when test="$mo = 'XI'">11</xsl:when>
            <xsl:when test="$mo = 'XII'">12</xsl:when>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="date-good">
        <xsl:value-of select="string-join( ($year, $mo-iso, $day), '-')"/>
    </xsl:variable>

    <xsl:variable name="startpage">
        <xsl:variable name="pagenumber">
            <xsl:value-of select=".//tei:p[starts-with(., '[fol. ')][1]"/>
        </xsl:variable>
        <xsl:value-of select="substring-after(substring-before($pagenumber, ']'), '[fol. ')"/>
    </xsl:variable>

    <xsl:variable name="endpage">
        <xsl:variable name="pagenumber">
            <xsl:value-of select=".//tei:p[starts-with(., '[fol. ')][last()]"/>
        </xsl:variable>
        <xsl:value-of select="substring-after(substring-before($pagenumber, ']'), '[fol. ')"/>
    </xsl:variable>


    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="tei:head"/>

    <xsl:template match="tei:hi[@rend='background(yellow)']">
        <unclear><xsl:apply-templates/></unclear>
    </xsl:template>

    <xsl:template match="tei:note">
        <note><xsl:apply-templates select="./*"/></note>
    </xsl:template>

    <xsl:template match="tei:anchor"/>

    <xsl:template match="tei:hi[@rend='background(darkGray)']">
        <xsl:variable name="pagenumber">
            <xsl:value-of select="substring-after(./text(), 'fol. ')"/>
        </xsl:variable>
        <pb n="{substring-before($pagenumber, ']')}"/>
    </xsl:template>

    <xsl:template match="tei:hi[@rend='background(green)']">
        <rs type="person"><xsl:apply-templates/></rs>
    </xsl:template>

    <xsl:template match="tei:hi[@rend='background(magenta)']">
        <rs type="place"><xsl:apply-templates/></rs>
    </xsl:template>

    <xsl:template match="tei:hi[@rend='background(red)']">
        <rs type="book"><xsl:apply-templates/></rs>
    </xsl:template>

    <xsl:template match="tei:teiHeader">
        <teiHeader>
<!--            <startpage><xsl:value-of select="$startpage"/></startpage>
            <filename><xsl:value-of select="$filename"/></filename>
            <dategood><xsl:value-of select="$date-good"/></dategood>
            <day><xsl:value-of select="$day"/></day>
            <moiso><xsl:value-of select="$mo-iso"/></moiso>
            <year><xsl:value-of select="$year"/></year>-->
            <fileDesc>
                <titleStmt>
                    <title>
                        <xsl:value-of select="//tei:head[1]"/>
                    </title>
                    <respStmt>
                        <resp>Transkription und Annotation</resp>
                        <name><rs type="person" ref="#prokosch_michael">Michael Prokosch</rs></name>
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
                    <msDesc type="inventory">
                        <msIdentifier>
                            <institution>Südtiroler Landesarchiv (SLA)</institution>
                            <repository>Verfachbücher Landgericht St. Michaelsburg</repository>
                            <idno>1762 I 28</idno>
                        </msIdentifier>
                        <msContents>
                            <msItem>
                                <locus from="{$startpage}" to="{$endpage}"/>
                                <note>
                                    <rs type="skos" ref="#inventar">Inventar</rs>
                                </note>
                            </msItem>
                        </msContents>
                        <history>
                            <origin notBefore="{$date-good}">
                                <rs type="place" ref="st_lorenzen">St. Lorenzen</rs>
                            </origin>
                        </history>
                    </msDesc>
                </sourceDesc>
            </fileDesc>
            <encodingDesc>
                <p>
                    <xsl:element name="xi:include" xmlns:xi="http://www.w3.org/2001/XInclude">
                        <xsl:attribute name="href">../indices/listperson.xml</xsl:attribute>
                        <xsl:attribute name="xpointer">listperson</xsl:attribute>
                        <xsl:element name="fallback" namespace="http://www.w3.org/2001/XInclude">
                            <p>File to include couldn't be found</p>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="xi:include" xmlns:xi="http://www.w3.org/2001/XInclude">
                        <xsl:attribute name="href">../indices/listplace.xml</xsl:attribute>
                        <xsl:attribute name="xpointer">listplace</xsl:attribute>
                        <xsl:element name="fallback" namespace="http://www.w3.org/2001/XInclude">
                            <p>File to include couldn't be found</p>
                        </xsl:element>
                    </xsl:element>
                </p>
            </encodingDesc>
        </teiHeader>
    </xsl:template>

    <xsl:template match="tei:p/text()">
        <xsl:analyze-string select="." regex="\[fol. .*\]">
            <xsl:matching-substring>
                <xsl:variable name="pagenumber">
                    <xsl:value-of select="normalize-space(substring-after(., '[fol.'))"/>
                </xsl:variable>
                <pb>
                    <xsl:attribute name="n">
                        <xsl:value-of select="substring-before($pagenumber, ']')"/>
                    </xsl:attribute>
                </pb>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>

</xsl:stylesheet>
