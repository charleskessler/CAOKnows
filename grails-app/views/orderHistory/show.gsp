
<%@ page import="caoknowsv3.OrderHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orderHistory.label', default: 'OrderHistory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-orderHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-orderHistory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list orderHistory">
			
				<g:if test="${orderHistoryInstance?.pendingDeliveryQuantity}">
				<li class="fieldcontain">
					<span id="pendingDeliveryQuantity-label" class="property-label"><g:message code="orderHistory.pendingDeliveryQuantity.label" default="Pending Delivery Quantity" /></span>
					
						<span class="property-value" aria-labelledby="pendingDeliveryQuantity-label"><g:fieldValue bean="${orderHistoryInstance}" field="pendingDeliveryQuantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderHistoryInstance?.lastOrderQuantity}">
				<li class="fieldcontain">
					<span id="lastOrderQuantity-label" class="property-label"><g:message code="orderHistory.lastOrderQuantity.label" default="Last Order Quantity" /></span>
					
						<span class="property-value" aria-labelledby="lastOrderQuantity-label"><g:fieldValue bean="${orderHistoryInstance}" field="lastOrderQuantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderHistoryInstance?.lastReceivedQuantity}">
				<li class="fieldcontain">
					<span id="lastReceivedQuantity-label" class="property-label"><g:message code="orderHistory.lastReceivedQuantity.label" default="Last Received Quantity" /></span>
					
						<span class="property-value" aria-labelledby="lastReceivedQuantity-label"><g:fieldValue bean="${orderHistoryInstance}" field="lastReceivedQuantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderHistoryInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="orderHistory.item.label" default="Item" /></span>
					
						<span class="property-value" aria-labelledby="item-label"><g:link controller="item" action="show" id="${orderHistoryInstance?.item?.id}">${orderHistoryInstance?.item?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderHistoryInstance?.lastOrderReceived}">
				<li class="fieldcontain">
					<span id="lastOrderReceived-label" class="property-label"><g:message code="orderHistory.lastOrderReceived.label" default="Last Order Received" /></span>
					
						<span class="property-value" aria-labelledby="lastOrderReceived-label"><g:fieldValue bean="${orderHistoryInstance}" field="lastOrderReceived"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderHistoryInstance?.lastReceivedDate}">
				<li class="fieldcontain">
					<span id="lastReceivedDate-label" class="property-label"><g:message code="orderHistory.lastReceivedDate.label" default="Last Received Date" /></span>
					
						<span class="property-value" aria-labelledby="lastReceivedDate-label"><g:formatDate date="${orderHistoryInstance?.lastReceivedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderHistoryInstance?.pendingDeliveryDate}">
				<li class="fieldcontain">
					<span id="pendingDeliveryDate-label" class="property-label"><g:message code="orderHistory.pendingDeliveryDate.label" default="Pending Delivery Date" /></span>
					
						<span class="property-value" aria-labelledby="pendingDeliveryDate-label"><g:formatDate date="${orderHistoryInstance?.pendingDeliveryDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:orderHistoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${orderHistoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
