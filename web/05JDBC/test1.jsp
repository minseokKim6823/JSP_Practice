<%@ page import="common.JDBConnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>JDBC</title>
</head>
<body>
<h2>JDBC테스트</h2>
<%
    JDBConnect jdbc1 =new JDBConnect();
    jdbc1.close();
%>

</body>
</html>
