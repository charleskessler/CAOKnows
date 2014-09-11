<%@ page import="caoknowsv3.ItemLocation" %>



<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="itemLocation.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${caoknowsv3.Item.list()}" optionKey="id" required="" value="${itemLocationInstance?.item?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'aisle', 'error')} ">
	<label for="aisle">
		<g:message code="itemLocation.aisle.label" default="Aisle" />
		
	</label>
	<g:field name="aisle" type="number" value="${itemLocationInstance.aisle}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'side', 'error')} ">
	<label for="side">
		<g:message code="itemLocation.side.label" default="Side" />
		
	</label>
	<g:select name="side" from="${itemLocationInstance.constraints.side.inList}" value="${itemLocationInstance?.side}" valueMessagePrefix="itemLocation.side" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'segment', 'error')} ">
	<label for="segment">
		<g:message code="itemLocation.segment.label" default="Segment" />
		
	</label>
	<g:field name="segment" type="number" value="${itemLocationInstance.segment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'shelf', 'error')} ">
	<label for="shelf">
		<g:message code="itemLocation.shelf.label" default="Shelf" />
		
	</label>
	<g:field name="shelf" type="number" value="${itemLocationInstance.shelf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="itemLocation.position.label" default="Position" />
		
	</label>
	<g:field name="position" type="number" value="${itemLocationInstance.position}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="itemLocation.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:select id="lastUpdatedBy" name="lastUpdatedBy.id" from="${caoknowsv3.User.list()}" optionKey="id" value="${itemLocationInstance?.lastUpdatedBy?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

