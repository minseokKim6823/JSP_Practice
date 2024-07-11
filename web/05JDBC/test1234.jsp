<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JDBC Connection 테스트</title>
</head>
<body>
<h2>기본 생성자 연결 테스트</h2>
<%
    JDBConnect jdbc = new JDBConnect();
    out.print("jdbc : " + jdbc + "<br>");
    jdbc.close();
%>

<h2>사용자 정의 생성자 1 연결 테스트</h2>
<%
    String driver1 = application.getInitParameter("Driver");
    String url1 = application.getInitParameter("URL");
    String dbId1 = application.getInitParameter("dbId");
    String dbPwd1 = application.getInitParameter("dbPwd");
    JDBConnect jdbc1 = new JDBConnect(driver1, url1, dbId1, dbPwd1);
    out.print("jdbc1 : " + jdbc1 + "<br>");
    jdbc1.close();
%>

<h2>사용자 정의 생성자 2 연결 테스트</h2>
<%
    JDBConnect jdbc2 = new JDBConnect(application);
    out.print("jdbc2 : " + jdbc2 + "<br>");
    jdbc2.close();
%>
</body>
</html>