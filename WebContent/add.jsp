<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.javaex.dao.GuestbookDao"%>
<%@ page import="com.javaex.vo.GuestbookVo"%>


<%
	//파라미터 값 꺼내기
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	String regDate = request.getParameter("rdate");
	
	//GuestbookVo 만들기
	GuestbookVo guestbookVo = new GuestbookVo(name, password, content, regDate);
	
	//GuestbookDao guestInsert()로 등록하기
	GuestbookDao guestbookDao = new GuestbookDao();
	int count = guestbookDao.guestInsert(guestbookVo);
	System.out.println(count);
	
	response.sendRedirect("./addList.jsp");
	
%>
