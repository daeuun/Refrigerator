package com.refrigerator.review.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.review.model.dao.ReviewDao;
import com.refrigerator.review.model.vo.AdmReview;

public class ReviewService {

	
	
	/***
	 * 등록된 요리 후기 전체 갯수 조회
	 * @author seong
	 * @Date 5/30
	 */
	
	public int selectReviewListCount() {
		
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectReviewListCount(conn);
		
		close(conn);
		
		return listCount;
		
		
	}
	
	
	
	/***
	 * 회원이 작성한 요리 후기 전체 조회 
	 * @author seong
	 * @Date 5/30
	 */
	
	public ArrayList<AdmReview> adminSelectReviewList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<AdmReview> list = new ReviewDao().adminSelectReviewList(conn,pi);
		
		close(conn);
		
		return list;
		
		
	}
	
	/**
	 * 관리자가 선택한 요리 후기 삭제
	 * @author seong
	 * @Date 5/30
	 */
	
	public int deleteReview(int reviewNo) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteReview(conn,reviewNo);
		
		close(conn);
		
		return result;
		
		
	}
	
	
}
