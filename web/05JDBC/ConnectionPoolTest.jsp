<%@page import="common.ConnectPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JDBC Connection 테스트</title>
</head>
<body>
<h2>DB Connection pool 연결 테스트</h2>
<%
    ConnectPool pool = new ConnectPool();
    pool.close();
%>
</body>
</html>