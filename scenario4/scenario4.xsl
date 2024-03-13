<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  
  <xsl:template match="/">
    <recipes>
      <xsl:apply-templates select="recipebox/recipes/recipe[contains(ingredients, 'cheese')]"/>
    </recipes>
  </xsl:template>
  
  <xsl:template match="recipe">
    <recipe>
      <xsl:copy-of select="*"/>
    </recipe>
  </xsl:template>
</xsl:stylesheet>
