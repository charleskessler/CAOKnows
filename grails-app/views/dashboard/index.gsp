<%--
Module 2.0 -- Dashboard
--%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>CAO Knows</title>
	</head>
	<body>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol>
        <div class="homeCell">
            <div id="homeSearch">
                <h3>Item Search</h3> <br>
             <g:form controller="Item" action="search">
                 <label>Search:</label>
                 <input id="query" type="text" name="query" />
                 <input type=submit value="Go" />
            </g:form>
            </div>
            <br><br>
            <h3>Reports</h3> <br>
            <p>Generate inventory maintenance reports.</p> <br>
            <span class="buttons">
                <g:link controller="Reports" action="index">Generate Reports</g:link>
            </span>
            <br><br>
            <g:isManager>
                <h3>Order Book Management</h3> <br>
                <p>View and manage order book details. </p> <br>
                <span class="buttons" >
                    <g:link controller="OrderBook" action="index">Manage Order Books</g:link>
                </span>
                <br><br>

                <h3>Generate Orders</h3> <br>
                 <span class="buttons">
                    <g:link controller="GenerateOrder" action="index">Generate Order</g:link>
                </span>
                <br><br>

                <h3>Manage User Accounts</h3> <br>
                <span class="buttons">
                    <g:link controller="User" action="index">Manage Users</g:link>
                </span>
            </g:isManager>
        </div>
    </ol>
	</body>
</html>
