<%@include file="../connect.jsp"%>
<%
    String username = (request.getParameter("pUsername"));
    String password = (request.getParameter("pPassword"));
    if(username.isEmpty() || password.isEmpty()){
        session.setAttribute("errMsg", "Username or password must be filled");
        response.sendRedirect("../view/RegisterPage.jsp");
    }else{
        Connect con = Connect.getConnection();
        String query = "INSERT INTO user VALUE (NULL, '"+ username + "', '" + password + "')";
        con.executeUpdate(query);
        response.sendRedirect("../view/LoginPage.jsp");    
    }
%>
