<html>
    <head>
    <link rel = "stylesheet" href = "../css/navbar.css">
    <link rel = "stylesheet" href = "../css/style.css">
    </head>
    <body>
        <div class = "navbar">
            <%@include file="Header.jsp" %>    
        </div>
        <div class = "title">
            Update Product Page
        </div>
        <div class = "contentForm">
            <form action ="../controller/UpdateProductController.jsp?id=<%=request.getParameter("id")%>" method = "post">
                    <table>
                        <tr>
                            <td class="subform">Name</td>
                            <td><input type="text" name="pName" placeholder="Soap Name"></td>
                        </tr>
                        <tr>
                            <td class="subform">Description</td>
                            <td><input type="text" name="pDesc" placeholder="Soap Description"></td>
                        </tr>
                        <tr>
                            <td class="subform">Price</td>
                            <td><input type="text" name="pPrice" placeholder="Soap Price"></td>
                        </tr>
                    </table>
                    <input type ="submit" value="Update">
                    <div class ="errorMsg">
                        <%
                            if(session.getAttribute("errMsg") != null){
                                String errMsg = (String)session.getAttribute("errMsg");
                                out.print(errMsg);                                
                            }
                        %>
                    </div>
            </form>
        </div>
    </body>
</html>