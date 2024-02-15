<%@page import="utils.JSFunction"%>
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼값 받기
	String title = request.getParameter("title");
	String content = request.getParameter("content"); // post방식으로 넘어온 값을 변수에 저장
	// 폼값을 DTO 객체에 저장
	BoardDTO dto = new BoardDTO(); // dto 객체 생성(지금은 값없음)
	dto.setTitle(title); // dto 객체에 제목 값 입력
	dto.setContent(content); // dto 객체에 내용 값 입력
	dto.setId(session.getAttribute("UserId").toString()); // 로그인하여 세션(객체)에 있는 id를 저장
	// DAO 객체를 통해 DB에 DTO 저장
	BoardDAO dao = new BoardDAO(application); // jdbc 연결 객체 생성
	int iResult = dao.insertWrite(dto); // insertWrite메서드에 dto값을 전달하여 결과를 int로 받는다.
/* 	int iResult = 0;
	for(int i = 1; i <= 100; i++) {
		dto.setTitle(title + "-" + i); // 제목글자에 -1~-100까지 붙는다.
		iResult = dao.insertWrite(dto); // insert쿼리 실행
	} */  // 더미데이터 만들기용 
	dao.close();
	// 성공 or 실패?
	if (iResult == 1) {
		response.sendRedirect("List.jsp"); // 정상 저장시 리스트 페이지로 이동
	} else {
		JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
	}
%>    
