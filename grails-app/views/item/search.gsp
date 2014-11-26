<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Item Search Results</title>
</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Home</a></li>
    </ul>
</div>
<div id="list-items" class="content scaffold-list" role="main">
    <h1>Search Results</h1>
    <br />
    <ol class="property-list item">
        <g:if test="${items}">
            <g:each in="${items}" var="item">
                <li>
                    <g:link action="show" id="${item.id}">${item}</g:link>
                </li>
            </g:each>
        </g:if>
        <g:else>
            <h3>No Matching Results Found</h3>
        </g:else>
    </ol>
    <div id="homeSearch">
        <g:form controller="Item" action="search">
            <label>Search:</label>
            <input id="query" type="text" name="query" />
            <input type=submit value="Go" />
        </g:form>
    </div>
</div>

</body>
</html>