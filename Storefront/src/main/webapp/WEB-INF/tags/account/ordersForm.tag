<%@ include file="/includes/prelude.jspf" %>
<%@ tag language="java" pageEncoding="UTF-8" %>

<dsp:importbean bean="/apm/atg/magnit/integration/droplet/PaymentStatusDroplet"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CommitOrderFormHandler"/>
<dsp:importbean bean="atg/commerce/order/purchase/CancelOrderFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/LocationStoreLookupDroplet"/>
<dsp:importbean bean="/apm/atg/commerce/order/droplet/OrderRankingDroplet"/>
<dsp:importbean bean="/apm/atg/commerce/order/droplet/OMSOrderInfoStateDroplet"/>

<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<dsp:getvalueof var="sortBy" vartype="String" param="sortBy"/>
<dsp:getvalueof var="sortAsc" vartype="String" param="sortAsc"/>
<dsp:getvalueof var="page" vartype="Integer" param="page"/>
<dsp:getvalueof var="perPage" vartype="Integer" value="2"/>
<dsp:getvalueof var="startIndex" vartype="Integer" value="0"/>

<c:choose>
    <c:when test="${empty(page)}">
        <c:set var="page" value="0"/>
        <c:set var="startIndex" value="0"/>
    </c:when>
    <c:otherwise>
        <c:set var="startIndex" value="${(page - 1)*perPage}"/>
    </c:otherwise>
</c:choose>

<dsp:droplet name="OrderLookup">
    <dsp:param name="userId" bean="Profile.repositoryId"/>
    <dsp:param name="state" value="open"/>
    <dsp:param name="sortBy" value="${sortBy}"/>
    <dsp:param name="sortAscending" value="${sortAsc}"/>
    <dsp:param name="numOrders" value="${perPage}"/>
    <dsp:param name="startIndex" value="${startIndex}"/>
    <dsp:param name="queryTotal" value="true"/>

    <dsp:oparam name="output">
        <dsp:droplet name="ForEach">
            <dsp:param name="array" param="result"/>
            <dsp:param name="elementName" value="currentOrder"/>

            <dsp:oparam name="outputStart">
	            <div class="row">	            
	                Отслеживайте информацию по вашим текущим заказам онлайн. Не забывайте оценивать качество каждого
	                вашего заказа, это позволяет нам улучшать сервис. <br/>
					<%-- Sorting by criteria --%>
					<select onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
						<option value="/myaccount/profile.jsp?sortBy=submittedDate&sortAsc=false#myOrders" ${sortBy eq 'submittedDate' and sortAsc eq 'false' ? 'selected' : ''} >
						    По дате убывание
						</option>
						<option value="/myaccount/profile.jsp?sortBy=submittedDate&sortAsc=true#myOrders" ${sortBy eq 'submittedDate' and sortAsc eq 'true' ? 'selected' : ''}>
						    По дате возрастание
						</option>
						<option value="/myaccount/profile.jsp?sortBy=priceInfo.amount&sortAsc=false#myOrders" ${sortBy eq 'priceInfo.amount' and sortAsc eq 'false' ? 'selected' : ''}>
						    По сумме убывание
						</option>
						<option value="/myaccount/profile.jsp?sortBy=priceInfo.amount&sortAsc=true#myOrders" ${sortBy eq 'priceInfo.amount' and sortAsc eq 'true' ? 'selected' : ''}>
						    По сумме возрастание
						</option>
					</select>    
	            </div>
	            <div class="row">
					<dsp:getvalueof var="totalOrders" vartype="Integer" param="totalCount"/>
					<dsp:getvalueof var="lastPage" vartype="Integer" value="0"/>
					Страницы:
					
					<c:if test="${page != 0 && page != 1}">
						<a href="profile.jsp?page=<c:out value='${page - 1}'/>#myOrders"><=</a> |
					</c:if>					
					<c:forEach var="boundaryStart" varStatus="status" begin="0" end="${totalOrders - 1}" step="${perPage}">
						<c:choose>
							<c:when test="${status.count > 0 && status.count != page}">
								<a href="profile.jsp?page=<c:out value='${status.count}'/>#myOrders">		
									<c:out value="${status.count}"/>
								</a> |
							</c:when>
							<c:otherwise>
								<c:out value="${status.count}"/> |
							</c:otherwise>						
						</c:choose>
						<c:set var="lastPage" value="${status.count}"/>
					</c:forEach>
					
					<c:if test="${lastPage != 0 && page != lastPage}">
						<c:choose>
							<c:when test="${page == 0}">
								<a href="profile.jsp?page=2#myOrders">=></a> |
							</c:when>
							<c:otherwise>
								<a href="profile.jsp?page=<c:out value='${page + 1}'/>#myOrders">=></a> |
							</c:otherwise>
						</c:choose>
					</c:if>
	            </div>
	           	<hr/>
            </dsp:oparam>
            <dsp:oparam name="output">
	            <div class="row">
	            	<div class="col-lg-4">
		            	<%--Section order info--%>
		                <a id="orderInfoToggle" href="#">Заказ №:<dsp:valueof param="currentOrder.id"/></a><br/>
		                от <dsp:valueof param="currentOrder.submittedDate" converter="date" format="dd MMM yyyy, HH:mm"/><br/>
		                <dsp:getvalueof var="orderId" vartype="String" param="currentOrder.id"/>
		
		                <%-- TODO Необходимо поставить проверку на статус заказа --%>
		                <%-- TODO: TDR-140 Функционал отмены заказа не работает. Нужно разобраться почему... --%>
		                <dsp:form action="${originatingRequest.requestURI}" method="post" formid="ordersForm_${orderId}">
		                    <dsp:input type="hidden" bean="CancelOrderFormHandler.cancelOrderErrorURL" value="profile.jsp#myOrders"/>
		                    <dsp:input type="hidden" bean="CancelOrderFormHandler.cancelOrderSuccessURL" value="profile.jsp#myOrders"/>
		                    <dsp:input type="hidden" bean="CancelOrderFormHandler.orderIdToCancel" paramvalue="currentOrder.id"/>
		                    <dsp:input type="submit" bean="CancelOrderFormHandler.cancelOrder" value="Отменить заказ" iclass="btn btn-primary" />
		                </dsp:form>
	                </div>
	                <div class="col-lg-4">
						<%-- Section shipping info --%>
						<dsp:getvalueof var="shipping" vartype="atg.repository.RepositoryItem" param="currentOrder.shippingGroups[0]"/>
						<dsp:getvalueof var="shippingInterval" vartype="atg.repository.RepositoryItem" value="${shipping.repositoryItem.shippingInterval}"/>
						<dsp:valueof value="${shippingInterval.intervalDate}" converter="date" format="dd MMM"/>,
						<dsp:valueof value="${shippingInterval.timeRanges}"/> <br/>
						
						<dsp:droplet name="Switch">
							<dsp:param name="value" value="${shipping.shippingMethod}"/>
							
							<dsp:oparam name="Ground">
								<span>Доставка по адресу:</span>
								<dsp:valueof value="${shipping.repositoryItem.address1}"/>, кв. <dsp:valueof value="${shipping.repositoryItem.apartment}"/>
							</dsp:oparam>					
							<dsp:oparam name="SelfPickup">
								<span>Самовывоз</span>					
								Магазин по адресу:<br/>
								<dsp:droplet name="LocationStoreLookupDroplet">
									<dsp:param name="id" value="${shipping.locationId}"/>
									<dsp:param name="elementName" value="store"/>
								
									<dsp:oparam name="output">
										г. <dsp:valueof param="store.city"/>, <dsp:valueof param="store.address1"/>
									</dsp:oparam>
								</dsp:droplet>
							</dsp:oparam>
						</dsp:droplet>
					</div>
					<div class="col-lg-4">
						<dsp:droplet name="OMSOrderInfoStateDroplet">
							<dsp:param name="orderId" param="currentOrder.id"/>
							<dsp:oparam name="output">
								<span>Статус заказа: <dsp:valueof param="status"/></span>
							</dsp:oparam>
						</dsp:droplet>
						<br/>
						<dsp:valueof param="currentOrder.priceInfo.amount" converter="currency"/>
						<dsp:droplet name="PaymentStatusDroplet">
							<dsp:param name="orderId" param="currentOrder.id"/>
						
							<dsp:oparam name="output">
								<dsp:getvalueof var="pay" vartype="boolean" param="paymentStatus.status"/>
								<c:choose>
									<c:when test="${pay}">
										Оплата по заказу получена.
									</c:when>
									<c:otherwise>
										Заказ не оплачен. Возможная причина:
										<dsp:valueof param="paymentStatus.message"/> <br/>
										<dsp:getvalueof var="repeatPaymentPossible" vartype="Boolean" param="repeatPaymentPossible"/>
									
										<c:if test="${repeatPaymentPossible}">
											<dsp:form action="${originatingRequest.requestURI}" method="post" formid="repeatPaymentForm_${orderId}">
												<dsp:input bean="CommitOrderFormHandler.repeatPayment" type="submit" value="Оплатить" iclass="btn btn-primary"/>
											</dsp:form>
										</c:if>
									</c:otherwise>
								</c:choose>
							</dsp:oparam>
						
							<dsp:oparam name="error">
								При получении статуса заказа возникла ошибка.
							</dsp:oparam>
						</dsp:droplet>
						<br/>
						<dsp:droplet name="OrderRankingDroplet">
							<dsp:param name="order" param="currentOrder"/>
							<dsp:oparam name="output">
								<dsp:getvalueof var="sOrder" param="shippedOrder"/>
								Оценка: <dsp:valueof param="sOrder.orderGrade" /> - <dsp:valueof param="sOrder.orderGradeNote" />
							</dsp:oparam>
						</dsp:droplet>						
					</div>
                </div>
                <hr/>
                <div class="panel-group" id="accordion_<dsp:valueof param="currentOrder.id"/>">
			        <div class="panel panel-default">
			            <div class="panel-heading">
			                <h4 class="panel-title">
			                    <a data-toggle="collapse" data-parent="#accordion_<dsp:valueof param="currentOrder.id"/>" href="#collapseOne_<dsp:valueof param="currentOrder.id"/>">Детали заказа:</a>
			                </h4>
			            </div>
			            <div id="collapseOne_<dsp:valueof param="currentOrder.id"/>" class="panel-collapse collapse">
			                <div class="panel-body">
							    <dsp:droplet name="ForEach">
				                    <dsp:param name="array" param="currentOrder.commerceItems" />
				                    <dsp:param name="elementName" value="commerceItem"/>
				                    <dsp:oparam name="output">
				                        <div class="row">
				                            <div class="col-lg-2"><dsp:valueof param="count"/></div>
				                            <div class="col-lg-3">
				                                <img src="<dsp:valueof param="commerceItem.auxiliaryData.productRef.largeImage.url"/>" class="cart-img" alt="" height="128px"/>                                
				                            </div>
				                            <div class="col-lg-3"><dsp:valueof param="commerceItem.auxiliaryData.catalogRef.displayName" /></div>
				                            <div class="col-lg-2"><dsp:valueof param="commerceItem.quantity" /></div>
				                            <div class="col-lg-2"><dsp:valueof converter="currency" param="commerceItem.priceInfo.amount" /></div>
				                        </div>
				                    </dsp:oparam>
				                </dsp:droplet>			                    
			                </div>
			            </div>
			        </div>
			    </div>                
                <hr/>             
            </dsp:oparam>
       </dsp:droplet>
    </dsp:oparam>
    
    <dsp:oparam name="empty">
        Заказов не найдено.
    </dsp:oparam>

    <dsp:oparam name="error">
        При поиске заказов произошла ошибка. Пожалуйста, обратитесь в службу для помощи.
    </dsp:oparam>
</dsp:droplet>
<%-- 
<dsp:droplet name="OrderLookup">
    <dsp:param name="userId" bean="Profile.repositoryId"/>
    <dsp:param name="state" value="open"/>
    <dsp:param name="sortBy" value="${sortBy}"/>
    <dsp:param name="sortAscending" value="${sortAsc}"/>
    <dsp:param name="numOrders" value="${perPage}"/>
    <dsp:param name="startIndex" value="${startIndex}"/>
    <dsp:param name="queryTotal" value="true"/>

    <dsp:oparam name="output">
        <dsp:droplet name="ForEach">
            <dsp:param name="array" param="result"/>
            <dsp:param name="elementName" value="currentOrder"/>

            <dsp:oparam name="outputStart">
                Отслеживайте информацию по вашим текущим заказам онлайн. Не забывайте оценивать качество каждого
                вашего заказа, это позволяет нам улучшать сервис. <br/>

                <div class="row">
                <table class="col-lg-12">
                <tr>
                    <td colspan="2">
                        //-- Sorting by criteria --//
                        <select onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                            <option value="/myaccount/profile.jsp?sortBy=submittedDate&sortAsc=false#myOrders"
                                    <c:if test="${sortBy eq 'submittedDate' and sortAsc eq 'false'}">selected</c:if> >
                                По дате убывание
                            </option>
                            <option value="/myaccount/profile.jsp?sortBy=submittedDate&sortAsc=true#myOrders"
                                    <c:if test="${sortBy eq 'submittedDate' and sortAsc eq 'true'}">selected</c:if> >
                                По дате возрастание
                            </option>
                            <option value="/myaccount/profile.jsp?sortBy=priceInfo.amount&sortAsc=false#myOrders"
                                    <c:if test="${sortBy eq 'priceInfo.amount' and sortAsc eq 'false'}">selected</c:if> >
                                По сумме убывание
                            </option>
                            <option value="/myaccount/profile.jsp?sortBy=priceInfo.amount&sortAsc=true#myOrders"
                                    <c:if test="${sortBy eq 'priceInfo.amount' and sortAsc eq 'true'}">selected</c:if> >
                                По сумме возрастание
                            </option>
                        </select>
                    </td>
                    <td colspan="3" align="right">
                        <dsp:getvalueof var="totalOrders" vartype="Integer" param="totalCount"/>
                        <dsp:getvalueof var="lastPage" vartype="Integer" value="0"/>
                        Страницы:

                        <c:if test="${page != 0 && page != 1}">
                            <a href="profile.jsp?page=<c:out value='${page - 1}'/>#myOrders">
                                <=
                            </a> |
                        </c:if>

                        <c:forEach
                                var="boundaryStart"
                                varStatus="status"
                                begin="0"
                                end="${totalOrders - 1}"
                                step="${perPage}">
                            <c:choose>
                                <c:when test="${status.count > 0 && status.count != page}">
                                    <a href="profile.jsp?page=<c:out value='${status.count}'/>#myOrders">

                                        <c:out value="${status.count}"/>
                                    </a> |
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${status.count}"/> |
                                </c:otherwise>

                            </c:choose>
                            <c:set var="lastPage" value="${status.count}"/>
                        </c:forEach>

                        <c:if test="${lastPage != 0 && page != lastPage}">
                            <c:choose>
                                <c:when test="${page == 0}">
                                    <a href="profile.jsp?page=2#myOrders">
                                        =>
                                    </a> |
                                </c:when>
                                <c:otherwise>
                                    <a href="profile.jsp?page=<c:out value='${page + 1}'/>#myOrders">
                                        =>
                                    </a> |
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </td>
                </tr>

                <tr>
                    <td colspan="5">
                        <hr/>
                    </td>
                </tr>
            </dsp:oparam>

            <dsp:oparam name="output">
                <tr>
                    <td>
                        //--Section order info--//
                        <a id="orderInfoToggle" href="#">Заказ №:<dsp:valueof param="currentOrder.id"/></a> <br/>
                        от <dsp:valueof param="currentOrder.submittedDate" converter="date"
                                        format="dd MMM yyyy, HH:mm"/> <br/>

                        <dsp:getvalueof var="orderId" vartype="String" param="currentOrder.id"/>

                        //-- TODO Необходимо поставить проверку на статус заказа --//
                        //-- TODO: TDR-140 Функционал отмены заказа не работает. Нужно разобраться почему... --//
                        <dsp:form action="${originatingRequest.requestURI}" method="post" formid="ordersForm_${orderId}">
                            <dsp:input type="hidden" bean="CancelOrderFormHandler.cancelOrderErrorURL" value="profile.jsp#myOrders"/>
                            <dsp:input type="hidden" bean="CancelOrderFormHandler.cancelOrderSuccessURL" value="profile.jsp#myOrders"/>
                            <dsp:input type="hidden" bean="CancelOrderFormHandler.orderIdToCancel" paramvalue="currentOrder.id"/>
                            <dsp:input type="submit" bean="CancelOrderFormHandler.cancelOrder" value="Отменить заказ"
                                       iclass="btn btn-primary" />
                        </dsp:form>

                    </td>
                    <td>
                        //--Section shipping info--//
                        <dsp:getvalueof var="shipping" vartype="atg.repository.RepositoryItem"
                                        param="currentOrder.shippingGroups[0]"/>
                        <dsp:getvalueof var="shippingInterval" vartype="atg.repository.RepositoryItem"
                                        value="${shipping.repositoryItem.shippingInterval}"/>
                        <dsp:valueof value="${shippingInterval.intervalDate}" converter="date" format="dd MMM"/>,
                        <dsp:valueof value="${shippingInterval.timeRanges}"/> <br/>

                        <dsp:droplet name="Switch">
                            <dsp:param name="value" value="${shipping.shippingMethod}"/>

                            <dsp:oparam name="Ground">
                                <h3>Доставка по адресу:</h3>
                                <dsp:valueof value="${shipping.repositoryItem.address1}"/>,
                                кв. <dsp:valueof value="${shipping.repositoryItem.apartment}"/>
                            </dsp:oparam>

                            <dsp:oparam name="SelfPickup">
                                <h3>Самовывоз</h3>

                                Магазин по адресу: <br />
                                <dsp:droplet name="LocationStoreLookupDroplet">
                                    <dsp:param name="id" value="${shipping.locationId}"/>
                                    <dsp:param name="elementName" value="store"/>

                                    <dsp:oparam name="output">
                                        г. <dsp:valueof param="store.city"/>,
                                        <dsp:valueof param="store.address1"/>
                                    </dsp:oparam>
                                </dsp:droplet>
                            </dsp:oparam>
                        </dsp:droplet>

                    </td>

                    <td>
                        <dsp:droplet name="OMSOrderInfoStateDroplet">
                            <dsp:param name="orderId" param="currentOrder.id"/>
                            <dsp:oparam name="output">
                                <h3>Статус заказа: <dsp:valueof param="status"/></h3>
                            </dsp:oparam>
                        </dsp:droplet>

                    </td>

                    <td>
                        <h3><dsp:valueof param="currentOrder.priceInfo.amount" converter="currency"/></h3>
                    </td>

                    <td>
                        <dsp:droplet name="PaymentStatusDroplet">
                            <dsp:param name="orderId" param="currentOrder.id"/>

                            <dsp:oparam name="output">
                                <dsp:getvalueof var="pay" vartype="boolean" param="paymentStatus.status"/>
                                <c:choose>
                                    <c:when test="${pay}">
                                        Оплата по заказу получена.
                                    </c:when>
                                    <c:otherwise>
                                        Заказ не оплачен. Возможная причина:
                                        <dsp:valueof param="paymentStatus.message"/> <br/>
                                        <dsp:getvalueof var="repeatPaymentPossible" vartype="Boolean"
                                                        param="repeatPaymentPossible"/>

                                        <c:if test="${repeatPaymentPossible}">
                                            <dsp:form action="${originatingRequest.requestURI}" method="post" formid="repeatPaymentForm_${orderId}">
                                                <dsp:input bean="CommitOrderFormHandler.repeatPayment" type="submit"
                                                       value="Оплатить" iclass="btn btn-primary"/>
                                            </dsp:form>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </dsp:oparam>

                            <dsp:oparam name="error">
                                При получении статуса заказа возникла ошибка.
                            </dsp:oparam>
                        </dsp:droplet>
                    </td>
                    <td>
                    	<dsp:droplet name="OrderRankingDroplet">
                    		<dsp:param name="order" param="currentOrder"/>
                    		<dsp:oparam name="output">
                    			<dsp:getvalueof var="sOrder" param="shippedOrder"/>
                    			Оценка: <dsp:valueof param="sOrder.orderGrade" /> - <dsp:valueof param="sOrder.orderGradeNote" />
                    		</dsp:oparam>
                    	</dsp:droplet>                    	
                    </td>
                </tr>

                <tr>
                    <td colspan="5">
                        <hr/>
                    </td>
                </tr>

                <tr>
                    <td colspan="5">
                        Детали заказа:
                    </td>
                </tr>

                <tr>
                    <td colspan="5">
                        <hr/>
                    </td>
                </tr>

                <dsp:droplet name="ForEach">
                    <dsp:param name="array" param="currentOrder.commerceItems" />
                    <dsp:param name="elementName" value="commerceItem"/>
                    <dsp:oparam name="output">
                        <tr>
                            <td><dsp:valueof param="count"/></td>
                            <td>
                                <img src="<dsp:valueof param="commerceItem.auxiliaryData.productRef.largeImage.url"/>" class="cart-img" alt="" />
                                <dsp:valueof param="commerceItem.auxiliaryData.catalogRef.displayName" />
                            </td>
                            <td><dsp:valueof param="commerceItem.quantity" /></td>
                            <td><dsp:valueof converter="currency" param="commerceItem.priceInfo.amount" /></td>
                        </tr>
                    </dsp:oparam>
                </dsp:droplet>

                <tr>
                    <td colspan="5">
                        <hr/>
                    </td>
                </tr>
            </dsp:oparam>

            <dsp:oparam name="outputEnd">
                </table>
                </div>
            </dsp:oparam>

        </dsp:droplet>
    </dsp:oparam>

    <dsp:oparam name="empty">
        Заказов не найдено.
    </dsp:oparam>

    <dsp:oparam name="error">
        При поиске заказов произошла ошибка. Пожалуйста, обратитесь в службу для помощи.
    </dsp:oparam>
</dsp:droplet>
--%>