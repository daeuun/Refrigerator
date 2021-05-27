package com.refrigerator.notice.model.dao;

import static com.refrigerator.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.notice.model.vo.Notice;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 공지사항 전체 목록 조회
	 * @author yeji
	 */
	
	public ArrayList<Notice> selectNoticeList(Connection conn){
		// select -> ResultSet (여러행)
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no"),
									rset.getString("notice_title"),
									rset.getString("user_id"),
									rset.getDate("enroll_date"),
									rset.getInt("count")
									));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * 공지사항 클릭시 조회수 증가
	 * @author yeji
	 */
	
	public int increaseCount(Connection conn, int noticeNo) {
		// update => 한 행
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 공지사항 한 개 조회
	 * @author yeji
	 */
	
	public Notice selectNotice(Connection conn, int noticeNo) {
		// select => ResultSet 한 행
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getString("user_id"),
							   rset.getString("notice_title"),
							   rset.getString("notice_content"),
							   rset.getDate("enroll_date"),
							   rset.getDate("modify_date"),
							   rset.getInt("count"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return n;
	}
	

}
