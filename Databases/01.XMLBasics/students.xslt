<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:template match="/">
    <html>
      <link rel="stylesheet" type="text/css" href="style.css"/>
      <body>
        <h1>List of students</h1>
        <table>
          <tr>
            <th>Name</th>
            <th>Gender</th>
            <th>Birth-date</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Course</th>
            <th>Specialty</th>
            <th>FN</th>
            <th>Exams</th>
          </tr>
          <xsl:for-each select="students/student">
            <tr>
              <td><xsl:value-of select="name" /></td>
              <td><xsl:value-of select="sex" /></td>
              <td><xsl:value-of select="birth-date" /></td>
              <td><xsl:value-of select="phone" /></td>
              <td><xsl:value-of select="email" /></td>
              <td><xsl:value-of select="course" /></td>
              <td><xsl:value-of select="specialty" /></td>
              <td><xsl:value-of select="faculty-number" /></td>
              <td><xsl:for-each select="exams/exam">
                <div>
                    <xsl:value-of select="name"/>,
                    <strong>tutor-</strong><xsl:value-of select="tutor"/>,
                    <strong>score-</strong><xsl:value-of select="score"/>
                  </div>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>