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

    <xsl:include href="other.xslt" />

    <xsl:param name="r:ApplicationPath" select=" '/Eigen.Web/' " />
    <xsl:param name="r:AssetBundle" select=" 'false' " />

    <xsl:template match=" s:screen ">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en">
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />

                <title></title>

                <link rel="stylesheet" href="{ $r:ApplicationPath }rex/ui/css/main.css" />
            </head>
            <body>
                <div id="demo" v-cloak="">
                    <input v-model="message" />
                    <p>{{message}}</p>
                </div>

                <xsl:choose>
                    <xsl:when test=" not( $r:AssetBundle = 'true' ) ">
                        <script src="{ $r:ApplicationPath }rex/ui/vnd/vue/dist/vue.min.js">
                            <xsl:text></xsl:text>
                        </script>
                    </xsl:when>

                    <xsl:otherwise>
                        <script src="{ $r:ApplicationPath }rex/ui/js/bundle.js">
                            <xsl:comment></xsl:comment>
                        </script>
                    </xsl:otherwise>
                </xsl:choose>

                <script>
                    var demo = new Vue({
                    el: '#demo',
                    data: {
                    message: ''
                    }
                    })
                </script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
