<dsp:page>
	<dsp:importbean bean="/atg/dynamo/Configuration" />
	<dsp:importbean	bean="/atg/endeca/assembler/cartridge/manager/DefaultActionPathProvider" />
	<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler" />

	<dsp:droplet name="InvokeAssembler">
		<dsp:param name="contentCollection" value="/content/Web/Home Pages" />
		<dsp:oparam name="output">
			<dsp:getvalueof var="homePageContent" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
		</dsp:oparam>
		<dsp:oparam name="error">
			<p>Index JSP, error while Invoking Assembler</p>
		</dsp:oparam>
	</dsp:droplet>	

	<c:if test="${not empty homePageContent}">
		<dsp:renderContentItem contentItem="${homePageContent}" />
	</c:if>
	<c:if test="${empty homePageContent}">
        <p>Can not access to Endeca application. Please, contact technical support.</p>
	</c:if>

</dsp:page>