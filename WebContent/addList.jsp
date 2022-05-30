<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.javaex.vo.GuestbookVo"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	List<GuestbookVo> guestList = (List<GuestbookVo>)request.getAttribute("guestList");

	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String regDate = simpleDate.format(date);
	
	System.out.println(guestList);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./gbc" method="get">
	<!-- form 메소드에 post로 작성하면 한글 깨짐 -->
	<table border="1">
	<colgroup>
			<col style="width: 50px;">
			<col style="width: 170px;">
			<col style="width: 80px;">
			<col style="width: 170px;">
	</colgroup>
		<tr>
			<td>이름</td>
			<td ><input type="text" name="name" value=""></td>
			<td>비밀번호</td>
			<td><input type="password" name="password" value=""></td>
		</tr>
		<tr>
			<td colspan="4">
			<textarea cols="70" rows="10" name="content" value=""></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4">
			<input type="hidden" name="rdate" value="<%=regDate%>">
			<input type="hidden" name="action" value="add">
			<button type="submit">확인</button>
			</td>
		</tr>
	</table>
	</form>
	
	<br>
	
	<%for(int i =0; i<guestList.size(); i++) {%>
		<table border="1">
		<colgroup>
			<col style="width: 50px;">
			<col style="width: 120px;">
			<col style="width: 250px;">
			<col style="width: 65px;">
		</colgroup>
			<tr>
				<td>[ <%=guestList.get(i).getGuestbookNo()%>번 ]</td>
				<td> 이름: <%=guestList.get(i).getName()%> </td>
				<td>[ 등록날짜: <%=guestList.get(i).getRegDate()%> ]</td>
				<td><a href="./deleteForm.jsp?delete_no=<%=guestList.get(i).getGuestbookNo()%>">[삭제]</a></td>
			</tr>
			<tr>
				<td colspan="4">
				<%=guestList.get(i).getGuestbookNo()%>번째 방명록 내용<br>
				<%=guestList.get(i).getContent()%></td>
			</tr>
		</table>
		<br>
	<%}%>

</body>
</html>