<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/partials/siteHeader.jsp" />

<jsp:include page="/views/partials/breadcrumb.jsp" />

<div class="main">
    <div class="section-1200">
        <div class="flex">
            <jsp:include page="/views/partials/customerNavigation.jsp" />

            <div class="nav-content">
              <div class="">
              <form action="" method="POST">
                  <h2 class="common-heading">Billing Address</h2>
    
                  <div class="flex">
                    <div class="input-wrapper">
                      <label for="" class="common-label required">First name</label>
                      <input
                        type="text"
                        name="customer-form-firstName"
                        class="common-input"
                        placeholder="First name..."
                        value="${customer.getFirstName()}"
                      />
                    </div>
    
                    <div class="input-wrapper">
                      <label for="" class="common-label required">Last name</label>
                      <input
                        type="text"
                        name="customer-form-lastName"
                        class="common-input"
                        placeholder="Last name..."
                        value="${customer.getLastName()}"
                      />
                    </div>
                  </div>
                </div>
    
                <div class="input-wrapper">
                  <label for="" class="common-label required"
                    >Country / Region</label
                  >
                  <select name="customer-form-region" class="common-selection">
                    <option value="Vietnam">Viet Nam</option>
                  </select>
                </div>
    
                <div class="input-wrapper">
                  <label for="" class="common-label required">Town / City</label>
                  <select name="customer-form-city" class="common-selection">
                    <option value="HCM">Ho Chi Minh</option>
                    <option value="HN">Ha Noi</option>
                    <option value="DN">Da Nang</option>
                  </select>
                </div>
    
                <div class="input-wrapper">
                  <label for="" class="common-label required">Stress address</label>
                  <input
                    type="text"
                    name="customer-form-addressline"
                    class="common-input"
                    placeholder="Stress address..."
                    value="${address.getAddressLine()}"
                  />
                </div>
    
                <div class="input-wrapper">
                  <label for="" class="common-label required">Phone</label>
                  <input
                    type="text"
                    name="customer-form-phone"
                    class="common-input"
                    placeholder="Phone..."
                    value="${customer.getPhoneNumber()}"
                  />
                </div>
    
                <div class="input-wrapper">
                  <label for="" class="common-label required">Email address</label>
                  <input
                    type="text"
                    name="customer-form-email"
                    readonly
                    class="common-input"
                    placeholder="Email address..."
                    value="${user.getEmail()}"
                  />
                </div>
    
                <button type="submit" class="btn btn-m mt-20">SAVE ADDRESS</button>
              </form>
          </div>
            </div>
        </div>
    </div>
</div>
            
<jsp:include page="/views/partials/siteFooter.jsp" />