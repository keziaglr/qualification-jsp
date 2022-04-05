<html>
<head>
    <link rel = "stylesheet" href = "../css/navbar.css">
    <link rel = "stylesheet" href = "../css/style.css">
    <link rel = "stylesheet" href = "../css/view.css">
</head>
<body>
    <%-- <%
        Cookie cookie = null;
        Cookie[] cookies = null;

        cookies = request.getCookies();
        if( cookies != null ) {
            out.println("<h2> Found Cookies Name and Value</h2>");
            
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               out.print("Name : " + cookie.getName( ) + ",  ");
               out.print("Value: " + cookie.getValue( )+" <br/>");
            }
         } else {
            out.println("<h2>No cookies founds</h2>");
         }
    %> --%>
    <div class = "navbar">
        <%@include file="Header.jsp" %>    
    </div>
    <div class = "title" style="position:relative; top:20px">
        Home
    </div>
    <div class = "content-view">
        <table>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
            </tr>
        <%@include file="../connect.jsp"%>
            <%
                Connect con = Connect.getConnection();
                ResultSet res = null;
                String query = "SELECT * FROM product";
                res = con.executeQuery(query);
                while(res.next()){
            %>
                <div>
                    <tr>
                        <td><%=res.getString("name")%></td>
                        <td><%=res.getString("description")%></td>
                        <td><%=res.getInt("price")%></td>
                        <% if(session.getAttribute("role") == null){ %>

                        <% }else if(session.getAttribute("role").equals("admin")){ %>
                            <td>
                                <a href="../controller/DeleteProduct.jsp?id=<%=res.getString("id")%>">Delete</a>
                                <a href="UpdateProductForm.jsp?id=<%=res.getString("id")%>">Update</a>
                            </td>                                    
                        <% }else if(session.getAttribute("role").equals("user")){ %>
                            <td>
                                <a href="../controller/IndexControllerPlus.jsp?id=<%=res.getString("id")%>">+</a>
                                <a href="../controller/IndexControllerMinus.jsp?id=<%=res.getString("id")%>">-</a>
                            </td>
                        <% } %>
                    </tr>
                </div>
            <%
            }
            %>
        </table>
    </div>
</body>
</html>