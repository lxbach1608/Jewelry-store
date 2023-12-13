<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/partials/siteHeader.jsp" />

<main>
      <div class="section-1200">
        <section class="slider">
          <div class="heading-wrapper text-center">
              <h1 class="text-center">Introducing</h1>
            <h2 class="text-center">COLOR FANTASY</h2>
            <p class="text-center">
              Sophisticated Collection Inspired By Passion
            </p>

            <button></button>
          </div>
          <div class="big-banner"></div>
        </section>

        <!-- Service -->
        <div class="service-wrapper flex justify-between">
          <div class="service-item flex justify-center items-center">
            <div class="flex mr-20">
              <i class="service-icon fa-solid fa-phone-volume"></i>
            </div>
            <div class="service-body">
              <p>Expert Support</p>
              <span>support@domain.com</span>
            </div>
          </div>

          <div class="service-item flex justify-center items-center">
            <div class="flex mr-20">
              <i class="service-icon fa-solid fa-truck-moving"></i>
            </div>
            <div class="service-body">
              <p>Free Delivery</p>
              <span>+44 (0) 800 123 4567</span>
            </div>
          </div>

          <div class="service-item flex justify-center items-center">
            <div class="flex mr-20">
              <i class="service-icon fa-solid fa-envelope"></i>
            </div>
            <div class="service-body">
              <p>Buyer discount</p>
              <span>Special Offer Every Month</span>
            </div>
          </div>

          <div class="service-item flex justify-center items-center">
            <div class="flex mr-20">
              <i class="service-icon fa-solid fa-clock"></i>
            </div>
            <div class="service-body">
              <p>Excellent quality</p>
              <span>Over 4K happy clients</span>
            </div>
          </div>
        </div>

        <!-- Banner 1 -->
        <div class="banner-wrapper flex mt-20">
          <div class="banner-item she-said-yes">
            <p>
              She said
              <br />
              "YES"
            </p>

            <a href="#">Shop Now</a>
          </div>

          <div class="banner-item happy-ever-after">
            <p>Happy Ever After</p>

            <a href="#">Click here</a>
          </div>
        </div>

        <!-- outstanding product/collection -->
        <section class="outstanding mt-60">
          <div class="text-center">
            <h1 class="outstanding-heading">OUR LATEST COLLECTION</h1>

            <img
              class="heading-img"
              src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANgAAAAdCAMAAAD/21LYAAABBVBMVEUAAAAA0bdFz74A0bdFz74A0bdFz75Fz75Fz74A0bdFz75Fz75Fz75Fz75Fz75Fz75Fz75Fz75Fz75Fz74A0bdFz75Fz75Fz74A0bcA0bcA0bdFz75Fz75Fz75Fz75Fz75Fz74A0bcA0bcA0bcA0bcA0bdFz75Fz74A0bcA0bcA0bdFz75Fz74A0bcA0bcA0bdFz74A0bdFz74A0bcA0bcA0bcA0bcA0bcA0bdFz74A0bdFz75Fz75Fz75Fz75Fz74A0bcA0bcA0bcA0bdFz74A0bcA0bcA0bcA0bcA0bdFz75Fz75Fz74A0bcA0bdFz74A0bdFz75Fz75Fz74A0bdFz74A0bfpEX+HAAAAVXRSTlMA/eX3dywiEoju2pJ7MxSMWC8D/PPv39OrNDANUU0eGhfp5Ma1mmtlU0Y5Cffc17u0o5aLfXBlWUxGPSnKq6Y439HMwaCSdmpfQkHAg4eDWyq7mj0o8nzLkQAAAuNJREFUWMPt2NlS4kAUgOGeyDQhC9kMqFndCAoim7KDIG6A4ta+/6PM6QBRxJm7mamm/C7gVO7+6qZJgr59W6K7OZsjwCjLvi+XDTpzds7VEdu0stPqEJCytclEswU6d1rOs4yY5vKm6DpQY8biKsdN4zETGh1XNBUXMUxXUyTteF3D6GC5SEhRxh3D6HpOmqTUHGKX3CWEiJ4qpG2fzxOSVzw7LaieSPdjDzHLVSCGtB0s8p6aJiCteryInTahkRixKiYQYAy9Vkt+IqEnrdVyhwYdBQmxKpgoPM8rGQshLIk8ECVYJisTXp4EiFVxPxmPx5NJS9fhE0b6qesWnemIWPUSSDEgZbA/jc1NfZyZXQ1eEKtkkQsJjqsI81FxnflYltHf9foT7Oxsbx83m3dH9Xq2Vrs9vzm7rlbvK1eHh6WtrYOD08v9/UG/cHKxt7e7m0hsbm5QP969UeiTnN0mIQnHzNlkxrA0m9r28h/ZG/Xj3Qa1uZlI7O7u7V2cFPqD/f3L04ODra3S4eFV5b5avT67Ob+t1bL1+tFds3m8vb2zQ1Ne0dzjousYuo7q2Sx0hWEPUdgphA0WYYlF2Ieqr8OQDoc81ZVHAgkJI7k7G6Y6+iLsQ9siLLEIG0DYaRT2EIZBWTZbP4Ky40XZ4x/CoIuGVSCsFK1Yv1A4gbJoxVbL0AorSBGQtnGRhIrYDltTcFQui7pWVwy6TgqFfrRiJQir0DAo+yrsX0hKtCwvJXmTAJNPSnn45iY+YhwWadEQL+488JD2ldm964j0ugYh45FcDHei3BgTYnQZvk+M6I0nA35SvkKA6GdSxBg3WH/MjA79/NAPOEK4wB/mYT9aaC3kAoG0tdGY7kitDavH8pPYEksyObUlwk5sqZwprcl6UZ7IKTggJMAKV2b6ncDqO51ir5FKNXpF1t/ifKK/lBu9TqfXeB6txYH4zmpoWiajaQ67D2G/kbM8TfOstTkQ/5tfLz2mF72xePYAAAAASUVORK5CYII="
              alt=""
            />
          </div>
          <div class="row">
            <div class="col l-3">
              <div class="product-item">
                <div class="product-wrapper">
                  <a href="">
                    <img
                      class="product__img"
                      src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-FGk4D64U/w:300/h:300/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_6.jpg"
                      alt=""
                    />
                  </a>
                  <span class="category-lable">By Metal</span>
                  <a href="#" class="product__body">
                    <h2 class="product__title">
                      14K Gold 9" Diamond Ankle Bracelet
                    </h2>
                    <div class="price-wrapper text-center">
                      <span class="product-price text-green text-semibold"
                        >$ 1,999.00</span
                      >
                    </div>
                  </a>
                  <div class="btn-wrapper">
                    <a href="#" class="add-to-cart-btn">Select Options</a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col l-3">
              <div class="product-item">
                <div class="product-wrapper">
                  <a href="">
                    <img
                      class="product__img"
                      src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-cBALG0EC/w:300/h:300/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_7.jpg"
                      alt=""
                    />
                  </a>
                  <span class="category-lable">By Metal</span>
                  <a href="#" class="product__body">
                    <h2 class="product__title">
                      Exquisit Silver 9" Diamond Cut Pearls Link Anklet
                    </h2>
                    <div class="price-wrapper text-center">
                      <span class="product-price text-green text-semibold"
                        >$ 50.00</span
                      >
                    </div>
                  </a>
                  <div class="btn-wrapper">
                    <a href="#" class="add-to-cart-btn">Select Options</a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col l-3">
              <div class="product-item">
                <div class="product-wrapper">
                  <a href="">
                    <img
                      class="product__img"
                      src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-fDNzwSu7/w:300/h:300/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_8.jpg"
                      alt=""
                    />
                  </a>
                  <span class="category-lable">By Metal</span>
                  <a href="#" class="product__body">
                    <h2 class="product__title">
                      Jason Segal Sterling 10-Facet Diamond 9" Ankle Bracelet
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
            </div>

            <div class="col l-3">
              <div class="product-item">
                <div class="product-wrapper">
                  <a href="">
                    <img
                      class="product__img"
                      src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-DwSCHIno/w:300/h:300/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_4.jpg"
                      alt=""
                    />
                  </a>
                  <span class="category-lable">By Metal</span>
                  <a href="#" class="product__body">
                    <h2 class="product__title">
                      Stainless Steel Cutout Station Ankle Bracelet
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
            </div>
          </div>
        </section>

        <!-- Banner 2 -->
        <div class="banner-wrapper-2 flex mt-20">
          <div class="banner-item-2 emilia">
            <!-- <p>
              She said
              <br />
              "YES"
            </p>

            <a href="#">Shop Now</a> -->
          </div>

          <div class="banner-item-2 you-earned-it">
            <span>NEW COLLECTION</span>

            <p>
              Maybe You?ve <br />
              Earned it
            </p>

            <a href="#">Shop Now</a>
          </div>
        </div>

        <section class="outstanding mt-60">
          <div class="text-center">
            <h1 class="outstanding-heading">OUR BESTSELLING ITEMS</h1>

            <img
              class="heading-img"
              src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANgAAAAdCAMAAAD/21LYAAABBVBMVEUAAAAA0bdFz74A0bdFz74A0bdFz75Fz75Fz74A0bdFz75Fz75Fz75Fz75Fz75Fz75Fz75Fz75Fz75Fz74A0bdFz75Fz75Fz74A0bcA0bcA0bdFz75Fz75Fz75Fz75Fz75Fz74A0bcA0bcA0bcA0bcA0bdFz75Fz74A0bcA0bcA0bdFz75Fz74A0bcA0bcA0bdFz74A0bdFz74A0bcA0bcA0bcA0bcA0bcA0bdFz74A0bdFz75Fz75Fz75Fz75Fz74A0bcA0bcA0bcA0bdFz74A0bcA0bcA0bcA0bcA0bdFz75Fz75Fz74A0bcA0bdFz74A0bdFz75Fz75Fz74A0bdFz74A0bfpEX+HAAAAVXRSTlMA/eX3dywiEoju2pJ7MxSMWC8D/PPv39OrNDANUU0eGhfp5Ma1mmtlU0Y5Cffc17u0o5aLfXBlWUxGPSnKq6Y439HMwaCSdmpfQkHAg4eDWyq7mj0o8nzLkQAAAuNJREFUWMPt2NlS4kAUgOGeyDQhC9kMqFndCAoim7KDIG6A4ta+/6PM6QBRxJm7mamm/C7gVO7+6qZJgr59W6K7OZsjwCjLvi+XDTpzds7VEdu0stPqEJCytclEswU6d1rOs4yY5vKm6DpQY8biKsdN4zETGh1XNBUXMUxXUyTteF3D6GC5SEhRxh3D6HpOmqTUHGKX3CWEiJ4qpG2fzxOSVzw7LaieSPdjDzHLVSCGtB0s8p6aJiCteryInTahkRixKiYQYAy9Vkt+IqEnrdVyhwYdBQmxKpgoPM8rGQshLIk8ECVYJisTXp4EiFVxPxmPx5NJS9fhE0b6qesWnemIWPUSSDEgZbA/jc1NfZyZXQ1eEKtkkQsJjqsI81FxnflYltHf9foT7Oxsbx83m3dH9Xq2Vrs9vzm7rlbvK1eHh6WtrYOD08v9/UG/cHKxt7e7m0hsbm5QP969UeiTnN0mIQnHzNlkxrA0m9r28h/ZG/Xj3Qa1uZlI7O7u7V2cFPqD/f3L04ODra3S4eFV5b5avT67Ob+t1bL1+tFds3m8vb2zQ1Ne0dzjousYuo7q2Sx0hWEPUdgphA0WYYlF2Ieqr8OQDoc81ZVHAgkJI7k7G6Y6+iLsQ9siLLEIG0DYaRT2EIZBWTZbP4Ky40XZ4x/CoIuGVSCsFK1Yv1A4gbJoxVbL0AorSBGQtnGRhIrYDltTcFQui7pWVwy6TgqFfrRiJQir0DAo+yrsX0hKtCwvJXmTAJNPSnn45iY+YhwWadEQL+488JD2ldm964j0ugYh45FcDHei3BgTYnQZvk+M6I0nA35SvkKA6GdSxBg3WH/MjA79/NAPOEK4wB/mYT9aaC3kAoG0tdGY7kitDavH8pPYEksyObUlwk5sqZwprcl6UZ7IKTggJMAKV2b6ncDqO51ir5FKNXpF1t/ifKK/lBu9TqfXeB6txYH4zmpoWiajaQ67D2G/kbM8TfOstTkQ/5tfLz2mF72xePYAAAAASUVORK5CYII="
              alt=""
            />
          </div>
          <div class="row">
            <div class="col l-3">
              <div class="product-item">
                <div class="product-wrapper">
                  <a href="">
                    <img
                      class="product__img"
                      src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-FGk4D64U/w:300/h:300/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_6.jpg"
                      alt=""
                    />
                  </a>
                  <span class="category-lable">By Metal</span>
                  <a href="#" class="product__body">
                    <h2 class="product__title">
                      14K Gold 9? Diamond Ankle Bracelet
                    </h2>
                    <div class="price-wrapper text-center">
                      <span class="product-price text-green text-semibold"
                        >$ 1,999.00</span
                      >
                    </div>
                  </a>
                  <div class="btn-wrapper">
                    <a href="#" class="add-to-cart-btn">Select Options</a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col l-3">
              <div class="product-item">
                <div class="product-wrapper">
                  <a href="">
                    <img
                      class="product__img"
                      src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-cBALG0EC/w:300/h:300/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_7.jpg"
                      alt=""
                    />
                  </a>
                  <span class="category-lable">By Metal</span>
                  <a href="#" class="product__body">
                    <h2 class="product__title">
                      Exquisit Silver 9? Diamond Cut Pearls Link Anklet
                    </h2>
                    <div class="price-wrapper text-center">
                      <span class="product-price text-green text-semibold"
                        >$ 50.00</span
                      >
                    </div>
                  </a>
                  <div class="btn-wrapper">
                    <a href="#" class="add-to-cart-btn">Select Options</a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col l-3">
              <div class="product-item">
                <div class="product-wrapper">
                  <a href="">
                    <img
                      class="product__img"
                      src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-fDNzwSu7/w:300/h:300/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_8.jpg"
                      alt=""
                    />
                  </a>
                  <span class="category-lable">By Metal</span>
                  <a href="#" class="product__body">
                    <h2 class="product__title">
                      Jason Segal Sterling 10-Facet Diamond 9? Ankle Bracelet
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
            </div>

            <div class="col l-3">
              <div class="product-item">
                <div class="product-wrapper">
                  <a href="">
                    <img
                      class="product__img"
                      src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-DwSCHIno/w:300/h:300/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_4.jpg"
                      alt=""
                    />
                  </a>
                  <span class="category-lable">By Metal</span>
                  <a href="#" class="product__body">
                    <h2 class="product__title">
                      Stainless Steel Cutout Station Ankle Bracelet
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
            </div>
          </div>
        </section>
      </div>
    </main>


<jsp:include page="/views/partials/siteFooter.jsp" />


<!--<a href="<c:url value="/admin/stored/products" />">ADMIN</a>
        <a href="<c:url value="/products/show" />">SHOP</a>
        <a href="<c:url value="/site/cart" />">CART</a>
        <a href="<c:url value="/site/checkout" />">CHECKOUT</a>
        <a href="<c:url value="/products/details" />">PRODUCT DETAILS</a>
        
        <form action="<c:url value="/sendMail"/>" method="POST">
            <button type="submit">SEND MAIL<button>
        </form>-->