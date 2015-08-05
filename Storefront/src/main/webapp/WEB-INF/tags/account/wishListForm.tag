<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="formId" required="true" type="java.lang.String"%>

<dsp:importbean bean="/OriginatingRequest" var="originatingRequest" />
<dsp:importbean bean="/atg/userprofiling/Profile" />
<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
<dsp:importbean bean="/atg/commerce/collections/filter/droplet/GiftlistSiteFilterDroplet" />
<dsp:importbean bean="/atg/dynamo/droplet/multisite/CartSharingSitesDroplet" />
<dsp:importbean bean="/atg/commerce/catalog/ProductLookup" />
<dsp:importbean bean="/atg/commerce/catalog/SKULookup" />
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
<dsp:importbean bean="/atg/commerce/gifts/GiftlistFormHandler" />

<dsp:setvalue beanvalue="Profile.wishlist" param="wishlist" />
<dsp:setvalue paramvalue="wishlist.giftlistItems" param="items" />
<dsp:setvalue paramvalue="wishlist.id" param="giftlistId" />
<div class="row">
	<div class="col-lg-12">
		<ul>
			<li ng-repeat="wlistItem in profileWishList">{{wlistItem.displayName}}
				<button ng-click="removeFromProfileWishList($index,wlistItem.productId,wlistItem.skuId,wlistItem.repositoryId)"><i class="fa fa-times"></i></button>
				<button ng-click="addItemToCart(wlistItem.productId,wlistItem.skuId)"><i class="fa fa-plus"></i></button>
			</li>
		</ul>
	</div>
</div>









<%--
<dsp:getvalueof id="howMany" param="howMany" />
<c:if test="${empty howMany}">
	<c:set var="howMany" value="5" />
</c:if>

<dsp:getvalueof id="start" param="start" />
<c:if test="${empty start}">
	<c:set var="start" value="1" />
</c:if>

<dsp:form action="${originatingRequest.requestURI}" method="post"
	name="${formId}" id="${formId}" formid="${formId}_FormId">
	<div class="row">

		<div class="col-lg-12">
			<table>
				<dsp:droplet name="GiftlistSiteFilterDroplet">
					<dsp:param name="collection" param="items" />

					<dsp:oparam name="empty">
		        		Пусто
		        	</dsp:oparam>

					<dsp:oparam name="output">
						<dsp:setvalue param="filteredItems"	paramvalue="filteredCollection" />

						<dsp:droplet name="/atg/dynamo/droplet/ForEach">
							<dsp:param name="array"	param="filteredItems" />
							<dsp:param name="elementName" value="giftItem" />
							<dsp:getvalueof var="gfItemIndex" param="index"/>
							<dsp:oparam name="outputStart">
								<tr>
									<th>Выбрать</th>
									<th scope="col" colspan="2" class="item"><fmt:message key="productNameRowName" /></th>
								</tr>
							</dsp:oparam>
							
							<dsp:oparam name="output">
								<dsp:droplet name="ProductLookup">
									<dsp:param name="id" param="giftItem.productId" />
									<dsp:param name="filterByCatalog" value="false" />
									<dsp:param name="filterBySite" value="false" />
									<dsp:param name="elementName" value="product"/>
									<dsp:oparam name="output">
										<tr>
											<dsp:droplet name="SKULookup">
												<dsp:param name="id" param="giftItem.catalogRefId" />
												<dsp:param name="filterByCatalog" value="false" />
												<dsp:param name="filterBySite" value="false" />
												<dsp:param name="elementName" value="sku"/>
												<dsp:oparam name="output">
													<dsp:getvalueof var="giftItemId" vartype="java.lang.String"	param="giftItem.repositoryId" />
													<dsp:getvalueof var="messageFormId"	vartype="java.lang.String" value="formid_${giftItemId}" />
													<dsp:getvalueof var="productId" vartype="java.lang.String"	param="product.repositoryId" />
				
													<dsp:getvalueof var="productDisplayName" param="sku.displayName" />
													<c:if test="${empty productDisplayName}">
														<dsp:getvalueof var="productDisplayName"
															param="product.displayName" />
														<c:if test="${empty productDisplayName}">
															<fmt:message var="productDisplayName" key="common.noDisplayName" />
														</c:if>
													</c:if>
													<dsp:input bean="CartModifierFormHandler.quantity" name="giftItemQuantity" size="4" value="1" type="hidden" />
													<td><dsp:input bean="CartModifierFormHandler.catalogRefIds" class="gift-item-checkbox" product="${productId}" paramvalue="sku.repositoryId" type="checkbox"/></td>
													<dsp:input bean="CartModifierFormHandler.productIds" class="gift-item-hidden" paramvalue="product.repositoryId" type="hidden" disabled="true"/>																										
													<td><c:out value="${productDisplayName}" /></td>
												</dsp:oparam>
											</dsp:droplet>
										</tr>									
									</dsp:oparam>
								</dsp:droplet>
							</dsp:oparam>
						</dsp:droplet>


					</dsp:oparam>

				</dsp:droplet>
			</table>
		</div>
	</div>
	<div class="row" style="padding-bottom: 56px;">
		<div class="col-lg-12">
			<dsp:input type="hidden" bean="CartModifierFormHandler.addMultipleItemsToOrderSuccessURL" value="${originatingRequest.requestURI}" />
			<dsp:input type="hidden" bean="CartModifierFormHandler.addMultipleItemsToOrderErrorURL" value="${originatingRequest.requestURI}" />
			<dsp:input type="submit" value="В корзину" bean="CartModifierFormHandler.addMultipleItemsToOrder" iclass="btn-red float-left" />
		</div>
	</div>
</dsp:form>
<script>
	$("input.gift-item-checkbox").change(function() {
		var inpProd = $("input[value='"+$(this).attr('product')+"']");
		if (inpProd.is(':disabled')) {
			inpProd.removeAttr('disabled');
 		} else { 
 			inpProd.attr('disabled', 'disabled');
		}
	});
</script>

 --%>