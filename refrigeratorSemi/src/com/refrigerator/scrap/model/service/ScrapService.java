package com.refrigerator.scrap.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.scrap.model.dao.ScrapDao;
import com.refrigerator.scrap.model.vo.Scrap;

public class ScrapService {
//------------------------------------------------------------------------------------------------
	public ArrayList<Scrap> selectList(int loginUserNo){
		// 넘겨받은 로그인 한 유저의 회원번호를 doa에 넘기고 받아와오는 메소드  
		Connection conn = getConnection();
		ArrayList<Scrap> list = new ScrapDao().selectList(conn, loginUserNo);
		close(conn);
		return list;	
	}
//-----------------------------------------------------------------------------------------------
	public int deleteScrap(int userNo, int recipeNo){
		Connection conn = getConnection();
		int result = new ScrapDao().deleteScrap(conn, userNo, recipeNo);
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
	 * 유저 레시피 스크랩 insert
	 */
	public int insertScrap(int recipeNo, String userId) {
		Connection conn = getConnection();
		int result = new ScrapDao().insertScrap(conn, recipeNo, userId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;	
	}
	
	
	
	
}
