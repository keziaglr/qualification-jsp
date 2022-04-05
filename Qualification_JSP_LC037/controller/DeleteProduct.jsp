<%@include file="../connect.jsp"%>

<%
    String id = request.getParameter("id");
    Connect con = Connect.getConnection();
    String query = "DELETE FROM product WHERE id=" + id;
    con.executeUpdate(query);

    response.sendRedirect("../view/index.jsp");
%>