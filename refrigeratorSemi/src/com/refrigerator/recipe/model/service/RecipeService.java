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
	 * 레시피 상세 페이지의 댓글 전체 목록 조회 리스트 
	 * @author seong
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
	 * 레시피 후기 작성 기능
	 * @author seong
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
	
		
	
}
