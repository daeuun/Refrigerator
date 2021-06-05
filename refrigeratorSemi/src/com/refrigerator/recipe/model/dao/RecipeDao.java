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
import com.refrigerator.ingre.model.vo.SubIngre;
import com.refrigerator.ingre_search.model.vo.IngreSearch;
import com.refrigerator.recipe.model.vo.Recipe;
import com.refrigerator.recipe.model.vo.Reply;
import com.refrigerator.recipe.model.vo.Review;
import com.refrigerator.reicpe_order.model.vo.RecipeOrder;


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
	
	/** 메인 레시피 조회수별 리스트
	 * @author daeun
	 */
	public ArrayList<Recipe> selectMainSortViewList(Connection conn, PageInfo pi){
		// select => Rset
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainSortViewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이징 (레시피 갯수에 따라 끝페이지, 마지막페이지 구하기)
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery(); 
			
			while(rset.next()) {
				list.add(new Recipe(rset.getInt("recipe_no"),
									rset.getString("recipe_title"),
									rset.getString("nickname"),
									rset.getInt("count"),
									rset.getString("recipe_enroll_date"),
									rset.getString("main_img")));
			}
			
			System.out.println(list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	

	/**
	 * 
	 * 레시피 상세 페이지 조회
	 * @author seong
	 * @date 6/3
	 */
	
	public Recipe selectRecipeDetailList(Connection conn, int recipeNo){
		
		Recipe rc = new Recipe();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRecipeDetailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			// 한행만 조회되기 때문에 if문으로 처리
			if(rset.next()) {
				
				rc = new Recipe(
						
						rset.getInt("RECIPE_NO")
						,rset.getString("USER_ID")
						,rset.getString("RECIPE_TITLE")
						,rset.getString("RECIPE_INTRO")
						,rset.getInt("SEVERAL_SERVINGS")
						,rset.getInt("COOKING_TIME")
						,rset.getDouble("AVRG_STAR_POINT")
						,rset.getInt("COUNT")
						,rset.getInt("SCRAP_COUNT")
						,rset.getString("RECIPE_ENROLL_DATE")
						,rset.getString("MAIN_IMG")
						,rset.getString("INGRE_IMG")
						
						);
				
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return rc;

		
	}
	
	/**
	 * 레시피 상세 페이지에서 요리 순서 조회하기
	 * @author seong
	 * @date 6/3
	 * @return
	 */
	
	public ArrayList<RecipeOrder>selectRecipeOrder(Connection conn, int recipeNo){
		
		
		// 여러행 조회
		
		ArrayList <RecipeOrder> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRecipeOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			// 조회되는 값들이 여러행이기 때문에
			while(rset.next()) {
				
				list.add(new RecipeOrder(
						
						rset.getInt("RECIPE_ORDER")
						,rset.getString("RECIPE_EXPLN")
						,rset.getString("RECIPE_IMG")
						
						
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
	 * @author leeyeji
	 * 레시피 최근순 조회
	 */
	public ArrayList<Recipe> selectLatestRecipeList(Connection conn, PageInfo pi) {
		// select => Result 여러행
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLatestRecipeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Recipe(rset.getInt("recipe_no"),
								    rset.getString("nickname"),
								    rset.getString("recipe_title"),
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
	
	/**
	 * @author leeyeji
	 * 레시피 별점순 조회
	 */
	public ArrayList<Recipe> selectStarRecipeList(Connection conn, PageInfo pi){
		// select => ResultSet 여러행
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStarRecipeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Recipe(rset.getInt("recipe_no"),
								    rset.getString("nickname"),
								    rset.getString("recipe_title"),
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
	

	/**
	 * 레시피 상세조회 클릭시 해당 레시피에 조회수 증가
	 * @author seong
	 * @date 6/4
	 */
	
	public int increaseCount(Connection conn, int recipeNo) {
		// update문 => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * 레시피 상세보기 페이지 [필수 재료 조회]
	 * @author seong
	 * @date 6/4
	 */
	
	public ArrayList<Ingre>selectMainIngreList(Connection conn, int recipeNo){
		
		ArrayList<Ingre> ingre = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainIngreList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ingre.add(new Ingre(
						
						rset.getInt("INGRE_NO")
						,rset.getInt("RECIPE_NO")
						,rset.getString("INGREDIENT_NAME")
						,rset.getInt("INGRE_AMOUNT")
						,rset.getString("INGRE_UNIT")
						
						));
				
				
				
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
			
		}
		return ingre;
		
	}
	
	/**
	 * 레시피 상세보기 페이지 [부가 재료 조회]
	 * @author seong
	 * @date 6/4
	 */
	
	public ArrayList<SubIngre>selectSubIngreList(Connection conn,int recipeNo){
		
		ArrayList<SubIngre> subIngre = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSubIngreList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				subIngre.add(new SubIngre(
						
						rset.getInt("INGRE_NO")
						,rset.getInt("RECIPE_NO")
						,rset.getString("INGREDIENT_NAME")
						,rset.getInt("INGRE_AMOUNT")
						,rset.getString("INGRE_UNIT")
						
						
						));
			
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			
			close(rset);
			close(pstmt);
			
		}
		

		return subIngre;
		
	}
	
	/**
	 * 레시피 상세 보기 페이지의 재료 검색 버튼 
	 * @author seong
	 * @date 6/5 
	 */
	
	
	public ArrayList<IngreSearch>selectIngreSearchList(Connection conn, int recipeNo){
		
		
		ArrayList<IngreSearch> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectIngreSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new IngreSearch(
						
					
						rset.getInt("INGREDIENT_SEARCH")
						,rset.getInt("RECIPE_NO")
						,rset.getString("CATEGORY_NAME")
						,rset.getString("INGREDIENT_NAME")
						
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
	 * @author leeyeji
	 * 특정 유저 레시피 목록 조회
	 */
	public ArrayList<Recipe> selectUserRecipeList(Connection conn, PageInfo pi, int recipeNo){
		// select => ResultSet 여러행
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserRecipeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, recipeNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Recipe(rset.getInt("recipe_no"),
								    rset.getString("recipe_title"),
								    rset.getDouble("avrg_star_point"),
								    rset.getInt("count"),
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
