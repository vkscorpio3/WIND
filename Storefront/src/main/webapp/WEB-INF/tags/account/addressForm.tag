<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<%@attribute name="formId" required="true" type="java.lang.String"%>
<%@attribute name="type" required="true" type="java.lang.String"%>
<%@attribute name="nickname" type="java.lang.String"%>
<%@attribute name="formHandlerComponent" required="true" type="java.lang.Object" %>
<%@attribute name="shippingMethod" type="java.lang.String" %>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach" />
<dsp:importbean bean="/atg/dynamo/droplet/Switch" />

<c:if test="${not empty nickname}">
	<dsp:getvalueof bean="Profile.shippingAddress" var="defaultShippingAddress"/>
	<dsp:setvalue bean="ProfileFormHandler.initEditValueWithNickname" value="${nickname}"/>
</c:if>
<style type="text/css">
	#map {
		width: 100%;
		height: 660px;
	}
</style>


<dsp:form action="${originatingRequest.requestURI}" method="post" formid="${formId}_FormId">
	<div class="col-lg-7 bg5" style="box-shadow: 5px -3px 10px rgba(0,0,0,0.5); z-index: 1; padding: 10px;">
		<dsp:input type="hidden" bean="ShippingGroupFormHandler.address.ownerId" beanvalue="Profile.id"/>
		
		<div class="form-horizontal">
			<div class="form-group">
				<label class="col-lg-2 control-label">Название <span class="not-empty">*</span></label>
				<div class="col-lg-8">
					<c:if test="${type == 'profile'}">
						<c:choose>
							<c:when test="${not empty nickname}">
								<dsp:input bean="ProfileFormHandler.editValue.newNickname" 
										   type="text" maxlength="40"
										   iclass="form-block" value="${nickname}"
										   placeholder="Введите название"/>
								<dsp:input bean="ProfileFormHandler.editValue.nickname" 
										   type="hidden" 
										   maxlength="40" iclass="form-block"
										   value="${nickname}"/>
							</c:when>
							<c:otherwise>
								<dsp:input bean="ProfileFormHandler.editValue.nickname" 
									   type="text" maxlength="40"
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
					<dsp:input type="text"
						bean="${formHandlerComponent}.lastName"
						required="true" iclass="form-block"
						placeholder="Введите Вашу фамилию" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-2 control-label">Имя <span
					class="not-empty">*</span></label>
				<div class="col-lg-8">
					<dsp:input type="text"
						bean="${formHandlerComponent}.firstName"
						required="true" iclass="form-block" placeholder="Введите Ваше имя" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-2 control-label">Телефон <span
					class="not-empty">*</span></label>
				<div class="col-lg-8">
					<dsp:input type="text"
						bean="${formHandlerComponent}.phoneNumber"
						required="true" iclass="form-block"
						placeholder="Введите Ваш номер телефона" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-2 control-label">Email <span
					class="not-empty">*</span></label>
				<div class="col-lg-8">
					<dsp:input type="text"
						bean="${formHandlerComponent}.email"
						required="true" iclass="form-block"
						placeholder="Введите Ваш электронный адрес" />
				</div>
			</div>
			<dsp:input type="hidden" required="true"
				   	   id="country" 
					   bean="${formHandlerComponent}.country"/>
			<div class="form-group">
				<label class="col-lg-2 control-label">Город <span
					class="not-empty">*</span></label>
				<div class="col-lg-8">
					<dsp:input type="text"
						id="city"
						bean="${formHandlerComponent}.city"
						required="true" iclass="form-block" placeholder="Введите Ваш город" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-2 control-label">Адрес 1<span
					class="not-empty">*</span></label>
				<div class="col-lg-8">
					<dsp:input type="text"
						id="address1"
						bean="${formHandlerComponent}.address1"
						required="true" iclass="form-block" readonly="true"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-2 control-label">Этаж</label>
				<div class="col-lg-1">
					<dsp:input type="text"
						bean="${formHandlerComponent}.floor"
						maxlength="10" iclass="form-block" />
				</div>
				<label class="col-lg-2 control-label">Квартира</label>
				<div class="col-lg-1">
					<dsp:input type="text"
						bean="${formHandlerComponent}.apartment"
						maxlength="10" iclass="form-block" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-2 control-label">Комментарий к адресу</label>
				<div class="col-lg-8">
					<dsp:input type="text"
						id="description"
						bean="${formHandlerComponent}.description"
						iclass="form-block"/>
				</div>
			</div>
			<%--
				<div class="form-group">
					<label class="col-lg-2 control-label">Широта</label>
					<div class="col-lg-1">
						<dsp:input type="text" number="###.#######"
							bean="${formHandlerComponent}.latitude"
							iclass="form-block"
							id="latitude"/>
					</div>
					<label class="col-lg-2 control-label">Долгота</label>
					<div class="col-lg-1">
						<dsp:input type="text" number="###.#######"
							bean="${formHandlerComponent}.longitude"
							iclass="form-block"
							id="longitude"/>
					</div>
				</div>
			--%>
			<div class="form-group">
				<label class="col-lg-2 control-label">Почтовый индекс <span
					class="not-empty">*</span></label>
				<div class="col-lg-8">
					<dsp:input type="text"
						bean="${formHandlerComponent}.postalCode"
						required="true" iclass="form-block"
						placeholder="Введите Ваш почтовый индекс" />
				</div>
			</div>
			<c:if test="${type == 'shipping'}">
				<div class="form-group">
					<label class="col-lg-2 control-label"></label>				
					<div class="col-lg-8">
						<dsp:input type="checkbox" checked="true" bean="ShippingGroupFormHandler.saveShippingAddress" /><span>Сохранить адрес</span>
		            </div>                     
				</div>
			</c:if>
		</div>
		<div class="box">
			<c:if test="${type == 'shipping'}">
				<dsp:input type="hidden" bean="ShippingGroupFormHandler.shippingMethod" value="${shippingMethod}" />	
				<dsp:input type="hidden" bean="ShippingGroupFormHandler.address.email" beanvalue="Profile.email" />
				<dsp:input type="hidden" bean="ShippingGroupFormHandler.shipToNewAddressSuccessURL"	value="${originatingRequest.contextPath}/checkout/deliveryTime.jsp" />
				<dsp:input type="hidden" bean="ShippingGroupFormHandler.shipToNewAddressErrorURL" value="${originatingRequest.contextPath}/checkout/delivery.jsp" />
				<dsp:input type="submit" bean="ShippingGroupFormHandler.cancel" value="Отменить" iclass="btn btn-primary" />		
				<dsp:input type="submit" bean="ShippingGroupFormHandler.shipToNewAddress" value="Подтвердить" iclass="btn btn-primary" />
			</c:if>
			<c:if test="${type == 'profile'}">		
				<c:choose>
					<c:when test="${not empty nickname}">
						<dsp:input type="hidden" bean="ProfileFormHandler.updateAddressSuccessURL" value="/myaccount/profile.jsp" />
						<dsp:input type="hidden" bean="ProfileFormHandler.updateAddressErrorURL" value="${originatingRequest.requestURI}?nickname=${nickname}" />
						<dsp:input id="latitude" type="hidden" bean="ProfileFormHandler.editValue.latitude" />
						<dsp:input id="longitude" type="hidden" bean="ProfileFormHandler.editValue.longitude" />
						<dsp:input type="submit" value="Сохранить" title="Сохранить" bean="ProfileFormHandler.updateAddress" iclass="btn btn-primary" />					
					</c:when>
					<c:otherwise>
						<dsp:input type="hidden" bean="ProfileFormHandler.addAddressSuccessURL"	value="/myaccount/profile.jsp" />
						<dsp:input type="hidden" bean="ProfileFormHandler.addAddressErrorURL" value="${originatingRequest.requestURI}" />				
						<dsp:input type="submit" bean="ProfileFormHandler.addAddress" value="Добавить" iclass="btn-red  float-left" />				
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
	</div>
	<div class="col-lg-5 bg5">
		<div id="map">
		</div>
	</div>
	<script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
	<script type="text/javascript">
		var myMap;
		var myPlacemark;
		var mySearchControl;
		var centerX = '<dsp:valueof bean="ProfileFormHandler.editValue.latitude"/>';
		var centerY = '<dsp:valueof bean="ProfileFormHandler.editValue.longitude"/>';
	
		// Дождёмся загрузки API и готовности DOM.
		ymaps.ready(init);
	
		function init () {					
		    // Создание экземпляра карты и его привязка к контейнеру с
		    // заданным id ("map").
		    myMap = new ymaps.Map('map', {
		        // При инициализации карты обязательно нужно указать
		        // её центр и коэффициент масштабирования.
		        center: [centerX, centerY], // Москва
		        zoom: 10,
		        controls: ['smallMapDefaultSet']
		    });
		    
		    myPlacemark = new ymaps.Placemark([centerX, centerY], {
	            preset: 'islands#icon',
	            iconColor: '#0095b6'
	        });
		    
		    mySearchControl = myMap.controls.get('searchControl');
		    mySearchControl.options.set('noPlacemark', true);
		    
		    myMap.geoObjects.add(myPlacemark);
		    
		    mySearchControl.events.add("resultselect", function (result) {
		    	coords = mySearchControl.getResultsArray()[result.get('index')].geometry.getCoordinates();
		    	getAddress(coords);
		    	myMap.setZoom(15);
		    	myMap.setCenter(coords);
		    });
		    	
	        myMap.events.add('click', function (e) {			        	
	               var coords = e.get('coords');		                		                       
	               getAddress(coords);
	        });
		}
	
	    // Определяем адрес по координатам (обратное геокодирование)
	    function getAddress(coords) {
	    	myPlacemark.geometry.setCoordinates(coords);
	    	
	    	ymaps.geocode(coords).then(function (res) {
	            var firstGeoObject = res.geoObjects.get(0);
	            var country = null, admArea = null, subAdmArea = null,
	            	city = null, address1 = null, house = null;
	            
	            metaData = firstGeoObject.properties.get('metaDataProperty').GeocoderMetaData;
	            	
	            country = metaData.AddressDetails.Country;
	            address = country.AddressLine;
	            
	            if (country.AdministrativeArea) {
	            	admArea = country.AdministrativeArea;
	            	if (admArea.SubAdministrativeArea) {
	            		subAdmArea = admArea.SubAdministrativeArea;
	            		if (subAdmArea.Locality)
	            			city = subAdmArea.Locality;
	            	} else if (admArea.Locality) {
	            		city = admArea.Locality;
	            	}			            	
	            } else if (country.SubAdministrativeArea) {
	            	subAdmArea = country.SubAdministrativeArea;
	            	if (subAdmArea.Locality)
	           			city = subAdmArea.Locality;
	            } else if (country.Locality) {
	            	city = country.Locality;
	            }
	            
	            setValues(country.CountryName, city.LocalityName, address);			            
	            
	            myPlacemark.properties
	                .set({
	                    balloonContent: firstGeoObject.properties.get('text')
	                });
	            });			        
	        
	        function setValues(country, city, address1) {
	        	$("#country").prop("value", country);
	            $("#city").prop("value", city);
	            $("#address1").prop("value", address1);
	            // $("#latitude").prop("value", address1);
	            // $("#longitude").prop("value", address1);
	        }
	    }
	</script>	
</dsp:form>