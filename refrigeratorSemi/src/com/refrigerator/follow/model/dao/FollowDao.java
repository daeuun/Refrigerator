package com.refrigerator.follow.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.follow.model.vo.Follow;

import static com.refrigerator.common.JDBCTemplate.close;

public class FollowDao {
	
	Properties prop = new Properties();
	
	public FollowDao() {
		try {
			prop.loadFromXML(new FileInputStream(FollowDao.class.getResource("/sql/follow/follow-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 마이페이지 - 로그인한 유저의 번호 => 팔로우한 유저 정보조회 요청처리
	 * @author HeeRak
	 */
	public ArrayList<Follow> selectFollowList(Connection conn, int userNo) {
		// select문  rset 여러행 반환
		ArrayList<Follow> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFollowList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Follow(rset.getInt("follow_no"),
									rset.getInt("follow_user_no"),
									rset.getInt("following_user_no"),
									rset.getDate("modify_date")
									));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
