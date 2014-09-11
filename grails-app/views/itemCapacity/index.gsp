
<%@ page import="caoknowsv3.ItemCapacity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemCapacity.label', default: 'ItemCapacity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-itemCapacity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-itemCapacity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="itemCapacity.item.label" default="Item" /></th>
					
						<g:sortableColumn property="facings" title="${message(code: 'itemCapacity.facings.label', default: 'Facings')}" />
					
						<g:sortableColumn property="depth" title="${message(code: 'itemCapacity.depth.label', default: 'Depth')}" />
					
						<g:sortableColumn property="height" title="${message(code: 'itemCapacity.height.label', default: 'Height')}" />
					
						<g:sortableColumn property="secondary" title="${message(code: 'itemCapacity.secondary.label', default: 'Secondary')}" />
					
						<th><g:message code="itemCapacity.lastUpdatedBy.label" default="Last Updated By" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemCapacityInstanceList}" status="i" var="itemCapacityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemCapacityInstance.id}">${fieldValue(bean: itemCapacityInstance, field: "item")}</g:link></td>
					
						<td>${fieldValue(bean: itemCapacityInstance, field: "facings")}</td>
					
						<td>${fieldValue(bean: itemCapacityInstance, field: "depth")}</td>
					
						<td>${fieldValue(bean: itemCapacityInstance, field: "height")}</td>
					
						<td>${fieldValue(bean: itemCapacityInstance, field: "secondary")}</td>
					
						<td>${fieldValue(bean: itemCapacityInstance, field: "lastUpdatedBy")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemCapacityInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
