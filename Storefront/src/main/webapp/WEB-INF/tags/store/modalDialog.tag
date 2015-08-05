<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<%@attribute name="id" required="true" type="java.lang.String"%>
<%@attribute name="title" required="true" type="java.lang.String"%>
<%@attribute name="closeButton" required="true" type="java.lang.Boolean"%>
<%@attribute name="body" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<%@attribute name="width" type="java.lang.String"%>

<!-- Modal -->
<div class="modal fade" id="${id}" tabindex="-1" role="dialog" aria-labelledby="${id}Label" aria-hidden="true">
	<div class="modal-dialog" ${not empty width ? 'style="width:'.concat(width).concat(';"') : ''}>
		<div class="modal-content bg6">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="${id}Label">${title}</h4>
			</div>
			<div class="modal-body">
				<jsp:invoke fragment="body"/>
			</div>
			<div class="modal-footer">
				<c:if test="${closeButton}">
					<button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
				</c:if>
				<jsp:invoke fragment="footer"/>
			</div>
		</div>
	</div>
</div>