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
    ~ s:table/
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:table " mode="s:layout">
        <xsl:param name="d:path" />

        <div class="row">
            <table>
                <thead>
                    <xsl:apply-templates select=" s:content/* " mode="s:table-head" />
                </thead>

                <tbody>
                    <template>
                        <xsl:attribute name="v-for">
                            <xsl:text>( </xsl:text>
                            <xsl:value-of select=" generate-id(.) " />
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select=" @d:item " />
                            <xsl:text> ) in </xsl:text>
                            <xsl:value-of select=" @d:items " />
                        </xsl:attribute>

                        <tr>
                            <xsl:apply-templates select=" * " mode="s:table-cell">
                                <xsl:with-param name="d:path">
                                    <xsl:value-of select=" $d:path " />
                                    <xsl:value-of select=" generate-id(.) " />
                                    <xsl:text>_{{ </xsl:text>
                                    <xsl:value-of select=" generate-id(.) " />
                                    <xsl:text> }}_</xsl:text>
                                </xsl:with-param>
                            </xsl:apply-templates>
                        </tr>
                    </template>
                </tbody>
            </table>
        </div>
    </xsl:template>


    <xsl:template match=" * " mode="s:table-head">
        <tr>
            <th>
                <xsl:value-of select=" @l:label" />
            </th>
        </tr>
    </xsl:template>


    <xsl:template match=" * " mode="s:table-cell">
        <xsl:param name="d:path" />
        
        <tr>
            <td>
                <xsl:apply-templates select=" . " mode="s:value">
                    <xsl:with-param name="d:path" />
                </xsl:apply-templates>
            </td>
        </tr>
    </xsl:template>


</xsl:stylesheet>
