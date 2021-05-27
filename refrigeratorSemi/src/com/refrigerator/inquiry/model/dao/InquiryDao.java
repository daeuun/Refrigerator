package com.refrigerator.inquiry.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.inquiry.model.vo.Inquiry;

import static com.refrigerator.common.JDBCTemplate.*;

/**
 * @author Heerak 05.27
 *
 */
public class InquiryDao {
	private Properties prop = new Properties();

	public InquiryDao() {
		
		String filePath = InquiryDao.class.getResource("/sql/inquiry/inquiry-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * HeeRak _ 1:1문의 [미해결] 문의수 DB Count
	 * @param conn
	 * @return
	 */
	public int selectUnsolvedListCount(Connection conn) {
		//select문
		int unSolvedListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUnsolvedListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				unSolvedListCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return unSolvedListCount;
	}
	
	/**
	 * HeeRak _ 1:1문의 [해결] 문의수 DB Count
	 * @param conn
	 * @return
	 */
	public int selectSolvedListCount(Connection conn) {
		//select문
		int solvedListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSolvedListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				solvedListCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return solvedListCount;
	}

	/**
	 * Heerak [문의/답변] 미해결 문의 list DB전체조회
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Inquiry> selectUnSolvedList(Connection conn, PageInfo pi) {
		// select문
		ArrayList<Inquiry> unSolvedList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUnSolvedList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				unSolvedList.add(new Inquiry(rset.getInt("inqry_no"),
											 rset.getString("user_id"),
											 rset.getString("inqry_title"),
											 rset.getString("inqry_content"),
											 rset.getDate("modify_date")
											 ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return unSolvedList;
	}

	/**
	 * Heerak [문의/답변] 해결 문의 list DB전체조회
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Inquiry> selectSolvedList(Connection conn, PageInfo pi) {
		// select문
		ArrayList<Inquiry> solvedList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSolvedList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				solvedList.add(new Inquiry(rset.getInt("inqry_no"),
										   rset.getString("user_id"),
										   rset.getString("inqry_title"),
										   rset.getString("inqry_content"),
										   rset.getDate("modify_date"),
										   rset.getDate("answer_date"),
										   rset.getString("inqry_answer")
											 ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return solvedList;
	}
	
	
	
	
}
