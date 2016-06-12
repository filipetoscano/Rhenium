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
    ~ s:tabs
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:tabs " mode="s:layout">
        <xsl:param name="d:path" />

        <div>
            <ul class="nav nav-tabs" role="tablist">
                <xsl:for-each select=" s:tab ">
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#{ generate-id(.) }" role="tab">
                            <xsl:if test=" @active ">
                                <xsl:attribute name="class">
                                    <xsl:text>nav-link active</xsl:text>
                                </xsl:attribute>
                            </xsl:if>

                            <xsl:if test=" @icon ">
                                <i class="fa fa-{ @icon }" />
                                <xsl:text> </xsl:text>
                            </xsl:if>

                            <!-- todo -->
                            <xsl:value-of select=" @l:label " />
                        </a>
                    </li>
                </xsl:for-each>
            </ul>

            <div class="tab-content">
                <xsl:for-each select=" s:tab ">
                    <div class="tab-pane" id="{ generate-id(.) }" role="tabpanel">
                        <xsl:if test=" @active ">
                            <xsl:attribute name="class">
                                <xsl:text>tab-pane active</xsl:text>
                            </xsl:attribute>
                        </xsl:if>

                        <!-- content -->
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
