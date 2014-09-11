<%@ page import="caoknowsv3.ItemCapacity" %>



<div class="fieldcontain ${hasErrors(bean: itemCapacityInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="itemCapacity.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${caoknowsv3.Item.list()}" optionKey="id" required="" value="${itemCapacityInstance?.item?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemCapacityInstance, field: 'facings', 'error')} ">
	<label for="facings">
		<g:message code="itemCapacity.facings.label" default="Facings" />
		
	</label>
	<g:field name="facings" type="number" min="0" value="${itemCapacityInstance.facings}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemCapacityInstance, field: 'depth', 'error')} ">
	<label for="depth">
		<g:message code="itemCapacity.depth.label" default="Depth" />
		
	</label>
	<g:field name="depth" type="number" min="0" value="${itemCapacityInstance.depth}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemCapacityInstance, field: 'height', 'error')} ">
	<label for="height">
		<g:message code="itemCapacity.height.label" default="Height" />
		
	</label>
	<g:field name="height" type="number" min="0" value="${itemCapacityInstance.height}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemCapacityInstance, field: 'secondary', 'error')} ">
	<label for="secondary">
		<g:message code="itemCapacity.secondary.label" default="Secondary" />
		
	</label>
	<g:field name="secondary" type="number" min="0" value="${itemCapacityInstance.secondary}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemCapacityInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="itemCapacity.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:select id="lastUpdatedBy" name="lastUpdatedBy.id" from="${caoknowsv3.User.list()}" optionKey="id" value="${itemCapacityInstance?.lastUpdatedBy?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

