<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:r="urn:rhenium"
    xmlns:s="urn:rhenium-screen"
    xmlns:d="urn:rhenium-data"
    xmlns:l="urn:rhenium-localization"
    xmlns:v="urn:rhenium-validation"
    xmlns:v-bind="urn:vue"
    exclude-result-prefixes="msxsl r s d l v">

    <xsl:output method="html" />

    <!-- Params -->
    <xsl:param name="r:ApplicationPath" select=" '/Eigen.Web/' " />
    <xsl:param name="r:AssetBundle" select=" 'false' " />
    <xsl:param name="r:IsMobile" select=" 'false' " />
    <xsl:variable name="r:AssetPath">
        <xsl:value-of select=" $r:ApplicationPath " />
        <xsl:text>rex/ui</xsl:text>
    </xsl:variable>

    <!-- Layout -->
    <xsl:include href="layout/s-actionGroup.xslt" />
    <xsl:include href="layout/s-canvas.xslt" />
    <xsl:include href="layout/s-field.xslt" />
    <xsl:include href="layout/s-fieldset.xslt" />

    <!-- Fields -->
    <xsl:include href="field/s-accept.xslt" />
    <xsl:include href="field/s-action.xslt" />
    <xsl:include href="field/s-bool.xslt" />
    <xsl:include href="field/s-currency.xslt" />
    <xsl:include href="field/s-date.xslt" />
    <xsl:include href="field/s-decimal.xslt" />
    <xsl:include href="field/s-integer.xslt" />
    <xsl:include href="field/s-list.xslt" />
    <xsl:include href="field/s-password.xslt" />
    <xsl:include href="field/s-string.xslt" />


    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~
    ~ s:screen/
    ~ Transformation entry point.
    ~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match=" s:screen ">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en" xmlns:v-bind="urn:vue">
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />

                <title>
                    <xsl:if test=" true() ">
                        <xsl:text>[</xsl:text>
                        <xsl:value-of select=" @id "/>
                        <xsl:text>]</xsl:text>
                    </xsl:if>
                </title>

                <xsl:choose>
                    <xsl:when test=" $r:AssetBundle = 'true' ">
                        <link rel="stylesheet" href="{ $r:AssetPath }/css/bundle.css" />
                    </xsl:when>
                    <xsl:otherwise>
                        <link rel="stylesheet" href="{ $r:AssetPath }/vnd/bootstrap/dist/css/bootstrap.min.css" />
                        <link rel="stylesheet" href="{ $r:AssetPath }/vnd/font-awesome/css/font-awesome.min.css" />
                        <link rel="stylesheet" href="{ $r:AssetPath }/css/main.css" />
                    </xsl:otherwise>
                </xsl:choose>

                <link rel="icon" href="{ $r:AssetPath }/img/favicon-62.png" sizes="62x62" type="image/png" />
            </head>
            <body>
                <form id="TheApp" v-cloak="">
                    <xsl:apply-templates select=" s:canvas " mode="s:layout" />
                </form>

                <xsl:choose>
                    <xsl:when test=" $r:AssetBundle = 'true' ">
                        <script src="{ $r:AssetPath }/js/bundle.js">
                            <xsl:text />
                        </script>
                    </xsl:when>

                    <xsl:otherwise>
                        <script src="{ $r:AssetPath }/vnd/moment/min/moment.min.js" />
                        <script src="{ $r:AssetPath }/vnd/accountingjs/accounting.min.js" />
                        <script src="{ $r:AssetPath }/vnd/vue/dist/vue.min.js" />
                        
                        <!-- Ours -->
                        <script src="{ $r:AssetPath }/js/s-currency.js" />
                        <script src="{ $r:AssetPath }/js/s-date.js" />
                        <script src="{ $r:AssetPath }/js/s-decimal.js" />
                    </xsl:otherwise>
                </xsl:choose>

                <script>
                    var demo = new Vue({el: '#TheApp', data: {}});

                    var Rhenium = {};
                    Rhenium.Number = {};
                    Rhenium.Number.Thousand = ' ';
                    Rhenium.Number.Decimal = ',';

                </script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
