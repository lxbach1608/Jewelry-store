<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/partials/siteHeader.jsp" />

<jsp:include page="/views/partials/breadcrumb.jsp" />

<div class="main">
    <div class="center">
      <div class="checkout-wrapper">
        <!-- Address -->
        <form action="<c:url value="/user/address/update"/>" method="POST">
        <div class="detail-address">
          <h3 class="order-title">Billing details</h3>
          <div class="address-item flex justify-between">
            <div class="address-wrapper">
              <label for="" class="address-label required">First name</label>
              <input type="text" name="address-update-firstname" value="${customer.getFirstName()}" class="address-input" required />
            </div>
            <div class="address-wrapper">
              <label for="" class="address-label required">Last name</label>
              <input type="text" name="address-update-lastname" value="${customer.getLastName()}" class="address-input" required />
            </div>
          </div>

          <div class="address-item">
            <div class="address-wrapper">
              <label for="" class="address-label required">Country</label>
              <select name="address-update-region" class="address-select">
                <option value="Vietnam">Viet Nam</option>
                <option value="Thailan">Thai Lan</option>
              </select>
            </div>
          </div>

          <div class="address-item">
            <div class="address-wrapper">
              <label for="" class="address-label required">Town / City</label>
              <select name="address-update-city" class="address-select">
                <option value="Ho Chi Minh">Ho Chi Minh</option>
                <option value="Ha Noi">Ha Noi</option>
                <option value="Da Nang">Da Nang</option>
              </select>
            </div>
          </div>

          <div class="address-item">
            <div class="address-wrapper">
              <label for="" class="address-label required"
                >Street address</label
              >
              <input type="text" name="address-update-addressline" value="${address.getAddressLine()}" class="address-input" required/>
            </div>
          </div>

          <div class="address-item">
            <div class="address-wrapper">
              <label for="" class="address-label required">Phone</label>
              <input type="text" name="address-update-phone" value="${customer.getPhoneNumber()}" class="address-input" required/>
            </div>
          </div>

          <div class="address-item">
            <div class="address-wrapper">
              <label for="" class="address-label required"
                >Email address</label
              >
              <input type="text" readonly="" value="${user.getEmail()}" class="address-input" required/>
            </div>
          </div>

          <div>
            <div class="note-wrapper">
              <label for="" class="address-label"
                >Order notes (optional)</label
              >
              <textarea
                name="address-update-note"
                class="address-note"
                id=""
                cols="30"
                rows="3"
              ></textarea>
            </div>
          </div>
        </div>
            <c:if test="${orderMessage != null}">
                <p class="message message--error ml-20 mt-40 pull-right">${orderMessage}</p>
            </c:if>
        <button type="submit" class="btn mt-40">Update</button>
        </form>

        <!-- Order -->
        <div class="checkout-product">
          <h3 class="order-title">Your order</h3>
          <div class="inner">
            <table class="checkout-table">
              <thead>
                <tr>
                  <th class="product-name">Product</th>
                  <th class="product-total">Subtotal</th>
                </tr>
              </thead>
              <tbody>
                  <c:forEach var="line" items="${cart.getItems()}">
                    <c:choose>
                        <c:when test="${productsPromotion_id.contains(line.getProduct().getProductId())}">
                        <tr>
                            <td class="product-name">
                              <span>14K Gold 9" Diamond Ankle Bracelet</span>
                              <br />
                              &nbsp;
                              <strong class="product-quantity">${line.getQuantity()}&nbsp; ×</strong>
                              <strong class="product-quantity">&nbsp;${line.getProduct().formattedPrice(line.getProduct().salePrice())}</strong>
                              <div class="flex flex-col text-right">
                                  <span class="variation">Color: ${line.getProduct().getColor().getColor()}</span>
                                  <span class="variation">Size: ${line.getProduct().getSize().getSize()}</span>
                              </div>
                            </td>
                            <td class="product-total">$ ${line.formattedSubtotal(line.getSubTotalSale(line.getProduct().salePrice()))}</td>
                        </tr>
                        </c:when>
                        <c:otherwise>
                        <tr>
                            <td class="product-name">
                              <span>14K Gold 9" Diamond Ankle Bracelet</span>
                              <br />
                              &nbsp;
                              <strong class="product-quantity">${line.getQuantity()}&nbsp; ×</strong>
                              <strong class="product-quantity">&nbsp;${line.getProduct().formattedPrice()}</strong>
                              <div class="flex flex-col text-right w-max pull-right">
                                  <span class="variation">Color: ${line.getProduct().getColor().getColor()}</span>
                                  <span class="variation">Size: ${line.getProduct().getSize().getSize()}</span>
                              </div>
                            </td>
                            <td class="product-total">$ ${line.formattedSubtotal(line.getSubTotal())}</td>
                      </tr>
                        </c:otherwise>
                    </c:choose>
                    
                  </c:forEach>
                

                <tr class="non-border-bottom">
                  <td class="product-name">
                    <span>SUBTOTAL</span>
                  </td>
                  <td class="product-total">$ ${cart.getTotalCart()}</td>
                </tr>

                <tr class="non-border-bottom">
                  <td class="product-name">
                    <span>SHIPPING</span>
                  </td>
                  <td class="product-total">
                    <span style="font-weight: 400">Flat rate: <br /></span>$
                    35.00
                  </td>
                </tr>

                <tr class="non-border-bottom">
                  <td class="product-name">
                    <span>TOTAL</span>
                  </td>
                  <td class="product-total">
                    <strong class="amount">$ ${cart.getTotalCart()}</strong>
                  </td>
                </tr>
              </tbody>
            </table>

            <div class="payment">
              <ul class="payment-list">
                <li>
                  <input
                    type="radio"
                    name="payment-radio"
                    id="bank"
                    checked
                  />
                  <label for="bank">Direct bank transfer</label>
                  <p class="payment-box">
                    Make your payment directly into our bank account. Please
                    use your Order ID as the payment reference. Your order
                    will not be shipped until the funds have cleared in our
                    account.
                  </p>
                </li>
                <li>
                  <input type="radio" name="payment-radio" id="on-delivery" />
                  <label for="on-delivery">Cash on delivery</label>
                  <p class="payment-box">Pay with cash upon delivery.</p>
                </li>
                <li>
                  <input type="radio" name="payment-radio" id="paypal" />
                  <label for="paypal">PayPal</label>
                  <img
                    src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/pp-acceptance-small.png"
                    alt=""
                  />
                  <p class="payment-box">
                    Pay via PayPal; you can pay with your credit card if you
                    don?t have a PayPal account.
                  </p>
                </li>
              </ul>

              <div class="place-order">
                <p class="policy">
                  Your personal data will be used to process your order,
                  support your experience throughout this website, and for
                  other purposes described in our
                  <a href="#" class="policy-link">privacy policy</a>.
                </p>

                <div class="term">
                  <div class="term-inner">
                    <input type="checkbox" name="" id="" />
                    <p>I have read and agree to the website</p>
                  </div>
                </div>
              </div>
                
                <form action="<c:url value="/orders/placed"/>" method="POST">
                    <button type="submit" class="btn btn--active place-order-btn">
                      Place Order
                    </button>
                </form>

            </div>
          </div>
        </div>
      </div>
    </div>
</div>

<jsp:include page="/views/partials/siteFooter.jsp" />