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
    ~ s:canvas/
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:canvas " mode="s:layout">
        <div class="container">
            <xsl:if test=" s:actionGroup[ @docked = 'true' ] ">
                <xsl:attribute name="style">margin-bottom: 50px;</xsl:attribute>
            </xsl:if>

            <xsl:apply-templates select=" * " mode="s:layout">
                <xsl:with-param name="d:path" select=" '' " />
            </xsl:apply-templates>

            <pre>{{ $data | json }}</pre>
        </div>

        <xsl:apply-templates select=" s:actionGroup[ @docked = 'true' ] " mode="s:docked">
            <xsl:with-param name="d:path" select=" '' " />
        </xsl:apply-templates>
    </xsl:template>


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ Default template for 's:layout'.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:* " mode="s:layout">
        <div class="s-render-error">
            <xsl:text>ERR001: There is no s:layout template for '</xsl:text>
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
