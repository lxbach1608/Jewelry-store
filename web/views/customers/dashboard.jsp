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
              <table class="order-table">
                <thead>
                  <th class="text-left" style="width: 15%">Order</th>
                  <th class="text-left" style="width: 30%">Date</th>
                  <th class="text-left" style="width: 15%">Status</th>
                  <th class="text-left" style="width: 20%">Total</th>
                  <th class="text-center" style="width: 20%">Action</th>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <a class="orderId" href="#">#13318</a>
                    </td>
                    <td>
                      <span href="#">December 11, 2023</span>
                    </td>
                    <td>
                      <span href="#">Payed</span>
                    </td>
                    <td>
                      <span href="#">$ 500.00</span>
                    </td>
                    <td class="text-center">
                      <a href="#" class="btn btn-m">VIEW</a>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            </div>
        </div>
    </div>
</div>
            
<jsp:include page="/views/partials/siteFooter.jsp" />