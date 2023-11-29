<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei"
    xmlns:dlclcf="http://whatever"
    version="2.0">
    
    
    
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" encoding="UTF-8"/>
    
    
    <xsl:param name="baseHref"/>
    <xsl:param name="css" select="'epistolario.css'"/>
    
    <xsl:template name="htmlHead">
        <head>
            <meta charset="UTF-8"/>         
            <link id="css" rel="stylesheet" type="text/css" href="{$css}"/>
        </head>
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:result-document href="html/epistolario.html">
            <html>
                <xsl:call-template name="htmlHead"/>
                <body>
                    <section class="tei_transcription">
                        <xsl:copy>
                            <xsl:apply-templates select="//tei:text"/>
                        </xsl:copy>
                    </section>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- <xsl:template match="tei:teiHeader"/> -->
    
    <xsl:preserve-space elements="tei:closer tei:opener"/>
    
    <xsl:template match="tei:opener">
        <xsl:element name="div">
            <xsl:apply-templates select="@xml:id"/>
            <xsl:attribute name="class">
                <xsl:value-of select="'teiLetter_opener'"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:salute">
        <xsl:choose>
            <xsl:when test="parent::node()/name() = 'opener'">
                <xsl:element name="p">
                    <xsl:apply-templates select="@xml:id"/>
                    <xsl:attribute name="class">teiLetter_salute</xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="@rend='inline'">
                            <xsl:attribute name="style">display:inline;</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="@rend='right'">
                            <xsl:attribute name="style">text-align:right;</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="@rend='left'">
                            <xsl:attribute name="style">text-align:left;</xsl:attribute>
                        </xsl:when>
                        <!--<xsl:otherwise>
                            <p class="teiLetter_undefined">
                            <xsl:apply-templates />
                            </p>
                            </xsl:otherwise>-->
                    </xsl:choose>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="parent::node()/name() = 'closer'">
                <xsl:apply-templates/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates select="@* | node()"/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:persName">
        <xsl:choose>
            <xsl:when test="@ref">
                <xsl:variable name="pers-id">
                    <xsl:value-of select="substring-after(@ref, '#')"/>
                </xsl:variable>
                <a class="tooltip persName">
                    <xsl:attribute name="href" select="concat(dlclcf:join-path-elements(($baseHref, 'entities', 'people', $pers-id)),'.html')"/>
                    <xsl:apply-templates select="@*"/> 
                    <span class="tooltiptext">
                       <xsl:value-of select="//tei:person[@xml:id = $pers-id]/tei:persName[1]"/>
                    </span>
                    <xsl:value-of select="node()"/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <span class="persName">
                    <xsl:apply-templates select="@*"/>
                    <xsl:value-of select="node()"/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:rs[@type='person']">
        <xsl:choose>
            <xsl:when test="@ref">
                <xsl:variable name="pers-id">
                    <xsl:value-of select="substring-after(@ref, '#')"/>
                </xsl:variable>
                <a class="tooltip persName">
                    <xsl:attribute name="href" select="concat(dlclcf:join-path-elements(($baseHref, 'entities', 'people', $pers-id)),'.html')"/>
                    <xsl:apply-templates select="@*"/> 
                    <span class="tooltiptext">
                        <xsl:value-of select="//tei:person[@xml:id = $pers-id]/tei:persName[1]"/>
                    </span>
                    <xsl:value-of select="node()"/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <span class="persName">
                    <xsl:apply-templates select="@*"/>
                    <xsl:value-of select="node()"/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:placeName">
        <xsl:choose>
            <xsl:when test="@ref">
                <xsl:variable name="place-id">
                    <xsl:value-of select="substring-after(@ref, '#')"/>
                </xsl:variable>
                <a class="tooltip placeName">
                    <xsl:attribute name="href" select="concat(dlclcf:join-path-elements(($baseHref, 'entities', 'places', $place-id)),'.html')"/>
                    <xsl:apply-templates select="@*"/> 
                    <span class="tooltiptext">
                        <xsl:value-of select="//tei:place[@xml:id = $place-id]/tei:placeName[1]"/>
                    </span>
                    <xsl:value-of select="node()"/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <span class="placeName">
                    <xsl:apply-templates select="@*"/>
                    <xsl:value-of select="node()"/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="tei:orgName">
        <xsl:choose>
            <xsl:when test="@ref">
                <xsl:variable name="org-id">
                    <xsl:value-of select="substring-after(@ref, '#')"/>
                </xsl:variable>
                <a class="tooltip orgName">
                    <xsl:attribute name="href" select="concat(dlclcf:join-path-elements(($baseHref, 'entities', 'orgs', $org-id)),'.html')"/>
                    <xsl:apply-templates select="@*"/> 
                    <span class="tooltiptext">
                        <xsl:value-of select="//tei:org[@xml:id = $org-id]/tei:orgName[1]"/>
                    </span>
                    <xsl:value-of select="node()"/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <span class="orgName">
                    <xsl:apply-templates select="@*"/>
                    <xsl:value-of select="node()"/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <xsl:choose>
            <xsl:when test="@ref">
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@type='print'">
                        <span class="bibl print">
                            <xsl:apply-templates select="@*"/>
                            <xsl:value-of select="node()"/>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='manuscript'">
                        <span class="bibl manuscript">
                            <xsl:apply-templates select="@*"/>
                            <xsl:value-of select="node()"/>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <span class="bibl">
                            <xsl:apply-templates select="@* | node()"/>
                        </span>
                    </xsl:otherwise>
                </xsl:choose>
                
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="@*">
        <xsl:choose>
            <xsl:when test="name() = 'xml:id'">
                <xsl:attribute name="id">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test="name() = 'xml:lang'">
                <xsl:attribute name="lang">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="{concat('data-', name())}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:function name="dlclcf:join-path-elements" as="xs:string">
        <xsl:param name="elements" as="xs:string*"/>
        <xsl:value-of select="replace(string-join(('/', $elements), '/'), '/+', '/')"/>
    </xsl:function>
    
</xsl:stylesheet>