package com.refrigerator.review.model.dao;


import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.review.model.vo.AdmReview;

public class ReviewDao {

	
	Properties prop = new Properties();
	
	public ReviewDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/sql/review/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 등록된 요리 후기 전체 갯수 조회
	 * @author seong
	 * @Date 5/30
	 * 
	 */
	
	public int selectReviewListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewListCount");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT");
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return listCount;
		
	}
	
	
	
	
	/**
	 * 회원이 작성한 요리 후기 전체 조회 
	 * @author seong
	 * @Date 5/30
	 * @return
	 */
	
	public ArrayList<AdmReview>adminSelectReviewList(Connection conn, PageInfo pi){
		
		ArrayList<AdmReview>list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new AdmReview(
						
					rset.getInt("REVIEW_NO")
					,rset.getString("USER_ID")
					,rset.getString("RECIPE_TITLE")	
					,rset.getDouble("STAR")	
					,rset.getString("REVIEW_CONTENT")
					,rset.getDate("ENROLL_DATE")
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
	 * 관리자가 선택한 요리 후기 삭제
	 * @author seong
	 * @Date 5/30
	 */
	
	public int deleteReview(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminDeleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
}
