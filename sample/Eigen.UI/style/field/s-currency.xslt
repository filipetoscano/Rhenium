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
    <xsl:template match=" s:currency " mode="s:value">
        <p class="form-control-static">
            <xsl:text>{{ </xsl:text>
            <xsl:value-of select=" @d:value " />
            <xsl:text> | toCurrency </xsl:text>
            <xsl:choose>
                <xsl:when test=" @d:currency ">
                    <xsl:value-of select=" @d:currency " />
                </xsl:when>
                <xsl:when test=" @currency ">
                    <xsl:text>'</xsl:text>
                    <xsl:value-of select=" @currency " />
                    <xsl:text>'</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <!-- todo -->
                    <xsl:text>'</xsl:text>
                    <xsl:text>EUR</xsl:text>
                    <xsl:text>'</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text> }}</xsl:text>

            <xsl:text> </xsl:text>
            <xsl:choose>
                <xsl:when test=" @d:currency ">
                    <span>
                        <xsl:text>{{ </xsl:text>
                        <xsl:value-of select=" @d:currency " />
                        <xsl:text> }}</xsl:text>
                    </span>
                </xsl:when>
                <xsl:when test=" @currency ">
                    <span>
                        <xsl:value-of select=" @currency " />
                    </span>
                </xsl:when>
                <xsl:otherwise>
                    <span>
                        <!-- todo -->
                        <xsl:text>EUR</xsl:text>
                    </span>
                </xsl:otherwise>
            </xsl:choose>
        </p>
    </xsl:template>


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ Input.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:currency[ @input = 'true' ] " mode="s:value">
        <xsl:param name="d:path" />

        <div class="input-group">
            <input type="text" class="s-currency form-control" id="{ $d:path }{ generate-id(.) }">
                <xsl:if test=" $r:IsMobile = 'true' ">
                    <xsl:attribute name="type">
                        <xsl:text>number</xsl:text>
                    </xsl:attribute>
                </xsl:if>

                <xsl:attribute name="v-model">
                    <xsl:value-of select=" @d:value " />
                </xsl:attribute>

                <xsl:call-template name="s:placeholder" />
                <xsl:call-template name="s:disabled" />
            </input>

            <xsl:choose>
                <xsl:when test=" @d:currency ">
                    <span class="input-group-addon">
                        <xsl:text>{{ </xsl:text>
                        <xsl:value-of select=" @d:currency " />
                        <xsl:text> }}</xsl:text>
                    </span>
                </xsl:when>
                <xsl:when test=" @currency ">
                    <span class="input-group-addon">
                        <xsl:value-of select=" @currency " />
                    </span>
                </xsl:when>
                <xsl:otherwise>
                    <span class="input-group-addon">
                        <!-- todo -->
                        <xsl:text>EUR</xsl:text>
                    </span>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>

</xsl:stylesheet>
