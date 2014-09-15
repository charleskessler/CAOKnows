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

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'orderBook', 'error')} required">
	<label for="orderBook">
		<g:message code="item.orderBook.label" default="Order Book" />
		<span class="required-indicator">*</span>
	</label>
    <g:if test="${caoknowsv3.OrderBook.findByBookNumber(params.bookNum) == null}">
        <g:select id="orderBook" name="orderBook.id" from="${caoknowsv3.OrderBook.list()}" optionKey="id" required="" value="${itemInstance?.orderBook?.id}" class="many-to-one"/>
    </g:if>
    <g:else>
        <g:select id="orderBook" name="orderBook.id" from="${caoknowsv3.OrderBook.findByBookNumber(params.bookNum)}" optionKey="id" required="" value="" class="many-to-one"/>
    </g:else>
</div>

