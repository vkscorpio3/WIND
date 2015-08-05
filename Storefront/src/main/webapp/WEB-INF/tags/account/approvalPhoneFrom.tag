<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />

<dsp:form action="${originatingRequest.requestURI}" method="post" formid="approvalPhoneModal_FormId">
<mws:modalDialog id="approvalPhoneModal" closeButton="true" title="Подтверждение номера телефона" width="50%">
    <jsp:attribute name="body">
        Введите проверочный код, полученный в сообщении <br />

        <dsp:input bean="ProfileFormHandler.approvalCode" type="text"/>
        <dsp:input bean="ProfileFormHandler.approvePhone" type="submit" value="Подтвердить" iclass="btn btn-primary"/>
	</jsp:attribute>
	<jsp:attribute name="footer">

	</jsp:attribute>
</mws:modalDialog>
</dsp:form>




