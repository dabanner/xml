<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Orders</title>
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
                <h2>Order List</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Customer</th>
                        <th>Recipe</th>
                        <th>Delivery Date</th>
                        <th>Delivery Address</th>
                        <th>Delivery Instructions</th>
                        <th>Total</th>
                    </tr>
                    <xsl:apply-templates select="recipebox/orders/order[total > 30]">
                        <xsl:sort select="total" data-type="number" order="ascending"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="order">
        <tr>
            <td>
                <xsl:value-of select="@id"/>
            </td>
            <td>
                <xsl:value-of select="//customer[@id=current()/customer]/firstName"/>
                <xsl:value-of select="//customer[@id=current()/customer]/lastName"/>
            </td>
            <td>
                <xsl:value-of select="recipe"/>
            </td>
            <td>
                <xsl:value-of select="deliveryDate"/>
            </td>
            <td>
                <xsl:value-of select="deliveryAddress"/>
            </td>
            <td>
                <xsl:value-of select="deliveryInstructions"/>
            </td>
            <td>
                <xsl:value-of select="total"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>