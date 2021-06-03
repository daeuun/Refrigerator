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

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.ingre.model.vo.Ingre;
import com.refrigerator.ingre_search.model.vo.IngreSearch;
import com.refrigerator.recipe.model.vo.Recipe;
import com.refrigerator.recipe.model.vo.Reply;
import com.refrigerator.recipe.model.vo.Review;
import com.refrigerator.reicpe_order.model.vo.RecipeOrder;


public class RecipeDao{

	/** 
	 * @author  daeun / seong 
	 */
	
	
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
	/* 기능 확인을 위해 잠시 주석처리 했습니다.
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
	*/



	/**
	 * 레시피등록페이지 - insert DB요청처리
	 * @author HeeRak
	 * @param ordList 
	 * @param addList 
	 * @param ingList 
	 * @param sbList 
	 */
	public int insertRecipe(Connection conn, Recipe r, ArrayList<IngreSearch> sbList, ArrayList<Ingre> ingList, ArrayList<Ingre> addList, ArrayList<RecipeOrder> ordList) {
		int result = 0;
		int result2 = 1;
		PreparedStatement pstmt = null;
		String sql1 = prop.getProperty("insertRecipe");
		String sql2 = prop.getProperty("insertIngreSearch");
		String sql3 = prop.getProperty("insertIngreList");
		String sql4 = prop.getProperty("insertRecipeOrderList");
		String sql5 = prop.getProperty("insertNoImgRecipeOrderList");
		
		try {
			// 1) 레시피 insert
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1,r.getUserNo());
			pstmt.setString(2, r.getRecipeTitle());
			pstmt.setString(3, r.getRecipeIntro());
			pstmt.setInt(4, r.getSeveralServings());
			pstmt.setInt(5, r.getCookingTime());
			pstmt.setString(6, r.getMainImg());
			pstmt.setString(7, r.getIngreImg());
			
			result = pstmt.executeUpdate();
			
			// 2) ingreSearch 정보 insert
			pstmt = conn.prepareStatement(sql2);
			
			for(int i=0; i<sbList.size(); i++) {
				pstmt.setInt(1, sbList.get(i).getIngredientSearch());
				pstmt.setInt(2, sbList.get(i).getCategorySno());
				
				result2 = result2 * pstmt.executeUpdate();
			}
			
			// 3) ingre 정보 insert
			pstmt = conn.prepareStatement(sql3);
			
			for(int i=0; i<ingList.size(); i++) {
				pstmt.setInt(1, ingList.get(i).getCategorySno());
				pstmt.setInt(2, ingList.get(i).getIngreAmount());
				pstmt.setString(3, ingList.get(i).getIngreUnit());
				pstmt.setString(4, ingList.get(i).getIngreCategory());
				
				result2 = result2 * pstmt.executeUpdate();
			}
			
			for(int i=0; i<addList.size(); i++) {
				pstmt.setInt(1, addList.get(i).getCategorySno());
				pstmt.setInt(2, addList.get(i).getIngreAmount());
				pstmt.setString(3, addList.get(i).getIngreUnit());
				pstmt.setString(4, addList.get(i).getIngreCategory());
				
				result2 = result2 * pstmt.executeUpdate();
			}
			
			// 4) recipeorder 정보 insert
			for(int i=0; i<ordList.size(); i++) {
				
				if(ordList.get(i).getRecipeImg()!= null) {// 이미지 있는 경우
					
					pstmt = conn.prepareStatement(sql4);
					pstmt.setInt(1, ordList.get(i).getRecipeOrder());
					pstmt.setString(2, ordList.get(i).getRecipeExpln());
					pstmt.setString(3, ordList.get(i).getRecipeImg());
					
					result2 = result2 * pstmt.executeUpdate();
					
				}else {// 이미지 없는경우
					
					pstmt = conn.prepareStatement(sql5);
					pstmt.setInt(1, ordList.get(i).getRecipeOrder());
					pstmt.setString(2, ordList.get(i).getRecipeExpln());
					
					result2 = result2 * pstmt.executeUpdate();
				}
				
			}
			
			result = result * result2;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author leeyeji
	 * 페이징 - 총 페이지 수
	 */
	public int selectListCount(Connection conn) {
		// select => ResultSet 한행
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
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
	 * @author leeyeji
	 * 레시피 전체 목록 조회
	 */
	public ArrayList<Recipe> selectRecipeList(Connection conn, PageInfo pi){
		// select => ResultSet 여러행
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Recipe(rset.getInt("recipe_no"),
								    rset.getInt("user_no"),
								    rset.getString("user_id"),
								    rset.getString("recipe_title"),
								    rset.getString("recipe_intro"),
								    rset.getDouble("avrg_star_point"),
								    rset.getInt("count"),
								    rset.getString("recipe_enroll_date"),
								    rset.getString("main_img")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
}
