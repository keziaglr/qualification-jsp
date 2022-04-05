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
        Transaction
    </div>
    <div class = "content-view">
        <% 
            Connect con = Connect.getConnection();
            ResultSet res = null;
            Integer userid = (Integer) session.getAttribute("userId");
            String query = "SELECT * FROM transaction WHERE userid=" + userid;
            res = con.executeQuery(query);
            if(res.next()){
        %>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Total Payment</th>
                </tr>
            <%@include file="../connect.jsp"%>
                <%
                    ResultSet res1 = null;
                    String query1 = "SELECT * FROM transaction WHERE userid=" + userid;
                    res1 = con.executeQuery(query1);
                    while(res1.next()){
                %>
                    <div>
                        <tr>
                            <td><%=res1.getDate("date")%></td>
                            <td><%=res1.getString("total")%></td>
                        </tr>
                    </div>
                <%
                    }
                %>
            </table>
        <%
        }else{
        %>
            <h3>No Transaction</h3>
        <%
        }
        %>
    </div>
</body>
</html>