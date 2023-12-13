<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/partials/siteHeader.jsp" />

<jsp:include page="/views/partials/breadcrumb.jsp" />


<div class="main mb-100">
    <form action="<c:url value="/cart/update"/>" method="POST">
      <table class="grid wide table-cart">
        <thead class="cart-thead">
          <tr>
            <th class="product-remove">&nbsp;</th>
            <th class="product-thumbnail">&nbsp;</th>
            <th class="product-name">Product</th>
            <th class="product-price">Price</th>
            <th class="product-quantity">Quantity</th>
            <th class="product-subtotal">Subtotal</th>
          </tr>
        </thead>
        <tbody>
            <c:forEach var="line" items="${cart.getItems()}" >
                <tr>
                    <td class="product-remove">
                      <a href="<c:url value="/cart/update?line-productId=${line.getProduct().getProductId()}&quantity-input=0"/>">
                        <svg
                          class="remove-icon"
                          xmlns="http://www.w3.org/2000/svg"
                          height="1em"
                          viewBox="0 0 448 512"
                        >
                          <path
                            d="M170.5 51.6L151.5 80h145l-19-28.4c-1.5-2.2-4-3.6-6.7-3.6H177.1c-2.7 0-5.2 1.3-6.7 3.6zm147-26.6L354.2 80H368h48 8c13.3 0 24 10.7 24 24s-10.7 24-24 24h-8V432c0 44.2-35.8 80-80 80H112c-44.2 0-80-35.8-80-80V128H24c-13.3 0-24-10.7-24-24S10.7 80 24 80h8H80 93.8l36.7-55.1C140.9 9.4 158.4 0 177.1 0h93.7c18.7 0 36.2 9.4 46.6 24.9zM80 128V432c0 17.7 14.3 32 32 32H336c17.7 0 32-14.3 32-32V128H80zm80 64V400c0 8.8-7.2 16-16 16s-16-7.2-16-16V192c0-8.8 7.2-16 16-16s16 7.2 16 16zm80 0V400c0 8.8-7.2 16-16 16s-16-7.2-16-16V192c0-8.8 7.2-16 16-16s16 7.2 16 16zm80 0V400c0 8.8-7.2 16-16 16s-16-7.2-16-16V192c0-8.8 7.2-16 16-16s16 7.2 16 16z"
                          />
                        </svg>
                      </a>
                    </td>

                    <td class="product-thumbnail">
                      <a href="<c:url value="/products/details/${line.getProduct().getSlug()}?id=${line.getProduct().getProductId()}" />">
                        <img
                          class="product-img"
                          src="${line.getProduct().getImageUrl()}"
                          alt=""
                        />
                      </a>
                    </td>

                    <td class="product-name" data-title="Product">
                        <a href="<c:url value="/products/details/${line.getProduct().getSlug()}?id=${line.getProduct().getProductId()}" />" class="title"
                          >14K Gold 9" Diamond Ankle Bracelet
                        </a>
                        <div class="flex flex-col ml-10">
                            <span class="variation">Color: ${line.getProduct().getColor().getColor()}</span>
                            <span class="variation">Size: ${line.getProduct().getSize().getSize()}</span>
                        </div>
                    </td>
                    
                    <c:choose>
                        <c:when test="${productsPromotion_id.contains(line.getProduct().getProductId())}">
                    <td class="product-price" data-title="Price">
                        <div class="price-wrapper">
                            <span class="item-quantity"><span class="new-price">$ ${line.getProduct().formattedPrice(line.getProduct().salePrice())}</span> <span class="old-price">$ ${line.getProduct().formattedPrice()}</span></span>
                        </div>
                    </td>

                    <td class="product-quantity" data-title="Quantity">
                        <div class="quantity-wrapper">
                            <span class="decrease-btn">-</span>
                            <input type="text" class="quantity-input" name="quantity-input" value="${line.getQuantity()}" />
                            <input type="hidden" name="line-productId" value="${line.getProduct().getProductId()}">
                            <span class="increase-btn">+</span>
                        </div>
                    </td>

                    <td class="product-subtotal" data-title="Subtotal">
                      <span>$ ${line.formattedSubtotal(line.getSubTotalSale(line.getProduct().salePrice()))}</span>
                    </td>
                        </c:when>
                        <c:otherwise>
                    <td class="product-price" data-title="Price">
                        <span>$ ${line.getProduct().formattedPrice()}</span>
                    </td>

                    <td class="product-quantity" data-title="Quantity">
                        <div class="quantity-wrapper">
                            <span class="decrease-btn">-</span>
                            <input type="text" class="quantity-input" name="quantity-input" value="${line.getQuantity()}" />
                            <input type="hidden" name="line-productId" value="${line.getProduct().getProductId()}">
                            <span class="increase-btn">+</span>
                        </div>
                    </td>

                    <td class="product-subtotal" data-title="Subtotal">
                      <span>$ ${line.formattedSubtotal(line.getSubTotal())}</span>
                    </td>
                        </c:otherwise>
                    </c:choose>
                   
              </tr>
            </c:forEach>
          <tr class="table-action">
            <td colspan="6" style="border: none">
              <div class="coupon mt-40">
                <input
                  type="text"
                  class="quantity-input coupon-input"
                  placeholder="coupon code"
                />
                <button
                  type="submit"
                  class="btn btn-m btn--active coupon-btn fs-12"
                >
                  Apply coupon
                </button>
              </div>
              <button
                type="submit"
                class="update-cart-btn btn btn-m update-quantity-btn mt-40 fs-12"
              >
                Update cart
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </form>

    <div class="grid wide cart-total">
      <div class="wrapper">
        <div class="empty-block"></div>
        <div class="total">
          <h2 class="total-title">Cart totals</h2>
          <ul class="total-list">
            <li class="mt-40">
              <h3 class="total-sub-title">Subtotal</h3>
              <span class="cart-highlight">$ ${cart.getTotalCart()}</span>
            </li>

            <li>
              <h3 class="total-sub-title">Shipping</h3>
              <div class="shipping-block">
                <p class="item">
                  Flat rate: <span class="cart-highlight">$ 30.00</span>
                </p>
                <p class="item">
                  Shipping to <span class="cart-highlight">Vietnam</span>
                </p>
                <a href="#" class="change-address item">Change address</a>
              </div>
            </li>

            <li style="border-bottom: none">
              <h3 class="total-sub-title">Total</h3>
              <span class="cart-highlight fs-18">$ ${cart.getTotalCart()}</span>
            </li>
          </ul>

          <a href="<c:url value="/site/checkout" />" class="btn btn--active fs-12 pull-right">
            Proceed to checkout
          </a>
        </div>
      </div>
    </div>
  </div>
<input type="text" class="myInput" placeholder="Input 1">
  <input type="text" class="myInput" placeholder="Input 2">
<jsp:include page="/views/partials/siteFooter.jsp" />