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
    ~ s:fieldset/
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:fieldset " mode="s:layout">
        <xsl:param name="d:path" />

        <div>
            <xsl:apply-templates select=" * " mode="s:layout">
                <xsl:with-param name="d:path" select=" $d:path " />
            </xsl:apply-templates>
        </div>
    </xsl:template>


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ s:fieldset/ column layout
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:fieldset[ s:column ] " mode="s:layout">
        <xsl:param name="d:path" />

        <xsl:variable name="span">
            <xsl:choose>
                <xsl:when test=" count( s:column ) = 1 ">
                    <xsl:text>12</xsl:text>
                </xsl:when>
                <xsl:when test=" count( s:column ) = 2 ">
                    <xsl:text>6</xsl:text>
                </xsl:when>
                <xsl:when test=" count( s:column ) = 3 ">
                    <xsl:text>4</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>

        <div class="row">
            <xsl:apply-templates select=" s:column " mode="s:layout">
                <xsl:with-param name="d:path" select=" $d:path " />
                <xsl:with-param name="s:span" select=" $span " />
            </xsl:apply-templates>
        </div>
    </xsl:template>


    <xsl:template match=" s:column " mode="s:layout">
        <xsl:param name="d:path" />
        <xsl:param name="s:span" />

        <div>
            <xsl:attribute name="class">
                <xsl:text>col-md-</xsl:text>

                <xsl:choose>
                    <xsl:when test=" @span ">
                        <xsl:value-of select=" @span " />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select=" $s:span " />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>

            <xsl:apply-templates select=" * " mode="s:layout">
                <xsl:with-param name="d:path" select=" $d:path " />
            </xsl:apply-templates>
        </div>
    </xsl:template>

</xsl:stylesheet>
