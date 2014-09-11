<%@ page import="caoknowsv3.OrderBook" %>



<div class="fieldcontain ${hasErrors(bean: orderBookInstance, field: 'bookNumber', 'error')} required">
	<label for="bookNumber">
		<g:message code="orderBook.bookNumber.label" default="Book Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bookNumber" type="number" min="0" value="${orderBookInstance.bookNumber}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: orderBookInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="orderBook.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${orderBookInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orderBookInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="orderBook.createdBy.label" default="Created By" />
		
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${caoknowsv3.User.list()}" optionKey="id" value="${orderBookInstance?.createdBy?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orderBookInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="orderBook.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:select id="lastUpdatedBy" name="lastUpdatedBy.id" from="${caoknowsv3.User.list()}" optionKey="id" value="${orderBookInstance?.lastUpdatedBy?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orderBookInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="orderBook.items.label" default="Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${orderBookInstance?.items?}" var="i">
    <li><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="item" action="create" params="['orderBook.id': orderBookInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'item.label', default: 'Item')])}</g:link>
</li>
</ul>


</div>

