
<%@ page import="caoknowsv3.OrderHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orderHistory.label', default: 'OrderHistory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-orderHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-orderHistory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="pendingDeliveryQuantity" title="${message(code: 'orderHistory.pendingDeliveryQuantity.label', default: 'Pending Delivery Quantity')}" />
					
						<g:sortableColumn property="lastOrderQuantity" title="${message(code: 'orderHistory.lastOrderQuantity.label', default: 'Last Order Quantity')}" />
					
						<g:sortableColumn property="lastReceivedQuantity" title="${message(code: 'orderHistory.lastReceivedQuantity.label', default: 'Last Received Quantity')}" />
					
						<th><g:message code="orderHistory.item.label" default="Item" /></th>
					
						<g:sortableColumn property="lastOrderReceived" title="${message(code: 'orderHistory.lastOrderReceived.label', default: 'Last Order Received')}" />
					
						<g:sortableColumn property="lastReceivedDate" title="${message(code: 'orderHistory.lastReceivedDate.label', default: 'Last Received Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${orderHistoryInstanceList}" status="i" var="orderHistoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${orderHistoryInstance.id}">${fieldValue(bean: orderHistoryInstance, field: "pendingDeliveryQuantity")}</g:link></td>
					
						<td>${fieldValue(bean: orderHistoryInstance, field: "lastOrderQuantity")}</td>
					
						<td>${fieldValue(bean: orderHistoryInstance, field: "lastReceivedQuantity")}</td>
					
						<td>${fieldValue(bean: orderHistoryInstance, field: "item")}</td>
					
						<td>${fieldValue(bean: orderHistoryInstance, field: "lastOrderReceived")}</td>
					
						<td><g:formatDate date="${orderHistoryInstance.lastReceivedDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${orderHistoryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
