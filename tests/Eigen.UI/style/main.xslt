﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:s="urn:rhenium-screen"
    xmlns:d="urn:rhenium-data"
    xmlns:l="urn:rhenium-localization"
    xmlns:v="urn:rhenium-validation"
    exclude-result-prefixes="msxsl s d l v">
    
    <xsl:output method="html" indent="yes"/>

    <xsl:include href="other.xslt" />

    <xsl:template match=" s:screen ">
        <html>
            <head>
                <title></title>
            </head>
            <body>
                <div>Hello world!</div>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>