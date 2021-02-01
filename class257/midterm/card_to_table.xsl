<?xml version="1.0"?>
 <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 	<xsl:template match="/">
  	<html>
            <title>Business Card</title>
            <body>
                <p><xsl:value-of select="/business_card/name"/></p>
                <p><xsl:value-of select="/business_card/email"/></p>
                <p><xsl:value-of select="/business_card/phone"/></p>
                <p><xsl:value-of select="/business_card/address"/></p>
            </body>
    	</html>  
    	</xsl:template>
</xsl:stylesheet>
