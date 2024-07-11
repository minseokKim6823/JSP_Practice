<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    session.removeAttribute("UserId");
    session.removeAttribute("UserName");

    session.invalidate();

    response.sendRedirect("LoginForm.jsp");
%>