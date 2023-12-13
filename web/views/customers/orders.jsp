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
                <c:forEach var="invoice" items="${invoices}">
                <tr>
                    <td>
                      <a class="orderId" href="#">#${invoice.getInvoiceId()}</a>
                    </td>
                    <td>
                      <span href="#">${invoice.getOrderDate()}</span>
                    </td>
                    <td>
                      <span href="#">${invoice.getStatus().getStatus()}</span>
                    </td>
                    <td>
                      <span href="#">$ ${invoice.getTotal()}</span>
                    </td>
                    <td class="text-center">
                      <a href="#" class="btn btn-m">VIEW</a>
                    </td>
                </tr>
                </c:forEach>

                </tbody>
              </table>
            </div>
            </div>
        </div>
    </div>
</div>
            
<jsp:include page="/views/partials/siteFooter.jsp" />