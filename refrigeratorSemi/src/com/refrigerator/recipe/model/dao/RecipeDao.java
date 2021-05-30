package com.refrigerator.recipe.model.dao;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.recipe.model.vo.Reply;
import com.refrigerator.recipe.model.vo.Review;


public class RecipeDao{

	
	private Properties prop = new Properties();
	
	public RecipeDao() {
		try {
			prop.loadFromXML(new FileInputStream(RecipeDao.class.getResource("/sql/recipe/recipe-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 레시피 상세 페이지의 댓글 전체 목록 조회 리스트 
	 *@author seong
	 */
	
	public ArrayList <Reply> selectReplyList(Connection conn, int recipeNo){
		
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("REPLY_NO")
						,rset.getString("NICKNAME")
						,rset.getString("CREATE_DATE")
						,rset.getString("REPLY_CONTENT")
						
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
	 * 레시피 상세 페이지 댓글 작성 기능 
	 * @author seong
	 */
	
	public int insertReply(Connection conn, Reply r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(r.getReplyWriter()));
			pstmt.setInt(2, r.getRecipeNo());
			pstmt.setString(3, r.getReplyContent());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	/**
	 * 레시피 후기 상세 조회하기 기능
	 * @author seong
	 */
	
	
	public ArrayList<Review> selectReviewList(Connection conn,int recipeNo ){
		
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				list.add(new Review(
						
						rset.getInt("REVIEW_NO")
						,rset.getString("NICKNAME")
						,rset.getString("REVIEW_CONTENT")
						,rset.getDouble("STAR")
						,rset.getString("IMG_NAME")
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
	 * 레시피 후기 작성 기능
	 * @author seong
	 */
	
	public int insertReview(Connection conn, Review rv) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rv.getReviewWriter());
			pstmt.setInt(2, rv.getRecipeNo());
			pstmt.setString(3, rv.getReviewContent());
			pstmt.setDouble(4, rv.getStar());
			pstmt.setString(5, rv.getReviewImg());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return result;
		
		
		
	}
	
	/**
	 * 관리자페이지 - 배너 레시피 조회
	 * @author daeun
	 */
	public Recipe selectRecipe(Connection conn, int recipeNo) {
		Recipe rc = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rc = new Recipe(rset.getInt("recipe_no")
							  , rset.getString("user_id")
						      , rset.getString("recipe_title")
						      , rset.getString("main_img")
						 );
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(conn);
		}
		
		return rc;
	}
	
	
	
}
