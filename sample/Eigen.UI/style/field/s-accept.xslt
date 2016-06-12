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
    ~ s:accept/.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:accept " mode="s:layout">
        <xsl:param name="d:path" />

        <div class="form-group row">
            <label class="unselectable">
                <input type="checkbox" id="{ $d:path }{ generate-id(.) }">
                    <xsl:attribute name="v-model">
                        <xsl:value-of select=" @d:value " />
                    </xsl:attribute>
                </input>

                <xsl:if test=" s:text/@l:value ">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select=" s:text/@l:value "/>
                </xsl:if>
            </label>
        </div>
    </xsl:template>



    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ s:accept/.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:accept[ @input = 'true' ] " mode="s:layout">
        <xsl:param name="d:path" />

        <div class="form-group row">
            <label class="unselectable">
                <input type="checkbox" id="{ $d:path }{ generate-id(.) }">
                    <xsl:attribute name="v-model">
                        <xsl:value-of select=" @d:value " />
                    </xsl:attribute>
                </input>

                <xsl:if test=" s:text/@l:value ">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select=" s:text/@l:value "/>
                </xsl:if>
            </label>
        </div>
    </xsl:template>

</xsl:stylesheet>
