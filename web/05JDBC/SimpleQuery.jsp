<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
<%
  // insert해줄 값 변수에 할당
  String memberId = "test10";
  String name = "테스트회원10";
  String pwd = "1234";

  // preaparedStatement 사용을 위해 StringBuilder 생성
  // preaparedStatement에 넣을 때는 String으로 전환 필요
  StringBuilder sb = new StringBuilder();
  sb.append("INSERT INTO tbl_member(memberId, name, pwd, regdate)");
  sb.append("VALUES (?, ?, ?, NOW())");

  // JDBCConnect 클래스를 이용해 커넥트 객체 생성
  JDBConnect jdbc = new JDBConnect();

  // preparedStatement 객체 생성
  PreparedStatement psmt = null;

  try {
    // preparedStatement 객체에 값 넣고 파라미터 셋팅
    psmt = jdbc.conn.prepareStatement(sb.toString());
    psmt.setString(1, memberId);
    psmt.setString(2, name);
    psmt.setString(3, pwd);

    // 쿼리 실행
    // void executeQuery() : 셀렉트문일 때 사용
    // int executeUpdate() : 수정, 삭제, 삽입일 때 사용
    int result = psmt.executeUpdate();
    out.print(String.format("%d 개의 행이 입력되었습니다.", result));
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    // 사용한 자원 닫기
    if (psmt != null) {
      try {
        psmt.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    jdbc.close();
  }
%>
</body>
</html>
