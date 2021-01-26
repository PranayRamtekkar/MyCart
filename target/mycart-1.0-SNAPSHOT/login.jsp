<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Login</title>
    <jsp:include page="Components/common.jsp"/>
    <link rel="stylesheet" href="CSS/style.css"/>
</head>
<body>
<jsp:include page="Components/navbar.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <jsp:include page="Components/message.jsp"/>
            <div class="card mt-5">

                <div class="card-header custom-bg text-center ">
                    <h1>Login</h1>
                </div>
                <div class="card-body">

                    <form action="LoginServlet" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" name="password" class="form-control" id="exampleInputPassword1"
                                   placeholder="Password">
                        </div>

                        <div class="container text-center mt-5">
                            <button type="submit" class="btn border-success text-success">Submit</button>
                        </div>

                        <div class="container text-center mt-2">
                            <a href="register.jsp"><u>New User</u></a>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
