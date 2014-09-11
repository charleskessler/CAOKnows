
<%@ page import="caoknowsv3.ItemInventory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemInventory.label', default: 'ItemInventory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-itemInventory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-itemInventory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="itemInventory.item.label" default="Item" /></th>
					
						<g:sortableColumn property="shelf" title="${message(code: 'itemInventory.shelf.label', default: 'Shelf')}" />
					
						<g:sortableColumn property="backroom" title="${message(code: 'itemInventory.backroom.label', default: 'Backroom')}" />
					
						<g:sortableColumn property="mezzanine" title="${message(code: 'itemInventory.mezzanine.label', default: 'Mezzanine')}" />
					
						<th><g:message code="itemInventory.lastUpdatedBy.label" default="Last Updated By" /></th>
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'itemInventory.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemInventoryInstanceList}" status="i" var="itemInventoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemInventoryInstance.id}">${fieldValue(bean: itemInventoryInstance, field: "item")}</g:link></td>
					
						<td>${fieldValue(bean: itemInventoryInstance, field: "shelf")}</td>
					
						<td>${fieldValue(bean: itemInventoryInstance, field: "backroom")}</td>
					
						<td>${fieldValue(bean: itemInventoryInstance, field: "mezzanine")}</td>
					
						<td>${fieldValue(bean: itemInventoryInstance, field: "lastUpdatedBy")}</td>
					
						<td><g:formatDate date="${itemInventoryInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemInventoryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
