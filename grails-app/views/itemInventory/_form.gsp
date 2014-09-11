<%@ page import="caoknowsv3.ItemInventory" %>



<div class="fieldcontain ${hasErrors(bean: itemInventoryInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="itemInventory.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${caoknowsv3.Item.list()}" optionKey="id" required="" value="${itemInventoryInstance?.item?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInventoryInstance, field: 'shelf', 'error')} ">
	<label for="shelf">
		<g:message code="itemInventory.shelf.label" default="Shelf" />
		
	</label>
	<g:field name="shelf" type="number" value="${itemInventoryInstance.shelf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInventoryInstance, field: 'backroom', 'error')} ">
	<label for="backroom">
		<g:message code="itemInventory.backroom.label" default="Backroom" />
		
	</label>
	<g:field name="backroom" type="number" value="${itemInventoryInstance.backroom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInventoryInstance, field: 'mezzanine', 'error')} ">
	<label for="mezzanine">
		<g:message code="itemInventory.mezzanine.label" default="Mezzanine" />
		
	</label>
	<g:field name="mezzanine" type="number" value="${itemInventoryInstance.mezzanine}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInventoryInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="itemInventory.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:select id="lastUpdatedBy" name="lastUpdatedBy.id" from="${caoknowsv3.User.list()}" optionKey="id" value="${itemInventoryInstance?.lastUpdatedBy?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

