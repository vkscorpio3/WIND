<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<%@ attribute name="productId" required="true" rtexprvalue="true" type="java.lang.Object"%>
<%@ attribute name="skuId" required="true" rtexprvalue="true" type="java.lang.Object"%>

<dsp:importbean bean="/atg/commerce/catalog/comparison/ProductList"/>
<dsp:importbean bean="/atg/commerce/catalog/comparison/ProductListContains"/>
<dsp:importbean bean="/atg/commerce/catalog/comparison/ProductListHandler"/>

<button type="submit" class="pr__but__link pr__but_compare {{cssCompareListClass['${skuId}']}}" name="compareButton" ng-init="initCssCompareListClass('${productId}','${skuId}')" ng-click="compareListProcessor(null,'${productId}','${skuId}')"></button>
	
<%-- <dsp:form action="${originatingRequest.requestURI}" method="POST" name="addToCompareListFrom">
    <dsp:input bean="ProductListHandler.productID" value="${productId}" type="hidden"/>
    <dsp:input bean="ProductListHandler.skuID" value="${skuId}" type="hidden"/>

    <dsp:droplet name="ProductListContains">
        <dsp:param name="productList" bean="ProductList"/>
        <dsp:param name="productID" value="${productId}"/>
        <dsp:param name="skuID" value="${skuId}"/>

        <dsp:oparam name="true">
            
			<dsp:input type="hidden" bean="ProductListHandler.removeProduct" value="Submit"/>
			<button type="submit" class="pr__but__link pr__but_compare compare-active" name="compareButton">				
			</button>            
        </dsp:oparam>

        <dsp:oparam name="false">            
            <dsp:input type="hidden" bean="ProductListHandler.addProduct" value="Submit"/>
            <button type="submit" class="pr__but__link pr__but_compare" name="compareButton">				
			</button>	
        </dsp:oparam>

    </dsp:droplet>
</dsp:form>
--%>