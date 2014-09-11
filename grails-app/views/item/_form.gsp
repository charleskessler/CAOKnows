<%@ page import="caoknowsv3.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'itemCode', 'error')} required">
	<label for="itemCode">
		<g:message code="item.itemCode.label" default="Item Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="itemCode" maxlength="12" required="" value="${itemInstance?.itemCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'itemUPC', 'error')} required">
	<label for="itemUPC">
		<g:message code="item.itemUPC.label" default="Item UPC" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="itemUPC" maxlength="12" required="" value="${itemInstance?.itemUPC}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="item.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="36" required="" value="${itemInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'casePack', 'error')} ">
	<label for="casePack">
		<g:message code="item.casePack.label" default="Case Pack" />
		
	</label>
	<g:field name="casePack" type="number" min="1" value="${itemInstance.casePack}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'unitSize', 'error')} ">
	<label for="unitSize">
		<g:message code="item.unitSize.label" default="Unit Size" />
		
	</label>
	<g:field name="unitSize" value="${fieldValue(bean: itemInstance, field: 'unitSize')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'unitType', 'error')} ">
	<label for="unitType">
		<g:message code="item.unitType.label" default="Unit Type" />
		
	</label>
	<g:select name="unitType" from="${itemInstance.constraints.unitType.inList}" value="${itemInstance?.unitType}" valueMessagePrefix="item.unitType" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'itemStatus', 'error')} ">
	<label for="itemStatus">
		<g:message code="item.itemStatus.label" default="Item Status" />
		
	</label>
	<g:select name="itemStatus" from="${itemInstance.constraints.itemStatus.inList}" value="${itemInstance?.itemStatus}" valueMessagePrefix="item.itemStatus" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="item.location.label" default="Location" />
		
	</label>
	<g:select id="location" name="location.id" from="${caoknowsv3.ItemLocation.list()}" optionKey="id" value="${itemInstance?.location?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'inventory', 'error')} ">
	<label for="inventory">
		<g:message code="item.inventory.label" default="Inventory" />
		
	</label>
	<g:select id="inventory" name="inventory.id" from="${caoknowsv3.ItemInventory.list()}" optionKey="id" value="${itemInstance?.inventory?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'capacity', 'error')} ">
	<label for="capacity">
		<g:message code="item.capacity.label" default="Capacity" />
		
	</label>
	<g:select id="capacity" name="capacity.id" from="${caoknowsv3.ItemCapacity.list()}" optionKey="id" value="${itemInstance?.capacity?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'orderHistory', 'error')} ">
	<label for="orderHistory">
		<g:message code="item.orderHistory.label" default="Order History" />
		
	</label>
	<g:select id="orderHistory" name="orderHistory.id" from="${caoknowsv3.OrderHistory.list()}" optionKey="id" value="${itemInstance?.orderHistory?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'orderBook', 'error')} required">
	<label for="orderBook">
		<g:message code="item.orderBook.label" default="Order Book" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orderBook" name="orderBook.id" from="${caoknowsv3.OrderBook.list()}" optionKey="id" required="" value="${itemInstance?.orderBook?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="item.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${caoknowsv3.User.list()}" optionKey="id" required="" value="${itemInstance?.createdBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="item.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lastUpdatedBy" name="lastUpdatedBy.id" from="${caoknowsv3.User.list()}" optionKey="id" required="" value="${itemInstance?.lastUpdatedBy?.id}" class="many-to-one"/>

</div>

