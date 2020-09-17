<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

  <html>
  <body>
    <h2>Sida Company</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>ID</th>
        <th>type</th>
        <th>price</th>
        <th>vendor</th>
        <th>collection</th>
      </tr>
      <xsl:for-each select="company/shopping_cart/item">
        <tr>
          <td><xsl:value-of select="ID"/></td>
          <td><xsl:value-of select="type"/></td>
          <td><xsl:value-of select="price"/></td>
          <td><xsl:value-of select="vendor"/></td>
          <td>
          	<xsl:for-each select="collection/item_name">
          	<ul>
          			<li><xsl:value-of select="."/></li>
          	</ul>
          	</xsl:for-each>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
  
</xsl:template>
</xsl:stylesheet>












