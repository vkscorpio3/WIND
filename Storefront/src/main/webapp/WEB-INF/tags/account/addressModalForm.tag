<%@ include file="/includes/prelude.jspf" %>
<%@ tag language="java"%>

<%@ attribute name="modalDialogId" required="true" type="java.lang.String" %>
<%@ attribute name="type" required="true" type="java.lang.String" %>
<%@ attribute name="nickname" type="java.lang.String" %>
<%@ attribute name="formHandlerComponent" required="true" type="java.lang.Object" %>
<%@ attribute name="shippingMethod" type="java.lang.String" %>
<%@ attribute name="title" type="java.lang.String" %>
<%@ attribute name="mapId" type="java.lang.String" %>

<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach" />
<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler"/>
<dsp:importbean bean="/atg/multisite/Site"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />

<%--
	<c:if test="${not empty nickname}">
		<dsp:getvalueof bean="Profile.shippingAddress" var="defaultShippingAddress"/>
		<dsp:setvalue bean="ProfileFormHandler.initEditValueWithNickname" value="${nickname}"/>
	</c:if>
--%>
<style type="text/css">
	.ymap {
		width: 105%;
		height: 524px;
	}
	.warntext{
		margin-left: 40px;
	}
	.padding-left{
		padding-left: 50px;
	}
</style>

<script type="text/javascript">
	var mapUrl = '<dsp:valueof bean="Site.yandexMapDefinition"/>';
	var siteLatitude = '<dsp:valueof bean="Site.latitude"/>';
	var siteLongitude = '<dsp:valueof bean="Site.longitude"/>';
</script>	

<dsp:form action="${originatingRequest.requestURI}" method="post" formid="${modalDialogId}_FormId">
	<mws:modalDialog id="${modalDialogId}" closeButton="true" title="${title}" width="80%">
		<jsp:attribute name="body">
			<div class="row">
				<div class="col-lg-5">
					<div id="${mapId}" class="ymap">
					</div>
				</div>
				<div class="col-lg-6">
					<p class="warntext">	Если Вы планируете получать заказ самостоятельно, никаких изменений в форму вносить не требуется.
						Вы можете заказать доставку третьему лицу или создать несколько адресов для себя, каждый со своим примечанием и контактным лицом.
					</p>
				</div>
				<div class="col-lg-7">
					<dsp:input type="hidden" bean="ShippingGroupFormHandler.address.ownerId" beanvalue="Profile.id"/>
		
					<div class="form-horizontal padding-left" >
						<div class="form-group">
							<label class="col-lg-2 control-label">Название <span class="not-empty">*</span></label>
							<div class="col-lg-8">
								<c:if test="${type == 'profile'}">
									<c:choose>
										<c:when test="${modalDialogId == 'editAddress'}">
											<dsp:input type="text" id="${modalDialogId}_nickname"
													   bean="${formHandlerComponent}.newNickname"
													   maxlength="40"
													   iclass="form-block"
													   placeholder="Введите название"/>
											<dsp:input type="hidden" id="nickname"
													   bean="${formHandlerComponent}.nickname"
													   maxlength="40" iclass="form-block"/>
										</c:when>
										<c:otherwise>
											<dsp:input type="text" id="${modalDialogId}_nickname"
												   bean="ProfileFormHandler.editValue.nickname"
												   maxlength="40"
												   required="true" iclass="form-block"
											       placeholder="Введите название" />
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${type == 'shipping'}">
									<dsp:input bean="ShippingGroupFormHandler.newShipToAddressName"
											   type="text" maxlength="42"
											   required="true" iclass="form-block"
										       placeholder="Введите название" />
								</c:if>
							</div>
						</div>
		
						<div class="form-group">
							<label class="col-lg-2 control-label">Фамилия <span class="not-empty">*</span></label>
							<div class="col-lg-8">
								<dsp:input type="text" id="${modalDialogId}_lastname"
									bean="${formHandlerComponent}.lastName"
									beanvalue="Profile.lastName"
									required="true" iclass="form-block"
									placeholder="Введите Вашу фамилию"  />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Имя <span
								class="not-empty">*</span></label>
							<div class="col-lg-8">
								<dsp:input type="text" id="${modalDialogId}_firstname"
									bean="${formHandlerComponent}.firstName"
									beanvalue="Profile.firstName"
									required="true" iclass="form-block" placeholder="Введите Ваше имя"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Телефон <span
								class="not-empty">*</span></label>
							<div class="col-lg-8">
								<dsp:input type="text" id="${modalDialogId}_phonenumber"
									bean="${formHandlerComponent}.phoneNumber"
									beanvalue="Profile.daytimeTelephoneNumber"
									required="true" iclass="form-block"
									placeholder="Введите Ваш номер телефона" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Email <span
								class="not-empty">*</span></label>
							<div class="col-lg-8">
								<dsp:input type="text" id="${modalDialogId}_email"
									bean="${formHandlerComponent}.email"
									beanvalue="Profile.email"
									required="true" iclass="form-block"
									placeholder="Введите Ваш электронный адрес" />
							</div>
						</div>
						<dsp:input type="hidden" required="true"
							   	   id="${modalDialogId}_country"
								   bean="${formHandlerComponent}.country"/>
						<div class="form-group">
							<label class="col-lg-2 control-label">Город <span
								class="not-empty">*</span></label>
							<div class="col-lg-8">
								<dsp:input type="text"
									id="${modalDialogId}_city"
									bean="${formHandlerComponent}.city"
									required="true" iclass="form-block" placeholder="Введите Ваш город"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Улица<span
								class="not-empty">*</span></label>
							<div class="col-lg-8">
								<dsp:input type="text"
									id="${modalDialogId}_street"
									bean="${formHandlerComponent}.street"
									required="true" iclass="form-block" readonly="true" size="45"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Дом<span
								class="not-empty">*</span></label>
							<div class="col-lg-8">
								<dsp:input type="text"
									id="${modalDialogId}_house"
									bean="${formHandlerComponent}.house"
									required="true" iclass="form-block" readonly="true"  size="10"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Этаж</label>
							<div class="col-lg-1">
								<dsp:input type="text" id="${modalDialogId}_floor"
									bean="${formHandlerComponent}.floor"
									maxlength="10" iclass="form-block" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Квартира</label>
							<div class="col-lg-1">
								<dsp:input type="text" id="${modalDialogId}_apartment"
									bean="${formHandlerComponent}.apartment"
									maxlength="10" iclass="form-block" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Комментарий к адресу</label>
							<div class="col-lg-8">
								<dsp:textarea type="text" id="${modalDialogId}_description"
									bean="${formHandlerComponent}.description"
									iclass="form-block"/>
							</div>
						</div>
						<%-- <div class="form-group">
							<label class="col-lg-2 control-label">Широта</label>
							<div class="col-lg-1">
								<dsp:input type="text" number="###.#######"
									bean="${formHandlerComponent}.latitude"
									iclass="form-block" />
							</div>
							<label class="col-lg-2 control-label">Долгота</label>
						<div class="col-lg-1">
							<dsp:input type="text" number="###.#######"
								bean="${formHandlerComponent}.longitude"
								iclass="form-block" />
						</div>
					</div> --%>
					<c:if test="${type == 'shipping'}">
						<div class="form-group">
							<label class="col-lg-2 control-label"></label>
							<div class="col-lg-8">
								<dsp:input type="checkbox" checked="true" bean="ShippingGroupFormHandler.saveShippingAddress" /><span>Сохранить адрес</span>
				            </div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		
		<dsp:input type="hidden" bean="${formHandlerComponent}.latitude" id="${modalDialogId}_latitude" required="true" />
		<dsp:input type="hidden" bean="${formHandlerComponent}.longitude" id="${modalDialogId}_longitude" required="true" />
		<dsp:input type="hidden" bean="${formHandlerComponent}.address1" id="${modalDialogId}_address1" required="true" />
	
	</jsp:attribute>
		<jsp:attribute name="footer">
			<c:if test="${type == 'shipping'}">
				<dsp:input type="hidden" bean="ShippingGroupFormHandler.shippingMethod" value="${shippingMethod}" />
				<dsp:input type="hidden" bean="ShippingGroupFormHandler.address.email" beanvalue="Profile.email" />
				<dsp:input type="hidden" bean="ShippingGroupFormHandler.shipToNewAddressSuccessURL"	value="${originatingRequest.contextPath}/checkout/deliveryTime.jsp" />
				<dsp:input type="hidden" bean="ShippingGroupFormHandler.shipToNewAddressErrorURL" value="${originatingRequest.contextPath}/checkout/delivery.jsp" />	
				<dsp:input type="submit" bean="ShippingGroupFormHandler.shipToNewAddress" value="Подтвердить" iclass="btn btn-primary" />
			</c:if>
			<c:if test="${type == 'profile'}">		
				<c:choose>
					<c:when test="${modalDialogId == 'editAddress'}">
						<dsp:input type="hidden" bean="ProfileFormHandler.updateAddressSuccessURL" value="${originatingRequest.requestURI}" />
						<dsp:input type="hidden" bean="ProfileFormHandler.updateAddressErrorURL" value="${originatingRequest.requestURI}?nickname=${nickname}" />
						<dsp:input id="latitude" type="hidden" bean="ProfileFormHandler.editValue.latitude" />
						<dsp:input id="longitude" type="hidden" bean="ProfileFormHandler.editValue.longitude" />
						<dsp:input type="submit" value="Сохранить" title="Сохранить" bean="ProfileFormHandler.updateAddress" iclass="btn btn-primary" />					
					</c:when>
					<c:otherwise>
						<dsp:input type="hidden" bean="ProfileFormHandler.addAddressSuccessURL"	value="${originatingRequest.requestURI}" />
						<dsp:input type="hidden" bean="ProfileFormHandler.addAddressErrorURL" value="${originatingRequest.requestURI}" />				
						<dsp:input type="submit" bean="ProfileFormHandler.addAddress" value="Добавить" iclass="btn btn-primary" />				
					</c:otherwise>
				</c:choose>
			</c:if>
		</jsp:attribute>
	</mws:modalDialog>
</dsp:form>
