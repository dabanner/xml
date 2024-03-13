<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Mexican Recipes</title>
        <style>
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h2>Mexican Recipes with less than 600 calories</h2>
        <table>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Instructions</th>
            <th>Prep Time</th>
            <th>Cook Time</th>
            <th>Servings</th>
            <th>Calories</th>
          </tr>
          <xsl:apply-templates select="recipebox/recipes/recipe[cuisine='Mexican' and calories &lt; 600]"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="recipe">
    <tr>
      <td><xsl:value-of select="@id"/></td>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="description"/></td>
      <td><xsl:value-of select="instructions"/></td>
      <td><xsl:value-of select="prepTime"/></td>
      <td><xsl:value-of select="cookTime"/></td>
      <td><xsl:value-of select="servings"/></td>
      <td><xsl:value-of select="calories"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
