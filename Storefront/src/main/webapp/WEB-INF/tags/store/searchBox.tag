<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<dsp:importbean bean="/OriginatingRequest" var="originatingRequest" />
<dsp:getvalueof var="contextPath" value="${originatingRequest.contextPath}" />

<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler" />
<dsp:droplet name="InvokeAssembler">
	<dsp:param name="contentCollection"	value="/content/Shared/Global Search Configuration/Search Box" />
	<dsp:oparam name="output">
		<dsp:getvalueof var="searchBox"
			vartype="com.endeca.infront.assembler.ContentItem"
			param="contentItem" />
	</dsp:oparam>
</dsp:droplet>
<c:if test="${not empty searchBox}">
	<dsp:renderContentItem contentItem="${searchBox}" />
</c:if>