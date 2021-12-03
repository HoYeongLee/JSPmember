package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.member.bean.MemberVO;
import com.member.common.*;

public class MemberDAO {

	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private final String M_INSERT = "insert into member(userid, password, username, email, photo, detail) "
			+ "values (?, sha1(?), ?, ?, ?, ?)";
	private final String M_UPDATE = "update member set username = ?, email = ?, photo = ?, detail = ?" 
			+ "where sid = ?";
	private final String M_DELETE = "delete from member where sid = ?";
	private final String M_SELECT = "select * from member where sid = ?";
	private final String M_LIST = "select * from member order by regdate desc";

	public int insertMember(MemberVO data) {
		int result = 0;
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(M_INSERT);
			stmt.setString(1, data.getUserid());
			stmt.setString(2, data.getPassword());
			stmt.setString(3, data.getUsername());
			stmt.setString(4, data.getEmail());
			stmt.setString(5, data.getPhoto());
			stmt.setString(6, data.getDetail());
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public void deleteMember(int sid) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_DELETE);
			stmt.setInt(1, sid);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int updateMember(MemberVO data) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_UPDATE);
			stmt.setString(1, data.getUsername());
			stmt.setString(2, data.getEmail());
			stmt.setString(3, data.getPhoto());
			stmt.setString(4, data.getDetail());
			stmt.setInt(5, data.getSid());

			stmt.executeUpdate();
			return 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public MemberVO getOne(int sid) {
		MemberVO one = null;
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(M_SELECT);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if (rs.next()) {
				one = new MemberVO();
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setUsername(rs.getString("username"));
				one.setEmail(rs.getString("email"));
				one.setPhoto(rs.getString("photo"));
				one.setDetail(rs.getString("detail"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return one;
	}

	public ArrayList<MemberVO> getList() {
		ArrayList<MemberVO> list = null;
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(M_LIST);
			rs = stmt.executeQuery();
			list = new ArrayList<MemberVO>();
			MemberVO one = new MemberVO();
			while (rs.next()) {
				one = new MemberVO();
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setUsername(rs.getString("username"));
				one.setEmail(rs.getString("email"));
				one.setRegdate(rs.getDate("regdate"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public String getPhotoFilename(int sid) {
		String filename = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_SELECT);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if(rs.next()) {
				filename = rs.getString("photo");
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
		return filename;
	}
	
}
