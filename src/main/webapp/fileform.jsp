<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.member.dao.MemberDAO, com.member.bean.MemberVO"%>
 <%@page import="java.io.File"%>
 <%@page import="com.oreilly.servlet.MultipartRequest"%>
 <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<body>
<form method="post" action="fileupload.jsp"  enctype="multipart/form-data">
		<input type = "file" name = "photo">
		<input type = "submit" name = "upload">
</form>
</body>
</html>