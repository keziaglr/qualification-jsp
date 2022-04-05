<html>
    <head>
    <link rel = "stylesheet" href = "../css/navbar.css">
    <link rel = "stylesheet" href = "../css/style.css">
    </head>
    <body>
        <div class = "title">
                Register Page
        </div>
        <div class = "contentForm">
            <form action ="../controller/RegisterController.jsp" method = "post">
                    <table>
                        <tr>
                            <td class="subform">Username</td>
                            <td><input type="text" name="pUsername" placeholder="Username"></td>
                        </tr>
                        <tr>
                            <td class="subform">Password</td>
                            <td><input type="password" name="pPassword" placeholder="Password"></td>
                        </tr>
                    </table>
                    <input type ="submit" value="Register">
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