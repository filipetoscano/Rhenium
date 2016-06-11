<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:r="urn:rhenium"
    xmlns:s="urn:rhenium-screen"
    xmlns:d="urn:rhenium-data"
    xmlns:l="urn:rhenium-localization"
    xmlns:v="urn:rhenium-validation"
    exclude-result-prefixes="msxsl r s d l v">

    <xsl:output method="html" />

    <!-- Params -->
    <xsl:param name="r:ApplicationPath" select=" '/Eigen.Web/' " />
    <xsl:param name="r:AssetBundle" select=" 'false' " />
    <xsl:variable name="r:AssetPath">
        <xsl:value-of select=" $r:ApplicationPath " />
        <xsl:text>resx/ui</xsl:text>
    </xsl:variable>

    <!-- Layout -->
    <xsl:include href="layout/s-actionGroup.xslt" />
    <xsl:include href="layout/s-canvas.xslt" />
    <xsl:include href="layout/s-field.xslt" />
    <xsl:include href="layout/s-fieldset.xslt" />

    <!-- Fields -->
    <xsl:include href="field/s-currency.xslt" />
    <xsl:include href="field/s-date.xslt" />
    <xsl:include href="field/s-decimal.xslt" />
    <xsl:include href="field/s-integer.xslt" />
    <xsl:include href="field/s-password.xslt" />
    <xsl:include href="field/s-string.xslt" />


    <xsl:template match=" s:screen ">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en">
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />

                <title></title>

                <link rel="stylesheet" href="{ $r:AssetPath }/css/main.css" />
                <link rel="icon" href="{ $r:AssetPath }/js/favicon-62.png" sizes="62x62" type="image/png" />
            </head>
            <body>
                <div id="TheApp" v-cloak="">
                    <xsl:apply-templates select=" s:canvas " mode="s:layout" />
                </div>

                <xsl:choose>
                    <xsl:when test=" not( $r:AssetBundle = 'true' ) ">
                        <script src="{ $r:ApplicationPath }/vnd/vue/dist/vue.min.js">
                            <xsl:text></xsl:text>
                        </script>
                    </xsl:when>

                    <xsl:otherwise>
                        <script src="{ $r:ApplicationPath }/js/bundle.js">
                            <xsl:comment></xsl:comment>
                        </script>
                    </xsl:otherwise>
                </xsl:choose>

                <script>
                    var demo = new Vue({
                    el: '#TheApp',
                    data: {
                    message: ''
                    }
                    })
                </script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
