<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="<c:url value="/public/css/admin.css"/>"/>
        
    </head>
    <body style="display: flex">
        
        <div>
            <a href="<c:url value="/admin/stored/products"/>" style="background-color: #ccc">Products</a>
        </div>
        <div>
            <h1>ADMIN PAGE</h1>
            <a href="<c:url value="/views/admin/admin.html"/>">ADMIN UI</a>

            <a href="<c:url value="/"/>" >Product views</a>
            
            <form action="<c:url value="products/create"/>" method="POST">
                <button type="submit">Create submit</button>
            </form>
                <form action="<c:url value="products/update"/>" method="POST">
                <button type="submit">Update submit</button>
            </form>
            <form action="<c:url value="products/delete"/>" method="POST">
                <button type="submit">Delete submit</button>
            </form>
                
            <div>
                <h1>DELETE product</h1>

                <ul class="product-list">
                    <c:forEach var="product" items="${products}">

                    <li class="product-item">
                        <p>ID: ${product.getProductId()}</p>
                        <p>Name: ${product.getName()}</p>
                        <p>Description ${product.getDesciption()}</p>
                        <p>Price: ${product.formattedPrice()}</p>
                        <p>Image URL: ${product.getImgUrl()}</p>
                        <p>Slug: ${product.getSlug()}</p>

                        <!--Update-->
                        <form action="<c:url value="products/update"/> " method="POST">

                            <input type="hidden" name="id" value="${product.getProductId()}">

                            <input type="text" name="name" value="${product.getName()}" placeholder="product name"/>
                            <br>
                            <input type="text" name="desc" value="${product.getDesciption()}" placeholder="product description"/>
                            <br>
                            <input type="text" name="imgUrl" value="${product.getImgUrl()}" placeholder="product imgUrl"/>
                            <br>
                            <input type="text" name="price" value="${product.formattedPrice()}" placeholder="product price"/>
                            <br>
                            <input type="text" name="slug" value="${product.getSlug()}" placeholder="product slug"/>
                            <br>

                            <input type="submit" value="update"/>
                        </form>

                        <form action="<c:url value="products/delete"/> " method="POST">
                            <input type="hidden" name="id" value="${product.getProductId()}">
                            <button type="submit">delete</button>
                        </form>

                    </li>

                    </c:forEach>
                </ul>
            </div>
            <div>
                <h1>PARENT CATEGORY</h1>
                <form action="<c:url value="/admin/category/parent/create"/>" method="POST">
                    <input type="hidden" name="action" value="addParent"/>
                    <label>category name</label>
                    <input type="text" name="name"/>
                    <input type="submit" value="create"/>
                </form>
                <ul>
                    <c:forEach var="parent" items="${parents}">
                        <li>
                            <h3>${parent.getName()}</h3>
                            <ul>
                                <c:forEach var="child" items="${parent.getChild()}">
                                    <li>
                                        <h3>${child.getName()}</h3>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </ul>
            </div>
           
            <div>
                <h2>CHILD CATEGORY</h2>
                <form action="<c:url value="/admin/category/child/create"/>" method="POST">
                    <input type="hidden" name="action" value="addChild"/>
                    <label>category name</label>
                    <input type="text" name="name"/>
                    <input type="submit" value="create"/>

                    <c:forEach var="child" items="${children}">
                    <li>
                        <h3 style="display: inline-block">${child.getName()}</h3>
                        <ul>
                            <c:forEach var="product" items="${child.getProducts()}">
                                <li>${product.getName()}</li>
                            </c:forEach>
                        </ul>
                    </li>
                    </c:forEach>
                    <ul>
                        <c:forEach var="parent" items="${parents}">
                            <input type="checkbox" name="parentCheckbox" value="${parent.getCategoryId()}">${parent.getName()}</input>
                        </c:forEach>
                    </ul>
                </form>
            </div>
        </div>
                    
                    
                    
                    
                    
                    
        <div style="margin-left: 100px; border-left: 2px solid #000">
            <h1>CATEGORY</h1>
            <div>
                <h1>CREATE Promotion</h1>
                <form action="<c:url value="/admin/promotion/create"/>" method="POST">
                    <input type="hidden" name="action" value="createProduct"/>

                    <lable style="display: inline-block; width: 100px">Name</lable>
                    <input type="text" name="name">
                    <br>
                    <lable style="display: inline-block; width: 100px">Description</lable>
                    <input type="text" name="desc">
                    <br>
                    <lable style="display: inline-block; width: 100px">discount rate</lable>
                    <input type="text" name="discoutRate" placeholder="Percent">
                    <br>
                    <lable style="display: inline-block; width: 100px">start date:</lable>
                    <input type="date" name="startDate">
                    <br>
                    <lable style="display: inline-block; width: 100px">end Date</lable>
                    <input type="date" name="endDate">
                    <br>
                    <input type="submit" value="create"/>
                </form>
            </div>
                    
            <ul>
                <c:forEach var="promotion" items="${promotions}">
                    <li>
                        <a href="#!">${promotion.getName()}</a>
                        <div>
                            <h1>UPDATE Promotion</h1>
                            <form action="<c:url value="/admin/promotion/update"/>" method="POST">
                                <input type="hidden" name="action" value="createProduct"/>

                                <lable style="display: inline-block; width: 100px">Name</lable>
                                <input type="text" name="name">
                                <br>
                                <lable style="display: inline-block; width: 100px">Description</lable>
                                <input type="text" name="desc">
                                <br>
                                <lable style="display: inline-block; width: 100px">discount rate</lable>
                                <input type="text" name="discoutRate" placeholder="Percent">
                                <br>
                                <lable style="display: inline-block; width: 100px">start date:</lable>
                                <input type="date" name="startDate">
                                <br>
                                <lable style="display: inline-block; width: 100px">end Date</lable>
                                <input type="date" name="endDate">
                                <br>
                                <input type="submit" value="create"/>
                            </form>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        
    </body>
</html>
