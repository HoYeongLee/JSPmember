<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.member.dao.MemberDAO, com.member.bean.MemberVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정 - 실전프로젝트 회원관리 V1</title>
<style>
#editform {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 70%;
}

#editform th {
	width: 30%;
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #006bb3;
	color: white;
	border: 1px solid #ddd;
}

#editform img {
  width: 100%;
  height: auto;
}


#editform tr:hover {
	background-color: #ddd;
}

#editform td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
	width: 40%;
	height: 20%;
}
</style>
</head>
<body>
<%
	MemberDAO MemberDAO = new MemberDAO();
	String id = request.getParameter("id");
	MemberVO u = MemberDAO.getOne(Integer.parseInt(id));
	request.setAttribute("vo", u);
%>

	<h1>회원 정보 수정</h1>
	<form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="sid" value="${vo.getSid()}" />
		<table id="editform">
			<tr>
				<th>User ID</th><td><input type="text" name="userid" value="${vo.getUserid()}" disabled/></td>
			</tr>
			<tr>
				<th>User name</th><td><input type="text" name="username" value="${vo.getUsername()}" /></td>
			</tr>
			<tr>
				<th>photo</th><td><input type = "file"  name = "photo" value ="${vo.getPhoto()}"/>
				<c:if test = "${vo.getPhoto() ne''}"> <br /><img src= "${pageContext.request.contextPath }/upload/${vo.getPhoto()}" class = "photo"> </c:if></td>
			</tr>
			<tr>
				<th>Email</th><td><input type="text" name="email" value="${vo.getEmail()}" /></td>
			</tr>
			<tr>
			<th>Detail</th><td><textarea cols="50" rows="5" name="detail">${vo.getDetail()}</textarea></td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="history.back()">뒤로 가기</button>
		<button type="submit"> 회원정보 수정</button>
	</form>
</body>
</html>