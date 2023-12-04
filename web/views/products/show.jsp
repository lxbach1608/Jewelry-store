<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/partials/siteHeader.jsp" />

<jsp:include page="/views/partials/breadcrumb.jsp" />


<div class="main">
      <div class="grid wide">
        <div class="row">
          <div class="col l-3">
            <section class="sidebar-section">
              <h3 class="sidebar-heading">PRODUCT CATEGORIES</h3>
              <ul class="category-list">
                <li>
                  <div class="parent">
                    <div class="flex justify-between">
                        <a href="#">Bracelets</a>
                        <i class="fa-solid fa-plus"></i>
                    </div>
                    <ul class="child-list">
                    <li><a href="#">Bands</a></li>
                    <li><a href="#">Emerald Spring</a></li>
                    <li><a href="#">Men’s Bands</a></li>
                    <li><a href="#">Ruthenium</a></li>
                    <li><a href="#">Wedding Band Sets</a></li>
                  </ul>
                  </div>
                </li>
              </ul>

              <span class="separate"></span>
            </section>

            <section class="sidebar-section">
              <h3 class="sidebar-heading">FILTER BY PRICE</h3>

              <form action="">
                <div class="price-slider-wrapper">
                  <div class="price-slider"></div>
                  <span class="ui-slider-min ui-slider-handle"></span>
                  <span class="ui-slider-max ui-slider-handle"></span>
                </div>

                <div class="price-slider-amount pb-20">
                  <button class="btn btn-filter">Filter</button>
                  <div class="price-label">
                    Price:
                    <span class="from">$&nbsp;0.00</span> —
                    <span class="to">$&nbsp;100.00</span>
                  </div>
                </div>
              </form>

              <span class="separate"></span>
            </section>

            <section class="sidebar-section">
              <h3 class="sidebar-heading">FILTER BY COLOR</h3>

              <form action="">
                <ul class="filter-list">
                  <li>
                    <a href="#">Bronze</a>
                    <span class="count">(1)</span>
                  </li>
                  <li>
                    <a href="#">Gold</a>
                    <span class="count">(1)</span>
                  </li>
                  <li>
                    <a href="#">White</a>
                    <span class="count">(1)</span>
                  </li>
                </ul>
              </form>

              <span class="separate"></span>
            </section>

            <section class="sidebar-section">
              <h3 class="sidebar-heading">FILTER BY SIZE</h3>

              <form action="">
                <ul class="filter-list">
                  <li>
                    <a href="#">16</a>
                    <span class="count">(1)</span>
                  </li>
                  <li>
                    <a href="#">17</a>
                    <span class="count">(1)</span>
                  </li>
                  <li>
                    <a href="#">18</a>
                    <span class="count">(1)</span>
                  </li>
                  <li>
                    <a href="#">19</a>
                    <span class="count">(1)</span>
                  </li>
                  <li>
                    <a href="#">20</a>
                    <span class="count">(1)</span>
                  </li>
                </ul>
              </form>

              <span class="separate"></span>
            </section>

            <section class="sidebar-section">
              <h3 class="sidebar-heading">BEST SELLING PRODUCT</h3>

              <ul class="best-product-list">
                <li>
                  <img
                    src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-wHOXw_gG/w:70/h:70/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_1.jpg"
                    alt=""
                  />
                  <div class="best-product-wrapper">
                    <h3 class="product-title">
                      Rhombus Diamond Ring 18k White Gold
                    </h3>
                    <div class="price-wrapper">
                      <!-- <span class="product-old-price">$ 990.00</span> -->
                      <span class="product-price">$ 99.00</span>
                    </div>
                  </div>
                </li>

                <li>
                  <img
                    src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-b4BhHcQy/w:70/h:70/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_3.jpg"
                    alt=""
                  />
                  <div class="best-product-wrapper">
                    <h3 class="product-title">
                      Rhombus Diamond Ring 18k White Gold
                    </h3>
                    <div class="price-wrapper">
                      <span class="product-price old-price">$ 990.00</span>
                      <span class="product-price new-price">$ 99.00</span>
                    </div>
                  </div>
                </li>
              </ul>
              <span class="separate"></span>
            </section>
          </div>
          <div class="col l-9 mb-100">
            <span class="paging-lable">Showing 1–12 of 17 results</span>

            <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col l-4 mb-50">
                <div class="product-item">
                  <div class="product-wrapper">
                    <a  href="<c:url value="/products/details/${product.getSlug()}?id=${product.getProductId()}" />">
                      <img
                        class="product__img"
                        src="${product.getImageUrl()}"
                        alt=""
                      />
                    </a>
                    <span class="category-lable">By Metal</span>
                    <a href="#" class="product__body">
                      <h2 class="product__title">
                          ${product.getName()}
                      </h2>
                      <div class="price-wrapper text-center">
                        <span class="product-price text-green text-semibold"
                          >${product.formattedPrice(product.getPrice())}</span
                        >
                      </div>
                    </a>
                    <div class="btn-wrapper">
                      <a href="#" class="add-to-cart-btn">Add to cart</a>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
              <div class="col l-4 mb-50">
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
                      <a href="#" class="add-to-cart-btn">Add to cart</a>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col l-4 mb-50">
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
              </div>
            </div>

            <div class="paging">
              <ul class="paging-list">
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
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