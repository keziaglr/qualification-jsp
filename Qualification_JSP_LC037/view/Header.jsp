
<nav style="position: relative; top: 20px;">
    <% if(session.getAttribute("role") == null) { %>
        <a href="LoginPage.jsp">Login</a>
        <a href="RegisterPage.jsp">Register</a>
    <% }else if(session.getAttribute("role").equals("user")){ %>
        <a href="index.jsp">Home</a>
        <a href="CartPage.jsp">Cart</a>
        <a href="TransactionPage.jsp">Transactions</a>
        <a href="../controller/LogoutController.jsp">Logout</a>
    <% }else if(session.getAttribute("role").equals("admin")){ %>
        <a href="index.jsp">Home</a>
        <a href="InsertProductForm.jsp">Insert Product</a>
        <a href="../controller/LogoutController.jsp">Logout</a>
    <% } %>
</nav> 