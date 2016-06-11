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
    <xsl:template match=" s:bool " mode="s:value">
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
    <xsl:template match=" s:bool[ @input = 'true' ] " mode="s:value">
        <xsl:param name="d:path" />

        <div class="checkbox">
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


    <xsl:template match=" s:bool[ @input = 'true' and @style = 'radio' ] " mode="s:value">
        <xsl:param name="d:path" />

        <div class="radio">
            <label class="unselectable">
                <input type="radio" v-bind:value="true" id="{ $d:path }{ generate-id(.) }">
                    <xsl:attribute name="v-model">
                        <xsl:value-of select=" @d:value " />
                    </xsl:attribute>
                </input>

                <xsl:text> </xsl:text>
                <xsl:value-of select=" s:text/@l:true "/>
            </label>
        </div>

        <div class="radio">
            <label class="unselectable">
                <input type="radio" v-bind:value="false" id="{ $d:path }{ generate-id(.) }">
                    <xsl:attribute name="v-model">
                        <xsl:value-of select=" @d:value " />
                    </xsl:attribute>
                </input>

                <xsl:text> </xsl:text>
                <xsl:value-of select=" s:text/@l:false "/>
            </label>
        </div>
    </xsl:template>


</xsl:stylesheet>
