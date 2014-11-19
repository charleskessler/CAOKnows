
<%@ page import="caoknowsv3.ItemLocation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemLocation.label', default: 'Item Location')}" />
		<title>Item Location</title>
	</head>
	<body>
		<a href="#show-itemLocation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="show-itemLocation" class="content scaffold-show" role="main">
			<h1>Item Location</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list itemLocation">
			
				<g:if test="${itemLocationInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="itemLocation.item.label" default="Item" /></span>
					
						<span class="property-value" aria-labelledby="item-label"><g:link controller="item" action="show" id="${itemLocationInstance?.item?.id}">${itemLocationInstance?.item?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemLocationInstance?.aisle}">
				<li class="fieldcontain">
					<span id="aisle-label" class="property-label"><g:message code="itemLocation.aisle.label" default="Aisle" /></span>
					
						<span class="property-value" aria-labelledby="aisle-label"><g:fieldValue bean="${itemLocationInstance}" field="aisle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemLocationInstance?.side}">
				<li class="fieldcontain">
					<span id="side-label" class="property-label"><g:message code="itemLocation.side.label" default="Side" /></span>
					
						<span class="property-value" aria-labelledby="side-label"><g:fieldValue bean="${itemLocationInstance}" field="side"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemLocationInstance?.segment}">
				<li class="fieldcontain">
					<span id="segment-label" class="property-label"><g:message code="itemLocation.segment.label" default="Segment" /></span>
					
						<span class="property-value" aria-labelledby="segment-label"><g:fieldValue bean="${itemLocationInstance}" field="segment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemLocationInstance?.shelf}">
				<li class="fieldcontain">
					<span id="shelf-label" class="property-label"><g:message code="itemLocation.shelf.label" default="Shelf" /></span>
					
						<span class="property-value" aria-labelledby="shelf-label"><g:fieldValue bean="${itemLocationInstance}" field="shelf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemLocationInstance?.position}">
				<li class="fieldcontain">
					<span id="position-label" class="property-label"><g:message code="itemLocation.position.label" default="Position" /></span>
					
						<span class="property-value" aria-labelledby="position-label"><g:fieldValue bean="${itemLocationInstance}" field="position"/></span>
					
				</li>
				</g:if>

            </ol>

            <h1>Edit History</h1>
            <ol class="property-list item">
				<g:if test="${itemLocationInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="itemLocation.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label">${itemLocationInstance?.lastUpdatedBy?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${itemLocationInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="itemLocation.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${itemLocationInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
            </ol>
            <g:isManager>
                <g:form url="[resource:itemLocationInstance, action:'delete']" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${itemLocationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        </fieldset>
                </g:form>
            </g:isManager>
		</div>
	</body>
</html>
