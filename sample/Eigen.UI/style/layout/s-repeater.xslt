<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:s="urn:rhenium-screen"
    xmlns:d="urn:rhenium-data"
    xmlns:l="urn:rhenium-localization"
    xmlns:v="urn:rhenium-validation"
    xmlns:v-bind="urn:vue"
    exclude-result-prefixes="msxsl s d l v v-bind">


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ s:repeater
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:repeater " mode="s:layout">
        <xsl:param name="d:path" />

        <div>
            <xsl:attribute name="v-for">
                <xsl:text>( </xsl:text>
                <xsl:value-of select=" generate-id(.) " />
                <xsl:text>, </xsl:text>
                <xsl:value-of select=" @d:item " />
                <xsl:text> ) in </xsl:text>
                <xsl:value-of select=" @d:items " />
            </xsl:attribute>

            <xsl:apply-templates select=" * " mode="s:layout">
                <xsl:with-param name="d:path">
                    <xsl:value-of select=" $d:path " />
                    <xsl:value-of select=" generate-id(.) " />
                    <xsl:text>_{{ </xsl:text>
                    <xsl:value-of select=" generate-id(.) " />
                    <xsl:text> }}_</xsl:text>
                </xsl:with-param>
            </xsl:apply-templates>
        </div>
    </xsl:template>

</xsl:stylesheet>
