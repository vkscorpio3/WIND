<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<%@attribute name="editable" required="true" type="java.lang.Boolean"%>

<dsp:importbean bean="/atg/userprofiling/Profile" var="profile" />
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest" />

<dsp:getvalueof bean="ProfileFormHandler.formExceptions" var="formExceptions" vartype="java.lang.Object" />
<dsp:getvalueof bean="ProfileFormHandler.addAddressSuccessful" var="addAddressSuccessful" vartype="java.lang.Boolean" />
<dsp:getvalueof bean="Profile.secondaryAddresses" var="addresses" />
<dsp:getvalueof bean="Profile.shippingAddress" var="defaultShippingAddress" />

<c:if test="${addAddressSuccessful}">
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Адрес успешно добавлен</strong>
	</div>
</c:if>

<c:if test="${not empty addresses }">
	<dsp:form action="${originatingRequest.requestURI}" method="post" formid="addressBookForm">
		<dsp:input type="hidden" bean="ProfileFormHandler.removeAddressSuccessURL" value="${originatingRequest.requestURI}" />
		<dsp:input type="hidden" bean="ProfileFormHandler.removeAddressErrorURL" value="${originatingRequest.requestURI}" />
		<div class="row">
			<table class="table marginbot-clear">
				<thead>
					<tr>
						<th>Название</th>
						<th>Адрес</th>
						<th>Долгота/Широта</th>
						<c:if test="${editable}">
							<th>Действия</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${addresses}" var="address" varStatus="iteration">
						<tr>
							<td>${address.key}</td>
							<td>${address.value.city}, ${address.value.address1}</td>
							<td>${address.value.latitude} / ${address.value.longitude}</td>
							<c:if test="${editable}">
								<td>								
									<%--<dsp:input type="submit" name="remove_address_${iteration.count}" 
											   bean="ProfileFormHandler.removeAddress"
											   value="Удалить" submitvalue="${address.key}" iclass="btn btn-primary"/>--%>
									<dsp:a title="Удалить" bean="ProfileFormHandler.removeAddress" href="${originatingRequest.requestURI}" value="${address.key}" iclass="btn btn-primary"><i class="fa fa-trash-o fa-2x"></i></dsp:a>
									<i class="fa fa-pencil-square-o fa-2x btn btn-warning open-editAddressesModal" data-toggle="modal" data-target="#editAddress"
										data-nickname="${address.key}" 
										data-lastname="${address.value.lastName}"
										data-firstname="${address.value.firstName}"
										data-phonenumber="${address.value.phoneNumber}"
										data-email="${address.value.email}"
										data-country="${address.value.country}"
										data-city="${address.value.city}"
										data-address1="${address.value.address1}"
										data-floor="${address.value.floor}"
										data-apartment="${address.value.apartment}"
										data-description="${address.value.description}"
										data-latitude="${address.value.latitude }"
										data-longitude="${address.value.longitude }"
										data-street="${address.value.street }"
										data-house="${address.value.house }" ></i>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</dsp:form>
										
									
</c:if>