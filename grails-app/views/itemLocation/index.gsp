
<%@ page import="caoknowsv3.ItemLocation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemLocation.label', default: 'ItemLocation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-itemLocation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-itemLocation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="itemLocation.item.label" default="Item" /></th>
					
						<g:sortableColumn property="aisle" title="${message(code: 'itemLocation.aisle.label', default: 'Aisle')}" />
					
						<g:sortableColumn property="side" title="${message(code: 'itemLocation.side.label', default: 'Side')}" />
					
						<g:sortableColumn property="segment" title="${message(code: 'itemLocation.segment.label', default: 'Segment')}" />
					
						<g:sortableColumn property="shelf" title="${message(code: 'itemLocation.shelf.label', default: 'Shelf')}" />
					
						<g:sortableColumn property="position" title="${message(code: 'itemLocation.position.label', default: 'Position')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemLocationInstanceList}" status="i" var="itemLocationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemLocationInstance.id}">${fieldValue(bean: itemLocationInstance, field: "item")}</g:link></td>
					
						<td>${fieldValue(bean: itemLocationInstance, field: "aisle")}</td>
					
						<td>${fieldValue(bean: itemLocationInstance, field: "side")}</td>
					
						<td>${fieldValue(bean: itemLocationInstance, field: "segment")}</td>
					
						<td>${fieldValue(bean: itemLocationInstance, field: "shelf")}</td>
					
						<td>${fieldValue(bean: itemLocationInstance, field: "position")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemLocationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
