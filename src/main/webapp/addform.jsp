<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원추가 - 실전프로젝트 회원관리 V1</title>
<style>
#addform {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 70%;
}

#addform th {
	width: 30%;
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #006bb3;
	color: white;
	border: 1px solid #ddd;
	padding: 8px;
}

#addform tr:hover {
	background-color: #ddd;
}

#addform td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

#addform img {
  width: 100%;
  height: auto;
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
	<h1>신규 회원 추가</h1>
	<form action="add_ok.jsp" method="post" enctype="multipart/form-data">
		<table  id="addform">
			<tr>
				<th>User ID</th><td><input type="text" name="userid" /></td>
			</tr>
			<tr>
				<th>User Name</th><td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<th>Photo</th><td><input type = "file" name="photo"></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<th>Detail:</th><td><textarea cols="50" rows="5" name="detail"></textarea></td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="location.href='list.jsp'">목록 보기</button>
		<button type="submit">회원 추가</button>
	</form>
</body>
</html>