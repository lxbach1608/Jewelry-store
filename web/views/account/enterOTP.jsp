<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/partials/siteHeader.jsp" />

<jsp:include page="/views/partials/breadcrumb.jsp" />

<main>
    <div class="center">
        <div class="login-content">
            <form action="<c:url value="/user/validateopt"/>" method="POST">
            <h2 class="login-heading">Validate OTP</h2>
            <c:if test="${messageOpt != null}">
                <p class="message message--error ml-20">${messageOpt}</p>
            </c:if>
            <div class="login-input-wrapper">
                <label class="common-label required">
                    Enter your OTP
                </label>
                <input type="text" class="common-input" name="form-validate-opt" placeholder="OTP" required/>
            </div>
                
            <button type="submit" class="btn .mt-20 pull-right" value="Login">Submit</button>
            
            <div class="clear"></div>
            </form>
        </div>
    </div>
</main>

<jsp:include page="/views/partials/siteFooter.jsp" />