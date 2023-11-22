<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>INDEX</h1>
        <a href="<c:url value="/admin/stored/products" />">ADMIN</a>
        <a href="<c:url value="/products/show" />">SHOP</a>
        <a href="<c:url value="/site/cart" />">CART</a>
        <a href="<c:url value="/site/checkout" />">CHECKOUT</a>
        <a href="<c:url value="/products/details" />">PRODUCT DETAILS</a>
    </body>
</html>
