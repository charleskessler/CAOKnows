<%@ page import="caoknowsv3.OrderHistory" %>



<div class="fieldcontain ${hasErrors(bean: orderHistoryInstance, field: 'pendingDeliveryQuantity', 'error')} required">
	<label for="pendingDeliveryQuantity">
		<g:message code="orderHistory.pendingDeliveryQuantity.label" default="Pending Delivery Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pendingDeliveryQuantity" type="number" min="0" value="${orderHistoryInstance.pendingDeliveryQuantity}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: orderHistoryInstance, field: 'lastOrderQuantity', 'error')} required">
	<label for="lastOrderQuantity">
		<g:message code="orderHistory.lastOrderQuantity.label" default="Last Order Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastOrderQuantity" type="number" min="0" value="${orderHistoryInstance.lastOrderQuantity}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: orderHistoryInstance, field: 'lastReceivedQuantity', 'error')} required">
	<label for="lastReceivedQuantity">
		<g:message code="orderHistory.lastReceivedQuantity.label" default="Last Received Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastReceivedQuantity" type="number" min="0" value="${orderHistoryInstance.lastReceivedQuantity}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: orderHistoryInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="orderHistory.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${caoknowsv3.Item.list()}" optionKey="id" required="" value="${orderHistoryInstance?.item?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orderHistoryInstance, field: 'lastOrderReceived', 'error')} required">
	<label for="lastOrderReceived">
		<g:message code="orderHistory.lastOrderReceived.label" default="Last Order Received" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastOrderReceived" type="number" value="${orderHistoryInstance.lastOrderReceived}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: orderHistoryInstance, field: 'lastReceivedDate', 'error')} required">
	<label for="lastReceivedDate">
		<g:message code="orderHistory.lastReceivedDate.label" default="Last Received Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastReceivedDate" precision="day"  value="${orderHistoryInstance?.lastReceivedDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: orderHistoryInstance, field: 'pendingDeliveryDate', 'error')} required">
	<label for="pendingDeliveryDate">
		<g:message code="orderHistory.pendingDeliveryDate.label" default="Pending Delivery Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="pendingDeliveryDate" precision="day"  value="${orderHistoryInstance?.pendingDeliveryDate}"  />

</div>

