<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>Jewelry Store</title>
    
    <!--Poppins font-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- Butler font -->
    <link
      rel="stylesheet"
      href="<c:url value="/public/vendor/butler/butlerFont/stylesheet.css"/>"
    />

     <!--themify-icon embed--> 
    <link
      rel="stylesheet"
      href="<c:url value="/public/vendor/themify-icons/themify-icons.css"/>"
    />

    <link
      rel="stylesheet"
      href="<c:url value="/public/vendor/fontawesome-free-6.4.2-web/css/all.css"/>"
    />

    <!-- reset CSS -->
    <link rel="stylesheet" href="<c:url value="/public/css/reset.css"/>" />

    <!-- grid.css -->
    <link rel="stylesheet" href="<c:url value="/public/css/grid.css"/>" />

    <!-- main.css -->
    <link rel="stylesheet" href="<c:url value="/public/css/main.css"/>" />
    
</head>
<body>
    <header id="header">
      <!-- Nav -->
      <nav class="nav">
        <div class="nav__wrapper">
          <ul class="nav__list">
            <li>
              <a href="#">Home</a>
            </li>
            <li>
              <a href="#">About us</a>
            </li>
            <li>
              <a href="#">Gallery</a>
            </li>
            <li>
              <a href="#">Contact us</a>
            </li>
          </ul>
          <div class="action">
            <a>
              <i class="fa-solid fa-right-to-bracket"></i>
              Sign in
            </a>
            <a>
              <i class="fa-regular fa-user"></i>
              My account
            </a>
          </div>
        </div>
      </nav>

      <!-- sub-header -->
      <section class="sub-header">
        <div class="sub_header__wrapper">
          <div class="sub-header__info">
            <div class="location">
              <i class="ti-location-pin"></i>
              <span>London</span>
            </div>
            <div class="phone">
              <i class="ti-mobile"></i>
              <span>+1 (123) 456 78 90</span>
            </div>
          </div>
          <div class="sub-header__img">
            <a href="<c:url value="/products/show" />">
              <img
                  class="store-img"
                  src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-EcAQxbrb/w:954/h:185/q:auto/https://dici.themes.zone/main/wp-content/uploads/sites/8/2019/04/DC_Logo_New_opt.png"
              />
            </a>
          </div>
          <div class="sub-header__action">
            <!-- Search -->
            <div class="search">
              <input placeholder="Search products..." />
              <i class="ti-search search-icon"></i>
            </div>
            <i class="fa-regular fa-heart"></i>

            <div class="cart">
              <span class="selected-quantity">3</span>
              <a href="/cart.html"
                ><i class="ti-shopping-cart cart-icon"></i
              ></a>
              <div class="cart-wrapper">
                <h3 class="cart__title">CART</h3>
                <ul class="cart-list">
                  <li class="cart-item">
                    <div class="title-img">
                      <a href="#">
                        <svg
                          class="xmark-icon"
                          xmlns="http://www.w3.org/2000/svg"
                          height="14px"
                          viewBox="-100 -100 584 712"
                        >
                          <path
                            d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"
                          />
                        </svg>
                      </a>
                      <img
                        class="item-img"
                        src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-FGk4D64U/w:68/h:68/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_6.jpg"
                        alt=""
                      />
                      <span class="item-title"
                        >14K Gold 9" Diamond Ankle Bracelet</span
                      >
                    </div>
                    <span class="item-quantity">1 × $ 15.00</span>
                  </li>

                  <li class="cart-item">
                    <div class="title-img">
                      <a href="#">
                        <svg
                          class="xmark-icon"
                          xmlns="http://www.w3.org/2000/svg"
                          height="14px"
                          viewBox="-100 -100 584 712"
                        >
                          <path
                            d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"
                          />
                        </svg>
                      </a>
                      <img
                        class="item-img"
                        src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-FGk4D64U/w:68/h:68/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_6.jpg"
                        alt=""
                      />
                      <span class="item-title"
                        >14K Gold 9" Diamond Ankle Bracelet</span
                      >
                    </div>
                    <span class="item-quantity">1 × $ 15.00</span>
                  </li>
                </ul>
                <div class="subtotal">
                  <span>Subtotal:</span>
                  <span class="total-price">$ 15.00</span>
                </div>
                <div class="cart-wrapper__btn">
                    <a href="<c:url value="/site/cart" />" class="cart-view btn btn-m fs-14">VIEW CART</a>
                  <a href="<c:url value="/site/checkout" />" class="cart-checkout btn btn-m btn--active fs-14">
                      CHECKOUT
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </header>
    
    <!-- Catalog -->
    <section class="catalog">
      <ul class="catalog-list">
        <li><a href="">Home</a></li>
        <li class="catalog-shop relative">
          <a href="<c:url value="/products/show" />">
            <span class="mr-8">Shop</span>
            <i class="fa-solid fa-angle-down fs-14"></i>
          </a>
          <div class="mega-menu">
            <div class="grid wide">
              <div class="row">
                <div class="col l-7">
                  <div class="row">
                    <div class="col l-4">
                      <div class="parent-wrapper">
                        <h3 class="title"><a href="#">Bracelets</a></h3>
                        <ul class="menu-parent">
                          <li><a href="">Bands</a></li>
                          <li><a href="">Emerald Spring</a></li>
                          <li><a href="">Men'bands</a></li>
                          <li><a href="">Ruthenium</a></li>
                          <li><a href="">Wedding Band Sets</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col l-4">
                      <div class="parent-wrapper">
                        <h3 class="title"><a href="#">Earrings</a></h3>
                        <ul class="menu-parent">
                          <li><a href="">All Stones</a></li>
                          <li><a href="">Aquamarines</a></li>
                          <li><a href="">Diamonds</a></li>
                          <li><a href="">Sterling Silver</a></li>
                          <li><a href="">White Gold</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col l-4">
                      <div class="parent-wrapper">
                        <h3 class="title"><a href="#">Pendants</a></h3>
                        <ul class="menu-parent">
                          <li><a href="">Amethyst</a></li>
                          <li><a href="">Colored Gemstones</a></li>
                          <li><a href="">No Gemstone</a></li>
                          <li><a href="">White Gold</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col l-4">
                      <div class="parent-wrapper">
                        <h3 class="title"><a href="#">By metal</a></h3>
                        <ul class="menu-parent">
                          <li><a href="">Gold</a></li>
                          <li><a href="">Platinum</a></li>
                          <li><a href="">silver</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col l-4">
                      <div class="parent-wrapper">
                        <h3 class="title"><a href="#">By metal</a></h3>
                        <ul class="menu-parent">
                          <li><a href="">Gold</a></li>
                          <li><a href="">Platinum</a></li>
                          <li><a href="">silver</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col l-4">
                      <div class="parent-wrapper">
                        <h3 class="title"><a href="#">By metal</a></h3>
                        <ul class="menu-parent">
                          <li><a href="">Gold</a></li>
                          <li><a href="">Platinum</a></li>
                          <li><a href="">Silver</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col l-5">
                  <figure>
                    <img
                      src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-i62dZoWk/w:1000/h:638/q:auto/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/08/Banner_dropdown.jpg"
                      alt=""
                    />
                  </figure>
                </div>
              </div>
            </div>
          </div>
        </li>
        <li><a href="">New Collection</a></li>
        <li><a href="">Sale</a></li>
        <li><a href="">Women</a></li>
        <li><a href="">Men</a></li>
        <li><a href="">Watches</a></li>
        <li><a href="">Pages</a></li>
        <li><a href="">Blog</a></li>
        <li><a href="">Gallery</a></li>
        <li><a href="">About</a></li>
        <li><a href="">Contact us</a></li>
      </ul>
    </section>