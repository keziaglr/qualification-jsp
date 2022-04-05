<%@include file="../connect.jsp"%>
<%
    String name = (request.getParameter("pName"));
    String description = (request.getParameter("pDesc"));
    String price = (request.getParameter("pPrice"));

    if(name.isEmpty() || description.isEmpty() || price.isEmpty()){
        session.setAttribute("errMsg", "Form must be filled");
        response.sendRedirect("../view/InsertProductForm.jsp");  
    }else{
        Integer price1 = Integer.parseInt(price);
        Connect con = Connect.getConnection();
        String query = "INSERT INTO product VALUE (NULL, '"+ name + "', '" + description + "', '" + price1 + "')";
        con.executeUpdate(query);
        response.sendRedirect("../view/InsertProductForm.jsp");    
    }
%>