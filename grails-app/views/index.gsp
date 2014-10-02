<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>CAO Knows</title>
	</head>
	<body>
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
            <h3>Order Book Management</h3> <br>
            <p>View and manage order book details. </p> <br>
            <span class="buttons" >
                <g:link controller="OrderBook" action="index">Manage Order Books</g:link>
            </span>
            <br><br>
            <h3>Reports</h3> <br>
            <p>Generate inventory maintenance reports.</p> <br>
            <span class="buttons">
                <g:link controller="Reports" action="index">Generate Reports</g:link>
            </span>
        </div>
	</body>
</html>
