<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<dsp:importbean bean="/apm/atg/magnit/droplet/SkuAvailabilityLookup" />

<%@ attribute name="skuId" required="true" %>

<dsp:droplet name="SkuAvailabilityLookup">
	<dsp:param name="skuId" value="${skuId}" />
	<dsp:oparam name="available">
		<%-- SKU is available, set output variables. --%>
		<dsp:getvalueof var="availability" value="available" scope="request" />
	</dsp:oparam>
	<dsp:oparam name="unavailable">
		<%-- SKU is not available. Set output variables only if showUnavailable is true. --%>
		<dsp:getvalueof var="availability" value="unavailable" scope="request" />
	</dsp:oparam>
	<dsp:oparam name="error">
		Ошибка
	</dsp:oparam>
</dsp:droplet>
