<%@ page import="membership.MemberDAO" %>
<%@ page import="membership.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String userId = request.getParameter("user_id");
    String userPwd = request.getParameter("user_pw");

    String mariaDriver= application.getInitParameter("Driver");
    String mariaURL= application.getInitParameter("URL");
    String mariaId= application.getInitParameter("dbId");
    String mariaPwd= application.getInitParameter("dbPwd");

    MemberDAO dao = new MemberDAO(mariaDriver,mariaURL,mariaId,mariaPwd);
    MemberDTO memberDTO = dao.getMemberDTO(userId,userPwd);
    dao.close();

    if(memberDTO.getId() != null){
        session.setAttribute("UserId",memberDTO.getId());
        session.setAttribute("UserName",memberDTO.getName());
        response.sendRedirect("LoginForm.jsp");
    }
    else{
        request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
        request.getRequestDispatcher("LoginForm.jsp").forward(request,response);
    }
%>