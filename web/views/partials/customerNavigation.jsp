<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      

<nav class="customer-nav">
<ul class="nav-list">
    <li><a href="#">Dashboard</a></li>
  <li><a href="<c:url value="/customers/orders"/>">Orders</a></li>
  <li><a href="<c:url value="/customers/addresses"/>">Addresses</a></li>
  <li><a href="<c:url value="/customers/details"/>">Account Details</a></li>
  <li><a href="#">Wishlist</a></li>
</ul>
</nav>