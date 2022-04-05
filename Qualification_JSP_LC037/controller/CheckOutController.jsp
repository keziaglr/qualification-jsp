<%@include file="../connect.jsp"%>
<%! public Integer total = 0; %>
<%
    Connect con = Connect.getConnection(); 
    Integer userid = (Integer) session.getAttribute("userId");
    ResultSet res = null;
    String query1 = "SELECT * FROM cart c, product p WHERE p.id = c.productid AND userid=" + userid;
    res = con.executeQuery(query1);

    while(res.next()){
        Integer price = res.getInt("price");
        Integer quantity = res.getInt("quantity");
        Integer subtotal = price * quantity;  
        total = total + subtotal;     
    }
    
    ResultSet res1 = null;
    String query3 = "SELECT * FROM cart c, product p WHERE p.id = c.productid AND userid=" + userid;
    res1 = con.executeQuery(query1);

    if(res1.next()){
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());   
        String query2 = "INSERT INTO transaction VALUES (NULL, '" + res1.getInt("userid") + "', '" + total +"', '" + date + "')"; 
        con.executeUpdate(query2);    
    }
    
    String query = "DELETE FROM cart WHERE userid=" + userid;
    con.executeUpdate(query);      

    response.sendRedirect("../view/CartPage.jsp");
%>