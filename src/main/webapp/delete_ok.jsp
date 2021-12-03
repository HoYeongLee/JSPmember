<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "com.member.dao.MemberDAO"%>
<%@page import= "com.member.bean.MemberVO"%>
<%@page import= "com.member.common.FileUpload"%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		MemberDAO memberDAO = new MemberDAO();
		int id = Integer.parseInt(sid);
		
		String filename  = memberDAO.getPhotoFilename(id);
		
		if(filename != null)
			FileUpload.deleteFile(request, filename);
		
		memberDAO.deleteMember(id);
	}
	response.sendRedirect("list.jsp");
%>