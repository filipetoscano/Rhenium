<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:s="urn:rhenium-screen"
    xmlns:d="urn:rhenium-data"
    xmlns:l="urn:rhenium-localization"
    xmlns:v="urn:rhenium-validation"
    exclude-result-prefixes="msxsl s d l v">


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ 'Field' is a generic template for *anything* which is being bound
    ~ directly to data.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:*[ @d:value ] " mode="s:layout">
        <div>
            <div>
                <xsl:variable name="elementName">
                    <xsl:choose>
                        <xsl:when test=" @input = 'true' ">
                            <xsl:text>label</xsl:text>
                        </xsl:when>

                        <xsl:otherwise>
                            <xsl:text>span</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <xsl:element name="{ $elementName }">
                    <xsl:attribute name="data-ltoken">
                        <xsl:value-of select=" @l:label "/>
                    </xsl:attribute>

                    <xsl:value-of select=" @l:label " />
                </xsl:element>
            </div>

            <div>
                <xsl:apply-templates select=" . " mode="s:value" />
            </div>
        </div>
    </xsl:template>


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ Default template for 's:value'.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:* " mode="s:value">
        <div class="s-render-error">
            <xsl:text>ERR002: There is no s:value template for '</xsl:text>
            <xsl:choose>
                <xsl:when test=" namespace-uri(.) = 'urn:rhenium-screen' ">
                    <xsl:text>s</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select=" substring-before( name(), ':' ) " />
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>:</xsl:text>
            <xsl:value-of select=" local-name(.) " />
            <xsl:text>'.</xsl:text>
        </div>
    </xsl:template>


</xsl:stylesheet>
