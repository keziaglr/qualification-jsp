<%@include file="../connect.jsp"%>
<%
    String id = request.getParameter("id");
    String name = (request.getParameter("pName"));
    String description = (request.getParameter("pDesc"));
    String price = (request.getParameter("pPrice"));

    if(name.isEmpty() || description.isEmpty() || price.isEmpty()){
        session.setAttribute("errMsg", "Form must be filled");
        response.sendRedirect("../view/UpdateProductForm.jsp");  
    }else{
        Integer price1 = Integer.parseInt(price);
        Connect con = Connect.getConnection();
        String query = "UPDATE product SET name='" + name + "', description='" + description + "', price= '" + price + "' WHERE id=" + id;
        out.println(id);
        con.executeUpdate(query);
        response.sendRedirect("../view/index.jsp");    
    }
%>