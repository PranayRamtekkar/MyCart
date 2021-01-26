<jsp:include page="common.jsp"/>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>

<div class="alert alert-success" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    <strong><%=message%>
    </strong>
</div>

<%

    }
    session.removeAttribute("message");
%>