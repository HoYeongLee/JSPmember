<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@page import="com.member.bean.MemberVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 - 실정프로젝트 회원관리 V1</title>
<style>
#view {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 70%;
}

#view th {
	width: 30%;
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #006bb3;
	color: white;
	border: 1px solid #ddd;
}

#view tr:hover {
	background-color: #ddd;
}

#view td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}


#view img {
  width: 100%;
  height: auto;
}
</style>


</head>
<body>
	<%
	MemberDAO memberDAO = new MemberDAO();
	String id = request.getParameter("id");
	MemberVO u = memberDAO.getOne(Integer.parseInt(id));
	request.setAttribute("vo", u);
	%>
	<h1>회원 정보 보기</h1>
	<table id="view">
		<tr>
			<th>User ID</th>
			<td>${vo.getUserid()}</td>
		</tr>
		<tr>
			<th>Name</th>
			<td>${vo.getUsername()}</td>
		</tr>
		<tr>
			<th>Photo</th>
			<td><c:if test="${vo.getPhoto() ne''}">
					<br />
					<img
						src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}"
						class="photo">
				</c:if></td>
		</tr>
		<tr>
			<th>Email</th>
			<td>${vo.getEmail()}</td>
		</tr>
		<tr>
			<th>Detail</th>
			<td>${vo.getDetail()}</td>
		</tr>
	</table>
	<br>
	<button type="button" onclick="history.back()">뒤로 가기</button>
	<button type="button" onclick="location.href='editform.jsp?id=${vo.getSid()}'">수정하기</button>
</html>