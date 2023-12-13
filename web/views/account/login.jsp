<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/partials/siteHeader.jsp" />

<jsp:include page="/views/partials/breadcrumb.jsp" />

<main>
    <div class="center">
        <div class="login-content">
            <form action="<c:url value="/user/signin"/>" method="POST">
            <h2 class="login-heading">Login</h2>
            <c:if test="${messageLogin != null}">
                <p class="message message--error ml-20">${messageLogin}</p>
            </c:if>
            <div class="login-input-wrapper">
                <label class="common-label required">
                    Email address
                </label>
                <input type="email" class="common-input" name="form-login-email" placeholder="email@gmail.com" required/>
            </div>
            <div class="login-input-wrapper">
                <label class="common-label required">
                    Password
                </label>
                <input type="password" class="common-input" name="form-login-password" placeholder="password" required/>
            </div>
            
            <button type="submit" class="btn .mt-20 pull-right" value="Login">Log In</button>
            
            <div class="clear"></div>
            </form>
            
            <div class="flex flex-col">
                <span>You can <a href="<c:url value="/user/register"/>" class="strong">Register</a> for new Account </span>

                <span>You <a href="<c:url value="/user/forgetpassword"/>" class="strong mt-20">Forgot</a> your password ? </span>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/views/partials/siteFooter.jsp" />