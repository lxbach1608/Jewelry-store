<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/partials/siteHeader.jsp" />

<jsp:include page="/views/partials/breadcrumb.jsp" />

<main>
    <section class="section-1200">
      <!-- img -->
      <div class="product-detail">
        <div class="product-img">
          <div class="main-img mb-20">
            <img
              src="${product.getImageUrl()}"
              alt=""
            />
          </div>

          <ul class="sub-img-list">
            <li class="sub-img">
              <img
                src="${product.getImageUrl()}"
                alt=""
              />
            </li>

            <li class="sub-img">
              <img
                src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-FGk4D64U/w:auto/h:auto/q:auto/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_6.jpg"
                alt=""
                width="50px"
                height="50px"
              />
            </li>
            <li class="sub-img">
              <img
                src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-fDNzwSu7/w:auto/h:auto/q:auto/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_8.jpg"
                alt=""
                width="50px"
                height="50px"
              />
            </li>
            
          </ul>
        </div>

        <!-- body, content -->
        <div class="product-content">
          <h2 class="product-content__title">${product.getName()}</h2>

          <div class="price-wrapper">
              <c:if test="${True}">
                <span class="old-price">$ 677.35</span>
                <span class="new-price">$ 524.40</span>
              </c:if>
              <span class="price">$ 524.40</span>
          </div>

          <p class="product-desc">
            ${product.getDescription()}
          </p>

          <form action="<c:url value="/cart/add" />" method="POST">
            <input type="hidden" name="form-add-to-cart-productId" value="${product.getProductId()}">
            <input type="hidden" name="form-add-to-cart-size" value="">
            <input type="hidden" name="form-add-to-cart-color" value="">

            <div class="mb-40">
              <div class="color-wrapper">
                <span class="variation-name">Color</span>
                <select name="" id="" style="display: none">
                  <option value=""></option>
                </select>
                <div class="selection selection-js">
                  <div class="selection-wrapper">
                    <span>Choose an option</span>
                    <i class="fa-solid fa-angle-down arrow-down-icon"></i>
                  </div>
                    <ul class="select-list select-list-js color-js hidden">
                        <c:forEach var="color" items="${colors}" >
                            <li data-id="${color.getColorId()}">${color.getColor()}</li>
                        </c:forEach>
                    </ul>
                </div>
              </div>

              <div class="size-wrapper">
                <span class="variation-name">Size</span>
                <select name="" id="" style="display: none">
                  <option value=""></option>
                </select>

                <div class="selection selection-js">
                  <div class="selection-wrapper">
                    <span>Choose an option</span>
                    <i class="fa-solid fa-angle-down arrow-down-icon"></i>
                  </div>
                    <ul class="select-list select-list-js size-js hidden">
                        <c:forEach var="size" items="${sizes}" >
                            <li data-id="${size.getSizeId()}">${size.getSize()}</li>
                        </c:forEach>
                    </ul>
                </div>
              </div>
            </div>

            <div class="quantity-wrapper">
                <span class="decrease-btn">-</span>
                <input type="text" class="quantity-input" name="quantity-input" value="1" />
                <span class="increase-btn">+</span>
            </div>
            <button class="btn btn-m">Add to cart</button>
          </form>

          <ul class="category-list">
            <span>CATEGORIES: &nbsp</span>
            <li><a href="">All Stones</a></li>
            ,
            <li><a href="">Diamond Rings</a></li>
            ,
            <li><a href="">Onyx</a></li>
            ,
            <li><a href="">Rings</a></li>
            ,
            <li><a href="">White Gold</a></li>
          </ul>
        </div>
      </div>
    </section>
</main>

<jsp:include page="/views/partials/siteFooter.jsp" />