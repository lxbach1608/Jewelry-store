<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col l-3">
    <section class="sidebar-section">
      <h3 class="sidebar-heading">PRODUCT CATEGORIES</h3>
      <ul class="category-list">
        <c:forEach var='parentCategory' items="${parentCategories}">
        <li>
            <div class="parent">
                <div class="flex justify-between">
                    <a href="<c:url value="/categories/${parentCategory.getName()}?id=${parentCategory.getCategoryId()}&parent" />">${parentCategory.getName()}</a>
                    <i class="fa-solid fa-plus"></i>
                </div>
                <ul class="child-list">
                <c:forEach var='child' items="${parentCategory.getChildren()}">
                    <li><a href="<c:url value="/categories/${child.getName()}?id=${child.getCategoryId()}"/>">${child.getName()}</a></li>
                </c:forEach>
                </ul>
            </div>
        </li>
        </c:forEach>
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