<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:r="urn:rhenium"
    xmlns:s="urn:rhenium-screen"
    xmlns:d="urn:rhenium-data"
    xmlns:l="urn:rhenium-localization"
    xmlns:v="urn:rhenium-validation"
    xmlns:v-bind="urn:vue"
    exclude-result-prefixes="msxsl r s d l v v-bind">


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ Display.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:list " mode="s:value">
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
    <xsl:template match=" s:list[ @input = 'true' ] " mode="s:value">
        <xsl:param name="d:path" />

        <select class="s-list form-control" id="{ $d:path }{ generate-id(.) }">
            <xsl:attribute name="v-model">
                <xsl:value-of select=" @d:value " />
            </xsl:attribute>

            <xsl:call-template name="s:disabled" />

            <option v-bind:value="null" selected="">-- none --</option>

            <xsl:choose>
                <xsl:when test=" @d:options ">

                </xsl:when>

                <xsl:when test=" s:options ">
                    <xsl:apply-templates select=" s:options/* " mode="s:list-options" />
                </xsl:when>
            </xsl:choose>
        </select>
    </xsl:template>


    <xsl:template match=" s:group " mode="s:list-options">
        <optgroup>
            <xsl:attribute name="label">
                <!-- TODO -->
                <xsl:value-of select=" @l:label " />
            </xsl:attribute>

            <xsl:apply-templates select=" * "  mode="s:list-options" />
        </optgroup>
    </xsl:template>


    <xsl:template match=" s:option " mode="s:list-options">
        <option value="{ @value }">
            <!-- TODO -->
            <xsl:value-of select=" @l:label " />
        </option>
    </xsl:template>

</xsl:stylesheet>
