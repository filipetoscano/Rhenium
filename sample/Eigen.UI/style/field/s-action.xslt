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
    ~ Action.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:action " mode="s:layout">
        <button type="button" class="btn btn-primary">
            <xsl:choose>
                <xsl:when test=" @style ">
                    <xsl:attribute name="class">
                        <xsl:text>btn btn-</xsl:text>
                        <xsl:value-of select=" @style " />
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>

            <xsl:if test=" @icon ">
                <i class="fa fa-{ @icon }" />
                <xsl:text> </xsl:text>
            </xsl:if>

            <xsl:value-of select=" @l:label " />
        </button>
    </xsl:template>

</xsl:stylesheet>
