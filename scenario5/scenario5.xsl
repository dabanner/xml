<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>

  <xsl:template match="/">
    <xsl:text>{ "deliveryStaffList": [</xsl:text>
    <xsl:apply-templates select="recipebox/deliveryStaffList/deliveryStaff"/>
    <xsl:text> ] }</xsl:text>
  </xsl:template>

  <xsl:template match="deliveryStaff">
    <xsl:text>{"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>",</xsl:text>
    <xsl:text>"name": "</xsl:text><xsl:value-of select="name"/><xsl:text>",</xsl:text>
    <xsl:text>"phone": "</xsl:text><xsl:value-of select="phone"/><xsl:text>"}</xsl:text>
    <xsl:if test="position() != last()">
      <xsl:text>,</xsl:text>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
