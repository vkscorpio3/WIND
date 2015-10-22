<dsp:page>
  <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
  <dsp:getvalueof var="content" vartype="com.endeca.infront.assembler.ContentItem" value="${originatingRequest.contentItem}"/> 

  <endeca:pageBody rootContentItem="${rootContentItem}" contentItem="${contentItem}">
    <%-- Render the header --%>
    <c:if test="${not empty content.HeaderContent}">
      <c:forEach var="element" items="${content.HeaderContent}">
        <dsp:renderContentItem contentItem="${element}"/>
      </c:forEach>
    </c:if>
    <%-- Render the main content --%>
   <div class="atg_store_main">
      <c:forEach var="element" items="${content.MainContent}">
         <dsp:renderContentItem contentItem="${element}"/>
       </c:forEach>
    </div>
  </endeca:pageBody>

</dsp:page>
