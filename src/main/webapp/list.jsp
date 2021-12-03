<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.member.dao.MemberDAO" %>
<%@page import = "com.member.bean.MemberVO" %>
<%@page import = "java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>실전프로젝트 회원관리 V1</title>
<style>
#list {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 90%;
}

#list td, #list th {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

#list tr:nth-child(even) {
	background-color: #f2f2f2;
}

#list tr:hover {
	background-color: #ddd;
}

#list th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #006bb3;
	color: white;
}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='delete_ok.jsp?id=' + id;
	}
</script>
</head>
<body>
<h1>자유게시판</h1>
<%
	MemberDAO MemberDAO = new MemberDAO();
	ArrayList<MemberVO> list = MemberDAO.getList();
	request.setAttribute("list",list);
%>
<table id="list">
<tr>
	<th>No</th>
	<th>User ID</th>
	<th>User Name</th>
	<th>Email</th>
	<th>Registered Date</th>
	<td> <a href="addform.jsp">회원 추가</a></td>
</tr>
<c:forEach items="${list}" var="u" varStatus="status">
	<tr>
		<td>${fn:length(list)-status.index}</td>
		<td>${u.getUserid()}</td>
		<td>${u.getUsername()}</td>
		<td>${u.getEmail()}</td>
		<td>${u.getRegdate()}</td>
		<td><a href="view.jsp?id=${u.getSid()}">상세 보기</a></td>
		<td><a href="editform.jsp?id=${u.getSid()}">수정</a></td>
		<td><a href="javascript:delete_ok('${u.getSid()}')">삭제</a></td>
	</tr>
</c:forEach>
</table>
</body>
</html>