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
                  <form action="<c:url value="/customers/password/update"/>" method="POST">
                <h2 class="common-heading">Account details</h2>

                <div class="flex">
                  <div class="input-wrapper">
                    <label for="" class="common-label required"
                      >First name</label
                    >
                    <input
                      type="text"
                      name=""
                      class="common-input"
                      placeholder="First name..."
                      value="${customer.getFirstName()}"
                    />
                  </div>

                  <div class="input-wrapper">
                    <label for="" class="common-label required"
                      >Last name</label
                    >
                    <input
                      type="text"
                      name=""
                      class="common-input"
                      placeholder="Last name..."
                      value="${customer.getLastName()}"
                    />
                  </div>
                </div>

                <div class="input-wrapper">
                  <label for="" class="common-label required"
                    >Display name</label
                  >
                  <input
                    type="text"
                    name=""
                    class="common-input"
                    placeholder="Display name..."
                  />
                  <p style="font-style: italic; font-size: 1.4rem">
                    This will be how your name will be displayed in the account
                    section and in reviews
                  </p>
                </div>

                <div class="input-wrapper">
                  <label for="" class="common-label required"
                    >Email address</label
                  >
                  <input
                    type="text"
                    name="customer-form-email"
                    readonly
                    class="common-input"
                    placeholder="Email address..."
                    value="${user.getEmail()}"
                  />
                </div>

                <div class="change-password">
                  <h2 class="common-heading">Change password</h2>

                  <div class="input-wrapper">
                    <label for="" class="common-label required"
                      >Current password</label
                    >
                    <input
                      type="password"
                      name="customer-form-currentpassword"
                      class="common-input"
                      placeholder="Current password..."
                    />
                  </div>

                  <div class="input-wrapper">
                    <label for="" class="common-label required"
                      >New password</label
                    >
                    <input
                      type="password"
                      name="customer-form-newpassword"
                      class="common-input"
                      placeholder="New password..."
                    />
                  </div>

                  <div class="input-wrapper">
                    <label for="" class="common-label required"
                      >Confirm new password</label
                    >
                    <input
                      type="password"
                      name="customer-form-confirmpassword"
                      class="common-input"
                      placeholder="Confirm new password..."
                    />
                  </div>
                </div>

                <button type="submit" class="btn btn-m mt-20">
                  SAVE INFO
                </button>
              </form>
            </div>
            </div>
        </div>
    </div>
</div>
            
<jsp:include page="/views/partials/siteFooter.jsp" />