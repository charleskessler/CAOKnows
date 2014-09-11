
<%@ page import="caoknowsv3.OrderBook" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orderBook.label', default: 'OrderBook')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-orderBook" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-orderBook" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="bookNumber" title="${message(code: 'orderBook.bookNumber.label', default: 'Book Number')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'orderBook.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'orderBook.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'orderBook.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="orderBook.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="orderBook.lastUpdatedBy.label" default="Last Updated By" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${orderBookInstanceList}" status="i" var="orderBookInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${orderBookInstance.id}">${fieldValue(bean: orderBookInstance, field: "bookNumber")}</g:link></td>
					
						<td>${fieldValue(bean: orderBookInstance, field: "description")}</td>
					
						<td><g:formatDate date="${orderBookInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${orderBookInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: orderBookInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: orderBookInstance, field: "lastUpdatedBy")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${orderBookInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
