<%--
  Created by IntelliJ IDEA.
  User: vice
  Date: 10/1/14
  Time: 11:25 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Generate Reports</title>
</head>

<body>
    <div class="reportsCell">

        <label>Items with no shelf location</label>
            <span class="buttons">
                <g:link controller="Reports" action="noLocation">Generate Report</g:link>
            </span>
        <br><br>
        <label>Backroom Pull List</label>
        <span class="buttons">
            <g:link controller="Reports" action="backroomPull">Generate Report</g:link>
        </span>
        <br><br>
        <label>Negative Inventory</label>
        <span class="buttons">
            <g:link controller="Reports" action="negativeInventory">Generate Report</g:link>
        </span>
        <br><br>
        <label>Backroom Inventory</label>
        <span class="buttons">
            <g:link controller="Reports" action="backroomInventory">Generate Report</g:link>
        </span>
        <br><br>
        <label>Discontinued Items With Shelf Locations</label>
        <span class="buttons">
            <g:link controller="Reports" action="discontinuedItems">Generate Report</g:link>
        </span>
    </div>
</body>
</html>