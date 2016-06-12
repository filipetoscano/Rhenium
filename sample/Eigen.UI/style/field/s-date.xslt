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
    <xsl:template match=" s:date " mode="s:value">
        <p class="form-control-static">
            <xsl:text>{{ </xsl:text>
            <xsl:value-of select=" @d:value " />
            <xsl:text> | toDate }}</xsl:text>
        </p>
    </xsl:template>


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ Input.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:date[ @input = 'true' ] " mode="s:value">
        <xsl:param name="d:path" />

        <div class="input-group">
            <input type="text" class="s-date form-control" id="{ $d:path }{ generate-id(.) }">
                <xsl:if test=" $r:IsMobile = 'true' ">
                    <xsl:attribute name="type">
                        <xsl:text>date</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                
                <xsl:attribute name="v-model">
                    <xsl:value-of select=" @d:value " />
                </xsl:attribute>

                <xsl:call-template name="s:placeholder" />
                <xsl:call-template name="s:disabled" />
            </input>

            <span class="input-group-addon">
                <i class="fa fa-calendar" />
            </span>
        </div>
    </xsl:template>

</xsl:stylesheet>
