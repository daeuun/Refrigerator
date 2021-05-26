package com.refrigerator.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static com.refrigerator.common.JDBCTemplate.*;
import com.refrigerator.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	// xml파일에서 키밸류 세트를 읽어들여서 prop에 담을것임 => * MemberDao의 기본생성자에서 읽어들임!! 
	public MemberDao() {
		
		// 일부 경로를 제시해서 getResource로 파일을 찾고 -> 물리적인 경로를 알아내려면 .getPath()까지!!
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 회원가입폼
	 * @param conn
	 * @param m 회원가입 폼에 작성한 사용자가 입력한 값들을 담아놓은 Member객체
	 * @return 처리된 행수
	 */
	public int insertMember(Connection conn, Member m) {
		// insert문 => 처리된행수(한행)
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "user_id");
			pstmt.setString(2, "user_pwd");
			pstmt.setString(3, "user_pwd");
			pstmt.setString(4, "birthday");
			pstmt.setString(5, "gender");
			pstmt.setString(6, "email");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
