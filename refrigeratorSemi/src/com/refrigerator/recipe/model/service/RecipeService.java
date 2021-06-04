package com.refrigerator.recipe.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.ingre.model.vo.Ingre;
import com.refrigerator.ingre_search.model.vo.IngreSearch;
import com.refrigerator.recipe.model.dao.RecipeDao;
import com.refrigerator.recipe.model.vo.Recipe;
import com.refrigerator.recipe.model.vo.Reply;
import com.refrigerator.recipe.model.vo.Review;
import com.refrigerator.reicpe_order.model.vo.RecipeOrder;

public class RecipeService {

	/** 
	 * @author  daeun / seong 
	 */
	
	
	/**
	 * 레시피 상세 페이지의 댓글 전체 목록 조회 리스트 
	 * @author seong
	 * @date 0528
	 * @return
	 */
	
	public ArrayList<Reply> selectReplyList(int recipeNo){
		
		Connection conn = getConnection();
		
		// 조회문 => 여러 행 조회 
		
		ArrayList<Reply> list = new RecipeDao().selectReplyList(conn,recipeNo);
		
		close(conn);
		
		return list;
		
		
	}
	
	/**
	 * 레시피 상세 페이지 댓글 작성 기능 
	 * @author seong
	 * @date 0528
	 */
	
	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		int result = new RecipeDao().insertReply(conn, r);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/**
	 * 레시피 전체 목록 조회 리스트
	 * @author seong
	 * @date  0528
	 */
	
	public ArrayList<Review> selectReviewList(int recipeNo){
		
		
		Connection conn = getConnection();
		ArrayList<Review> list = new RecipeDao().selectReviewList(conn,recipeNo);
		
		close(conn);
		return list;
		
		
	}
	
	
	/**
	 * 레시피 후기 작성 기능
	 * @author seong
	 * @date 0528
	 */
	
	public int insertReview(Review rv) {
		
		Connection conn = getConnection();
		
		int result = new RecipeDao().insertReview(conn,rv);
				
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}

	/**
	 * 관리자페이지 - 배너 레시피 조회
	 * @author daeun
	 */
	/*
	public Recipe selectRecipe(int recipeNo) {
		Connection conn = getConnection();
		Recipe rc = new RecipeDao().selectRecipe(conn, recipeNo);
		close(conn);
		return rc;
		
		
	}*/
	
	/**
	 * 레시피등록페이지 - insert요청처리
	 * @author HeeRak
	 */
	public int insertRecipe(Recipe inRecipe, ArrayList<IngreSearch> sbList, ArrayList<Ingre> ingList, ArrayList<Ingre> addList, ArrayList<RecipeOrder> ordList) {
		Connection conn = getConnection();
		int result = new RecipeDao().insertRecipe(conn, inRecipe, sbList, ingList, addList, ordList);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * @author leeyeji
	 * 페이징 - 총 페이지 수
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new RecipeDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * @author leeyeji
	 * 레시피 전체 목록 조회
	 */
	public ArrayList<Recipe> selectRecipeList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectRecipeList(conn, pi);
		
		close(conn);
		return list;
	}
	
	/** 메인 레시피 조회수별 리스트
	 * @author daeun
	 */
	public ArrayList<Recipe> selectMainSortViewList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectMainSortViewList(conn, pi);
		System.out.println(list);
		close(conn);
		return list;
	}
	
	/**
	 * 
	 * 레시피 상세 페이지 조회
	 * @author seong
	 * @date 6/3
	 */
	
	public Recipe selectRecipeDetailList(int recipeNo){
		
		Connection conn = getConnection();
		
		Recipe rc = new RecipeDao().selectRecipeDetailList(conn,recipeNo);
		
		close(conn);
		
		return rc;
		
		
		
	}
	
	/**
	 * 레시피 상세 페이지에서 요리 순서 조회하기
	 * @author seong
	 * @date 6/3
	 * @return
	 */
	
	public ArrayList<RecipeOrder>selectRecipeOrder(int recipeNo){
		
		Connection conn = getConnection();
		
		ArrayList<RecipeOrder> list = new RecipeDao().selectRecipeOrder(conn, recipeNo);
		
		close(conn);
		
		return list;

		
	}

	
}
