<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/partials/siteHeader.jsp" />

<jsp:include page="/views/partials/breadcrumb.jsp" />


<div class="main">
      <div class="grid wide">
        <div class="row">
          <jsp:include page="/views/partials/siteSidebar.jsp" />
            
          <div class="col l-9 mb-100">
            <span class="paging-lable">Showing 1–12 of 17 results</span>

            <div class="row">
                <c:forEach begin="${start}" end="${end}"  var="product" items="${products}">
                <div class="col l-4">
                <div class="product-item">
                  <div class="product-wrapper">
                        <c:if test="${productsPromotion_id.contains(product.getProductId())}" >
                            <img src="<c:url value="/public/img/sale.png"/>" class="coupon-img">
                        </c:if>
                      
                    <a  href="<c:url value="/products/details/${product.getSlug()}?id=${product.getProductId()}" />">
                      <img
                        class="product__img"
                        src="${product.getImageUrl()}"
                        alt=""
                      />
                    </a>
                    <span class="category-lable">${product.getCategory()[0].getName()}</span>
                    <a href="#" class="product__body">
                      <h2 class="product__title">
                          ${product.getName()}
                      </h2>
                      <div class="price-wrapper text-center">
                        <c:if test="${productsPromotion_id.contains(product.getProductId())}" >
                            <span class="product-price old-price">$ ${product.getPrice()}</span>
                            <span class="product-price new-price">$ ${product.formattedPrice(product.salePrice())}</span>
                        </c:if>
                            
                        <c:if test="${productsPromotion_id.contains(product.getProductId()) == null || productsPromotion_id.contains(product.getProductId()) == false}" >
                            <span class="product-price text-green text-semibold">$ ${product.formattedPrice()}</span>
                        </c:if>
                            
                      </div>
                    </a>
                    <div class="btn-wrapper">
                      <a href="<c:url value="/products/details/${product.getSlug()}?id=${product.getProductId()}" />" class="add-to-cart-btn">Select Options</a>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
<!--              <div class="col l-4">
                <div class="product-item">
                  <div class="product-wrapper">
                    <a  href="<c:url value="/products/details" />">
                      <img
                        class="product__img"
                        src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-FGk4D64U/w:300/h:300/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_6.jpg"
                        alt=""
                      />
                    </a>
                    <span class="category-lable">By Metal</span>
                    <a href="#" class="product__body">
                      <h2 class="product__title">
                        14K Gold 9″ Diamond Ankle Bracelet
                      </h2>
                      <div class="price-wrapper text-center">
                        <span class="product-price text-green text-semibold"
                          >$ 99.00</span
                        >
                      </div>
                    </a>
                    <div class="btn-wrapper">
                      <a href="#" class="add-to-cart-btn">Select Options</a>
                    </div>
                  </div>
                </div>
              </div>-->

<!--              <div class="col l-4">
                <div class="product-item">
                  <div class="product-wrapper">
                      <img src="<c:url value="/public/img/sale.png"/>" class="coupon-img">
                    <a href="#">
                      <img
                        class="product__img"
                        src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-FGk4D64U/w:300/h:300/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_6.jpg"
                        alt=""
                      />
                    </a>
                    <span class="category-lable">By Metal</span>
                    <a href="#" class="product__body">
                      <h2 class="product__title">
                        14K Gold 9″ Diamond Ankle Bracelet
                      </h2>
                      <div class="price-wrapper text-center">
                        <span class="product-price old-price">$ 990.00</span>
                        <span class="product-price new-price">$ 99.00</span>
                      </div>
                    </a>
                    <div class="btn-wrapper">
                      <a href="#" class="add-to-cart-btn">Add to cart</a>
                    </div>
                  </div>
                </div>
              </div>-->
            </div>

            <div class="paging mt-20">
              <ul class="paging-list">
                  <c:forEach var="page" items="${pages}">
                      <li><a href="<c:url value="/products/show?page=${page}" />">${page + 1}</a></li>
                  </c:forEach>
                <li>
                  <a href="#">
                    <i class="fa-solid fa-angles-right"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
                      
<jsp:include page="/views/partials/siteFooter.jsp" />