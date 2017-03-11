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
    <xsl:template match=" s:integer " mode="s:value">
        <p class="form-control-static">
            <xsl:text>{{ </xsl:text>
            <xsl:value-of select=" @d:value " />
            <xsl:text> }}</xsl:text>
        </p>
    </xsl:template>


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ Input.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:integer[ @input = 'true' ] " mode="s:value">
        <xsl:param name="d:path" />

        <div class="input-group">
            <input type="text" class="s-integer form-control" id="{ $d:path }{ generate-id(.) }">
                <xsl:attribute name="v-model">
                    <xsl:value-of select=" @d:value " />
                </xsl:attribute>

                <xsl:if test=" $r:IsMobile = 'true' ">
                    <xsl:attribute name="type">
                        <xsl:text>number</xsl:text>
                    </xsl:attribute>

                    <xsl:attribute name="pattern">
                        <xsl:text>[0-9]*</xsl:text>
                    </xsl:attribute>
                </xsl:if>

                <xsl:call-template name="s:placeholder" />
                <xsl:call-template name="s:disabled" />
            </input>

            <xsl:choose>
                <xsl:when test=" @d:units ">
                    <span class="input-group-addon">
                        <xsl:text>{{ </xsl:text>
                        <xsl:value-of select=" @d:units " />
                        <xsl:text> }}</xsl:text>
                    </span>
                </xsl:when>
                <xsl:when test=" @units ">
                    <span class="input-group-addon">
                        <xsl:value-of select=" @units " />
                    </span>
                </xsl:when>
            </xsl:choose>
        </div>
    </xsl:template>

</xsl:stylesheet>
