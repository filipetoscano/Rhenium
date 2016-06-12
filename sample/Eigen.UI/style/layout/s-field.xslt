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
    ~ 'Field' is a generic template for *anything* which is being bound
    ~ directly to data.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:*[ @d:value ] " mode="s:layout">
        <xsl:param name="d:path" />

        <div class="form-group row">
            <!-- TODO: Figure out why? :/ -->
            <xsl:if test=" local-name(.) = 'bool' ">
                <xsl:attribute name="class">
                    <xsl:text>row</xsl:text>
                </xsl:attribute>
            </xsl:if>
            
            <div class="col-sm-2 form-control-label">
                <xsl:variable name="elementName">
                    <xsl:choose>
                        <xsl:when test=" @input = 'true' ">
                            <xsl:text>label</xsl:text>
                        </xsl:when>

                        <xsl:otherwise>
                            <xsl:text>span</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <xsl:element name="{ $elementName }">
                    <xsl:attribute name="data-ltoken">
                        <xsl:value-of select=" @l:label "/>
                    </xsl:attribute>

                    <xsl:if test=" @input = 'true' ">
                        <xsl:attribute name="for">
                            <xsl:value-of select=" $d:path "/>
                            <xsl:value-of select=" generate-id(.) "/>
                        </xsl:attribute>
                    </xsl:if>

                    <xsl:value-of select=" @l:label " />
                </xsl:element>
            </div>

            <div class="col-sm-10">
                <xsl:apply-templates select=" . " mode="s:value">
                    <xsl:with-param name="d:path" select=" $d:path " />
                </xsl:apply-templates>

                <xsl:call-template name="s:description" />
            </div>
        </div>
    </xsl:template>


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ Default template for 's:value'.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:* " mode="s:value">
        <div class="s-render-error">
            <xsl:text>ERR002: There is no s:value template for '</xsl:text>
            <xsl:choose>
                <xsl:when test=" namespace-uri(.) = 'urn:rhenium-screen' ">
                    <xsl:text>s</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select=" substring-before( name(), ':' ) " />
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>:</xsl:text>
            <xsl:value-of select=" local-name(.) " />
            <xsl:text>'.</xsl:text>
        </div>
    </xsl:template>



    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ s:placeholder()
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template name="s:placeholder">
        <xsl:choose>
            <xsl:when test=" @placeholder ">
                <xsl:attribute name="placeholder">
                    <xsl:value-of select=" @placeholder " />
                </xsl:attribute>
            </xsl:when>

            <xsl:when test=" @l:placeholder ">
                <xsl:attribute name="placeholder">
                    <xsl:value-of select=" @l:placeholder " />
                </xsl:attribute>
            </xsl:when>
        </xsl:choose>
    </xsl:template>


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ s:disabled()
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template name="s:disabled">
        <xsl:choose>
            <xsl:when test=" @disabled ">
                <xsl:attribute name="disabled">
                </xsl:attribute>
            </xsl:when>

            <xsl:when test=" @d:disabled ">
                <xsl:attribute name="v-bind:disabled">
                    <xsl:value-of select=" @d:disabled " />
                </xsl:attribute>
            </xsl:when>
        </xsl:choose>
    </xsl:template>


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ s:description()
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template name="s:description">
        <xsl:choose>
            <xsl:when test=" s:description ">
                <small class="text-muted">
                    <xsl:value-of select=" s:placeholder " />
                </small>
            </xsl:when>

            <xsl:when test=" l:description ">
                <small class="text-muted">
                    <xsl:value-of select=" l:description " />
                </small>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
