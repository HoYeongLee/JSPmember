package com.member.common;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import com.member.bean.MemberVO;
import com.member.dao.MemberDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUpload {
	public MemberVO uploadPhoto(HttpServletRequest request) {
		String filename = "";
		int sizeLimit = 15 * 1024 * 1024;
		
		String realPath = request.getServletContext().getRealPath("upload");
		
		File dir = new File(realPath);
		if(!dir.exists()) dir.mkdirs();
		
		MemberVO one = null;
		MultipartRequest MultipartRequest = null;
		try {
			MultipartRequest = new MultipartRequest(request, realPath,
					sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			filename = MultipartRequest.getFilesystemName("photo");
			
			one = new MemberVO();
			String sid = MultipartRequest.getParameter("sid");
			if(sid != null&&!sid.equals("")) one.setSid(Integer.parseInt(sid));
			one.setUserid(MultipartRequest.getParameter("userid"));
			one.setUsername(MultipartRequest.getParameter("username"));
			one.setPassword(MultipartRequest.getParameter("password"));
			one.setEmail(MultipartRequest.getParameter("email"));
			one.setDetail(MultipartRequest.getParameter("detail"));
			
			if(sid !=null && !sid.equals("")) {
				MemberDAO dao = new MemberDAO();
				String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
				if(filename!=null && oldfilename != null)
					filename = oldfilename;
			}
			one.setPhoto(filename);	
		} catch (IOException e) {
			e.printStackTrace();
		}
		return one;
	}
	public static void deleteFile(HttpServletRequest request, String filename) {
		String filePath = request.getServletContext().getRealPath("upload");
		
		File f = new File(filePath + "/" + filename);
		if( f.exists()) f.delete();
	}
	
}
