<%@include file="../connect.jsp"%>

<%
    String id = request.getParameter("id");
    ResultSet res = null;
    Connect con = Connect.getConnection();
    String query = "SELECT * FROM cart WHERE productid=" + id;
    res = con.executeQuery(query);

    if(res.next()){
        Integer qty = res.getInt("quantity");
        qty--;
        if(qty <= 0){
            String query2 = "DELETE FROM cart WHERE productid=" + id;
            con.executeUpdate(query2);
        }else{
            String query3 = "UPDATE cart SET quantity=" + qty + " WHERE productid=" + id;
            con.executeUpdate(query3);           
        }
        response.sendRedirect("../view/CartPage.jsp");  
    }
%>