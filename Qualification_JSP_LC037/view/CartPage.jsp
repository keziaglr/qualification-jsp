<html>
<head>
    <link rel = "stylesheet" href = "../css/navbar.css">
    <link rel = "stylesheet" href = "../css/style.css">
    <link rel = "stylesheet" href = "../css/view.css">
</head>
<body>
    <div class = "navbar">
        <%@include file="Header.jsp" %>    
    </div>
    <div class = "title" style="position:relative; top:20px">
        Cart
    </div>
    <div class = "content-view">
        <% 
            Connect con = Connect.getConnection();
            ResultSet res1 = null;
            Integer userid = (Integer) session.getAttribute("userId");
            String query1 = "SELECT * FROM cart c WHERE userid=" + userid;
            res1 = con.executeQuery(query1);
            if(res1.next()){
        %>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            <%@include file="../connect.jsp"%>
                <%
                    ResultSet res = null;
                    String query = "SELECT * FROM product p, cart c WHERE p.id = c.productid";
                    res = con.executeQuery(query);
                    while(res.next()){
                %>
                    <div>
                        <tr>
                            <td><%=res.getString("name")%></td>
                            <td><%=res.getString("description")%></td>
                            <td><%=res.getInt("price")%></td>
                            <td><%=res.getInt("quantity")%></td>
                            <% if(session.getAttribute("role").equals("admin")){ %>
                                <td>
                                    <a href="../controller/DeleteProduct.jsp?id=<%=res.getString("id")%>">DELETE</a>
                                </td>                                    
                            <% }else if(session.getAttribute("role").equals("user")){ %>
                                <td>
                                    <a href="../controller/CartControllerPlus.jsp?id=<%=res.getString("id")%>">+</a>
                                    <a href="../controller/CartControllerMinus.jsp?id=<%=res.getString("id")%>">-</a>
                                </td>
                            <% } %>
                        </tr>
                    </div>
                <%
                }
                %>
            </table>
            <div >
            </div>
            <div>
                <a href="../controller/CheckOutController.jsp">Check Out</a>
            </div>

        <%
        }else{
        %>
            <h3>Empty Cart</h3>
        <%
        }
        %>
    </div>
</body>
</html>