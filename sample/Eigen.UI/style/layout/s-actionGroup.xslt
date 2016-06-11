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
    ~ s:actionGroup/
    ~ Normal, inline.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:actionGroup " mode="s:layout">
        <div class="s-actionGroup">
            <xsl:apply-templates select=" s:action " mode="s:layout" />
        </div>
    </xsl:template>

    <xsl:template match=" s:actionGroup[ @docked = 'true' ] " mode="s:layout" />


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ s:actionGroup/
    ~ Docked to the bottom of the page.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:actionGroup[ @docked = 'true' ] " mode="s:docked">
        <div class="s-actionGroup s-docked">
            <xsl:apply-templates select=" s:action " mode="s:layout" />
        </div>
    </xsl:template>

</xsl:stylesheet>
