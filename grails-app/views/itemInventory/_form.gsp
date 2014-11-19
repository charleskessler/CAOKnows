<%@ page import="caoknowsv3.ItemInventory" %>


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

<div class="fieldcontain ${hasErrors(bean: itemInventoryInstance, field: 'minimumLevel', 'error')} ">
    <label for="minimumLevel">
        <g:message code="itemInventory.minimumLevel.label" default="Minimum Presentation" />

    </label>
    <g:field name="minimumLevel" type="number" value="${itemInventoryInstance.minimumLevel}"/>

</div>

