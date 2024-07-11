<%@ page import="common.JDBConnect" %>
<%@ page import="common.DBConnPool" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>JDBC 테스트 1</title>
</head>
<body>
<h2>JDBC 테스트</h2>
<%
  JDBConnect jdbc1 = new JDBConnect();
  // 데이터베이스 작업 수행
  jdbc1.close();
%>
<h2>커넥션 풀 테스트</h2>
<%
  DBConnPool pool = new DBConnPool();
  pool.close();
%>
</body>
</html>
