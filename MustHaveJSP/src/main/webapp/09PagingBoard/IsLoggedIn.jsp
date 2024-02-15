<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (session.getAttribute("UserId") == null) { 
	// 세션 영역에 UserId 속성값이 있는지 확인
	// null이면 로그인 하지 않음
	JSFunction.alertLocation("로그인 후 이용해주십시오.","../06Session/LoginForm.jsp", out);
    // 로그인하지 않았다면 경고창 띄움
    // 로그인 페이지로 이동
	return;
}
%>    
