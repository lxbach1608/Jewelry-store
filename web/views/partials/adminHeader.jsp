<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>Jewelry Store</title>
    
    <!--Tailwind-->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <link rel="stylesheet" href="./admin.css" />
    
    <!-- JQuery -->
    <script
      src="https://code.jquery.com/jquery-3.7.1.min.js"
      integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
      crossorigin="anonymous"
    ></script>
    
    <script src="<c:url value="/js/admin.js" />"></script>

</head>
<body>
    <header>
        <div class="flex justify-between items-center h-16 bg-gray-800 text-green-600">
            <div class="h-full">
                <a href="/JewelryStore" class="block">
                    <img src="<c:url value="/public/img/brand-img.svg"/>" alt="logo" class="w-64 h-16"/>
                </a>
            </div>
            <div>
                <h2>TEST</h2>
            </div>
        </div>
    </header>