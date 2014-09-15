<%@ page import="caoknowsv3.ItemLocation" %>


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


