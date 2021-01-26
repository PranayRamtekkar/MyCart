<%@ page import="com.example.mycart.Entities.User" %><%--
  Created by IntelliJ IDEA.
  User: Pranay
  Date: 24/01/2021
  Time: 11:24 am
  To change this template use File | Settings | File Templates.
--%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !!! \n Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Checkout</title>
    <jsp:include page="Components/common.jsp"/>
    <link rel="stylesheet" href="CSS/style.css">
    <script src="JavaScript/script.js"></script>
</head>
<body>
<jsp:include page="Components/navbar.jsp"/>
<div class="container">
    <div class="row mt-5">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <div class="cart-body">

                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <form action="#">
                <div class="card">

                    <div class="card-header text-center">
                        <h1>Your shipping details</h1>
                    </div>


                    <div class="card-body">
                        <div class="form-group">
                            <label for="exampleInputEmail">Email address</label>
                            <input value="<%=user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp"
                                   placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputName">Name</label>
                            <input value="<%=user.getUserName()%>" type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp"
                                   placeholder="Enter name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputAddress">Shipping address</label>
                            <textarea value="<%=user.getUserAddress()%>" class="form-control" id="exampleInputAddress" aria-describedby="emailHelp"
                                      placeholder="Enter address"></textarea>
                        </div>
                    </div>

                    <div class="card-footer">
                        <div class="container text-center">
                            <button class="btn btn-outline-success">Order Now</button>
                            <button class="btn btn-outline-success">Continue Shopping</button>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="Components/common_modal.jsp"/>
</body>
</html>
