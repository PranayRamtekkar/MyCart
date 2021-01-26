<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>New User</title>
    <jsp:include page="Components/common.jsp"/>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>
<jsp:include page="Components/navbar.jsp"/>
<div class="container-fluid">
    <div class="row mt-3">
        <div class="col-md-4 offset-md-4" >
            <jsp:include page="Components/message.jsp"/>
            <div class="card">
                <div class="card-body px-10">
                    <form action="RegisterServlet" method="post">

                        <h4 class="text-center my-3">Sign Up</h4>
                        <div class="form-group">
                            <label for="name">User Name</label>
                            <input type="text" name="user_name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                        </div>

                        <div class="form-group">
                            <label for="email">User Email</label>
                            <input type="email" name="user_email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email">
                        </div>

                        <div class="form-group">
                            <label for="password">User Password</label>
                            <input type="password" name="user_password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Password">
                        </div>

                        <div class="form-group">
                            <label for="phone">User Phone Number</label>
                            <input type="number" name="user_phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Phone Number">
                        </div>

                        <div class="form-group">
                            <label for="address">User Address</label>
                            <textarea name="user_address" class="form-control" id="address" rows="3" placeholder="Enter Phone Number"></textarea>
                        </div>

                        <div class="container text-center mt-5">
                            <button class="btn btn-outline-success mr-3">Register</button>
                            <button class="btn btn-outline-warning ml-3">Reset</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
