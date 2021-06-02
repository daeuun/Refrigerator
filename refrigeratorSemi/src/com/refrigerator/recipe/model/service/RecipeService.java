package com.refrigerator.recipe.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.recipe.model.dao.RecipeDao;
import com.refrigerator.recipe.model.vo.Reply;
import com.refrigerator.recipe.model.vo.Review;

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
		
		System.out.println(rv);
		
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
	
	

	
}
