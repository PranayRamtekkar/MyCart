<%@ page import="com.example.mycart.DAO.ProductDAO" %>
<%@ page import="com.example.mycart.Helper.FactoryProvider" %>
<%@ page import="com.example.mycart.Entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.mycart.DAO.CategoryDAO" %>
<%@ page import="com.example.mycart.Entities.Category" %>
<%@ page import="com.example.mycart.Helper.Helper" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <jsp:include page="Components/common.jsp"/>
    <link rel="stylesheet" href="CSS/style.css">
    <script src="JavaScript/script.js"></script>
</head>

<body>
<jsp:include page="Components/navbar.jsp"/>
<h1 align="center"><%= "Welcome to MyCart" %>
</h1>

<%
    String cat = request.getParameter("category");
    ProductDAO productDAO = new ProductDAO(FactoryProvider.getSessionFactory());
    List<Product> list = null;

    if(cat == null || cat.equals("all")) {
        list = productDAO.getAllProducts();
    } else {
        int cid = Integer.parseInt(cat);
        list = productDAO.getProductsById(cid);
    }



    CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getSessionFactory());
    List<Category> cList = categoryDAO.getCategories();

%>

<div class="container-fluid">
    <div class="row mx-3 my-5">

        <%--    show category--%>
        <div class="col-md-2">
            <div class="list-group">

                <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">All Products</a>

                <% for (Category category : cList) {%>
                <a href="index.jsp?category=<%= category.getCategoryId() %>"
                   class="list-group-item list-group-item-action">
                    <%= category.getCategoryTitle()%>
                </a>
                <% } %>

            </div>
        </div>


        <%--    show products--%>
        <div class="col-md-10">
            <div class="row-md-4">
                <div class="col-md-14">
                    <div class="card-columns">

                        <%for (Product product : list) { %>
                        <div class="card">

                            <div class="container text-center">
                                <img class="card-img-top m-3" src="Images/products/<%= product.getpPhoto() %>"
                                     style="width: 75%; height: 50%" alt="Card image cap">

                            </div>
                            <div class="card-body">
                                <h5 class="card-title"><%= product.getpName()%>
                                </h5>
                                <div class="card-text">
                                    <p><%= Helper.getLimitedWords(product.getpDesc())%>
                                    </p>
                                </div>
                            </div>

                            <div class="card-footer">
                                <button class="btn custom-bg" onclick="add_to_cart(<%=product.getpId()%>,'<%= product.getpName()%>',<%=product.getpPrice()%>)">Add to Cart</button>
                                <button class="btn btn-outline-success float-right"> &#8377 <%= product.getpPrice()%> /-
                                    <span class="text-secondary" style="font-size: 11px; font-style: italic"><%= product.getpDiscount()%>% off </span>
                                </button>
                            </div>
                        </div>
                        <% }
                        if(list.size() == 0) {
                            out.println("<h4>Oops !!! ... <br> No items found</h4>");
                        }
                        %>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<jsp:include page="Components/common_modal.jsp"/>
</body>
</html>