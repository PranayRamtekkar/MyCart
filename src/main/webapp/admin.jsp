<jsp:include page="Components/navbar.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.mycart.Entities.User" %>
<%@ page import="com.example.mycart.Entities.Category" %>
<%@ page import="com.example.mycart.Helper.FactoryProvider" %>
<%@ page import="com.example.mycart.DAO.CategoryDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.mycart.Helper.Helper" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.mycart.Entities.Product" %><%--
  Created by IntelliJ IDEA.
  User: Pranay
  Date: 13/01/2021
  Time: 07:21 pm
  To change this template use File | Settings | File Templates.
--%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !!! \n Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin. You can't access this page.");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>

<%
    CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getSessionFactory());
    List<Category> list = categoryDAO.getCategories();

    Map<String, Long> map = Helper.getCount(FactoryProvider.getSessionFactory());
%>


<html>
<head>
    <title>Admin Panel</title>
    <jsp:include page="Components/common.jsp"/>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>


<div class="container admin px-10 mt-5 mb-5">

    <div class="container-fluid mt-3">
        <jsp:include page="Components/message.jsp"/>
    </div>
    <div class="col-md-6 mx-auto">

        <div class="row-md-6">
            <div class="card mx-auto text-center">
                <img class="container text-center" style="max-width: 25%" src="Images/users.png" alt="user">
                <div class="card-body">
                    <h6><%= map.get("userCount") %>
                    </h6>
                    <h4>Users</h4>
                </div>
            </div>
        </div>

        <div class="row">

            <div class="col-md-6 mt-5" data-toggle="modal" data-target="#listCategory">
                <div class="card rounded-circle p-3 text-center">
                    <img class="container" style="max-width: 50%" src="Images/categories.png" alt="categories">
                    <div class="card-body">
                        <h5><%= list.size()%>
                        </h5>
                        <h4>Categories</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mt-5" data-toggle="modal" data-target="#addCategory">
                <div class="card rounded-circle p-3 text-center">
                    <img class="container" style="max-width: 50%" src="Images/add_category.png" alt="add_category">
                    <div class="card-body">
                        <h4>Add<br>Category</h4>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">

            <div class="col-md-6 mt-5" data-toggle="modal" data-target="#listProduct">
                <div class="card rounded-circle p-3 text-center">
                    <img class="container" style="max-width: 50%" src="Images/products.png" alt="products">
                    <div class="card-body">
                        <h6><%= map.get("productCount") %>
                        </h6>
                        <h4>Products</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mt-5" data-toggle="modal" data-target="#addProduct">
                <div class="card rounded-circle p-3 text-center">
                    <img class="container" style="max-width: 50%" src="Images/add_product.png" alt="add_product"/>
                    <div class="card-body">
                        <h4>Add<br>Product</h4>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>


<!-- Add Category Modal -->
<div class="modal fade" id="addCategory" tabindex="-1" role="dialog" aria-labelledby="addCategoryTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">


            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryTitle">Add Category</h5>
            </div>


            <div class="modal-body">
                <form action="OperationServlet" method="post">

                    <input type="hidden" name="operation" value="addCategory">

                    <div class="form-group">
                        <label for="cTitle">Title</label>
                        <input type="text" id="cTitle" name="catTitle" class="form-control" placeholder="Enter title">
                    </div>
                    <div class="form-group">
                        <label for="pDesc">Description</label>
                        <textarea name="catDescription" id="pDesc" style="height: 150px" class="form-control"
                                  placeholder="Enter description"></textarea>
                    </div>

                    <div class="container text-center">
                        <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#submit">Save
                        </button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>


<!-- Add Product Modal -->
<div class="modal fade" id="addProduct" tabindex="-1" role="dialog" aria-labelledby="addProductTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">


            <div class="modal-header">
                <h5 class="modal-title" id="addProductTitle">Add Product</h5>
            </div>


            <div class="modal-body">
                <form action="OperationServlet" method="post" enctype="multipart/form-data">

                    <input type="hidden" name="operation" value="addProduct">

                    <div class="form-group">
                        <label for="title">Title</label>
                        <input name="proTitle" id="title" type="text" class="form-control" placeholder="Enter title">
                    </div>

                    <div class="form-group">
                        <label for="desc">Description</label>
                        <textarea name="proDescription" id="desc" style="height: 100px" class="form-control"
                                  placeholder="Enter description"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="price">Price</label>
                        <input name="proPrice" id="price" type="number" class="form-control" placeholder="Enter price">
                    </div>

                    <div class="form-group">
                        <label for="dis">Discount</label>
                        <input name="proDiscount" id="dis" type="number" class="form-control"
                               placeholder="Enter discount">
                    </div>

                    <div class="form-group">
                        <label for="qty">Quantity</label>
                        <input name="proQuantity" id="qty" type="number" class="form-control"
                               placeholder="Enter quantity">
                    </div>


                    <div class="form-group">
                        <label for="pCat">Select Product Category</label>
                        <select name="catId" class="form-control" id="pCat">

                            <% for (Category c : list) { %>
                            <option value="<%=c.getCategoryId()%>"><%= c.getCategoryTitle()%>
                            </option>
                            <% } %>

                        </select>
                    </div>

                    <div class="form-group">
                        <label for="pPic">Select Product Image</label><br>
                        <input type="file" id="pPic" name="proPic" required>
                    </div>


                    <div class="modal-footer">
                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#submit">
                                Save
                            </button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>


<%--List Category Modal--%>
<div class="modal fade" id="listCategory" tabindex="-1" role="dialog" aria-labelledby="categoryList"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">


            <div class="modal-header">
                <h5 class="modal-title" id="categoryList">Category List</h5>
            </div>


            <div class="modal-body">

                <div class="card border-0">
                    <table class="text-center">
                        <thead class="thead-light">
                        <tr>
                            <th>Id</th>
                            <th>Category Name</th>
                            <th>Action</th>
                        </tr>
                        <% for (Category category : list) { %>
                        <tr>
                            <td><%= category.getCategoryId() %>
                            </td>
                            <td><%= category.getCategoryTitle() %>
                            </td>
                            <td>
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </td>
                        </tr>
                        <%}%>
                        </thead>
                    </table>
                </div>

            </div>


            <div class="modal-footer">
                <div class="container text-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</div>


<%--List Product Modal--%>
<div class="modal fade" id="listProduct" tabindex="-1" role="dialog" aria-labelledby="productList"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">


            <div class="modal-header">
                <h5 class="modal-title" id="productList">Product List</h5>
            </div>


            <div class="modal-body">

            </div>

            <div class="modal-footer">
                <div class="container text-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</div>


<jsp:include page="Components/common_modal.jsp"/>
</body>
</html>
