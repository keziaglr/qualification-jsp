<%@include file="../connect.jsp"%>
<%
    String username = (request.getParameter("pUsername"));
    String password = (request.getParameter("pPassword"));
    if(username.isEmpty() || password.isEmpty()){
        session.setAttribute("errMsg", "Username or password must be filled");
        response.sendRedirect("../view/LoginPage.jsp");
    }else{
        Connect con = Connect.getConnection();
        ResultSet res = null;
        String query = "SELECT * FROM user WHERE username = '"+ username + "' AND password = '" + password + "'";
        res = con.executeQuery(query);
        if(res.next()){
            Integer id = res.getInt("id");
            session.setAttribute("userId", id);
            
            String cook = request.getParameter("remember");
            if(cook != null){
                Cookie cookie = new Cookie("username", username);

                cookie.setMaxAge(60*60*24);
                cookie.setPath("/Qualification_JSP_LC037"); 
                response.addCookie(cookie);   
            }

            if(username.equals("Admin")){
                session.setAttribute("role", "admin");
            }else{
                session.setAttribute("role", "user");
            }
            response.sendRedirect("../view/index.jsp");
        }else{
            session.setAttribute("errMsg", "Invalid username or password");
            response.sendRedirect("../view/LoginPage.jsp");
        }
    }
    
%>
