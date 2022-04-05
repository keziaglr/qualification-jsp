<%@include file="../connect.jsp"%>

<%
    String id = request.getParameter("id");
    ResultSet res = null;
    Connect con = Connect.getConnection();
    String query = "SELECT * FROM cart WHERE productid=" + id;
    res = con.executeQuery(query);

    if(res.next()){
        Integer qty = res.getInt("quantity");
        qty++;
        String query2 = "UPDATE cart SET quantity=" + qty + " WHERE productid=" + id;
        con.executeUpdate(query2);
        response.sendRedirect("../view/CartPage.jsp");
    }else{
        String query3 = "INSERT INTO cart VALUES (NULL, " + session.getAttribute("userId") + ", "+ id + ", 1)";
        con.executeUpdate(query3);
        response.sendRedirect("../view/CartPage.jsp");
    }
    
%>