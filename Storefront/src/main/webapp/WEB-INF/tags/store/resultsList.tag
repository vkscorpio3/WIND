<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<dsp:importbean bean="/apm/atg/commerce/order/droplet/CommerceItemAsMap"/>

<%@ attribute name="contentItem" required="true" rtexprvalue="true" type="java.lang.Object"%>

<dsp:droplet name="CommerceItemAsMap">
	<dsp:param name="mode" value="sku"/>
	<dsp:param name="order" bean="/atg/commerce/ShoppingCart.current"/>
	<dsp:oparam name="output">
		<dsp:getvalueof param="idToQuantityMap" var="idToQuantityMap"/>
	</dsp:oparam>
</dsp:droplet>

<mws:resultsPagination contentItem="${contentItem}"/>
<div ng-controller="AdultAccessCtrl">
	<ul class="row c-catalog-products grid">        
		<c:forEach var="record" items="${contentItem.records}" varStatus="loopStatus">
			<dsp:getvalueof var="index" value="${loopStatus.index+1}"/>
			
			<dsp:include page="../../global/gadgets/productView.jsp">
				<dsp:param name="place" value="results"/>
				<dsp:param name="record" value="${record}"/>
			</dsp:include>
	
		</c:forEach>
    </ul>
</div>
<mws:resultsPagination contentItem="${contentItem}"/>