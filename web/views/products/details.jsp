<jsp:include page="/views/partials/siteHeader.jsp" />

<jsp:include page="/views/partials/breadcrumb.jsp" />

<main>
    <section class="section-1200">
      <!-- img -->
      <div class="product-detail">
        <div class="product-img">
          <div class="main-img mb-20">
            <img
              src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-FGk4D64U/w:auto/h:auto/q:auto/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_6.jpg"
              alt=""
            />
          </div>

          <ul class="sub-img-list">
            <li class="sub-img">
              <img
                src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-FGk4D64U/w:auto/h:auto/q:auto/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_6.jpg"
                alt=""
              />
            </li>

            <li class="sub-img">
              <img
                src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-wHOXw_gG/w:auto/h:auto/q:auto/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_1.jpg"
                alt=""
                width="50px"
                height="50px"
              />
            </li>
          </ul>
        </div>

        <!-- body, content -->
        <div class="product-content">
          <h2 class="product-content__title">A Dream Ring</h2>

          <div class="price-wrapper">
            <span class="old-price">$ 677.35</span>
            <span class="price">$ 524.40</span>
          </div>

          <p class="product-desc">
            Pellentesque habitant morbi tristique senectus et netus et malesuada
            fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae,
            ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam
            egestas semper. Aenean ultricies mi vitae est. Mauris placerat
            eleifend leo.
          </p>

          <form>
            <div class="mb-40">
              <div class="color-wrapper">
                <span class="variation-name">Color</span>
                <select name="" id="" style="display: none">
                  <option value=""></option>
                </select>

                <div class="selection">
                  <div class="selection-wrapper">
                    <span>Choose an option</span>
                    <i class="fa-solid fa-angle-down arrow-down-icon"></i>
                  </div>
                </div>
              </div>

              <div class="size-wrapper">
                <span class="variation-name">Size</span>
                <select name="" id="" style="display: none">
                  <option value=""></option>
                </select>

                <div class="selection">
                  <div class="selection-wrapper">
                    <span>Choose an option</span>
                    <i class="fa-solid fa-angle-down arrow-down-icon"></i>
                  </div>
                </div>
              </div>
            </div>

            <div class="quantity-wrapper">
              <input type="number" class="quantity-input" value="1" />
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