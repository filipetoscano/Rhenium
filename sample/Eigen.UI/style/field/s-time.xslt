<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:r="urn:rhenium"
    xmlns:s="urn:rhenium-screen"
    xmlns:d="urn:rhenium-data"
    xmlns:l="urn:rhenium-localization"
    xmlns:v="urn:rhenium-validation"
    exclude-result-prefixes="msxsl r s d l v">


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ Display.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:time " mode="s:value">
        <p class="form-control-static">
            <xsl:text>{{ </xsl:text>
            <xsl:value-of select=" @d:value " />
            <xsl:text> | toTime }}</xsl:text>
        </p>
    </xsl:template>

</xsl:stylesheet>
