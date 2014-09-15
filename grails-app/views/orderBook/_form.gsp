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
