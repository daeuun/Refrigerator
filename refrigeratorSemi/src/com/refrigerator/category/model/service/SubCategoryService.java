package com.refrigerator.category.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.category.model.dao.MainCategoryDao;
import com.refrigerator.category.model.dao.SubCategoryDao;
import com.refrigerator.category.model.vo.SubCategory;

public class SubCategoryService {

	public ArrayList<SubCategory> selectSubList(){
		Connection conn = getConnection();
		//	변수명칭은 list로 받아줘도 문제 없다 	
		ArrayList<SubCategory> list = new SubCategoryDao().selectSubList(conn);
		close(conn);
		return list;	
		
	} 
//-----------------------------------------------------------------------------------	
	public int insertSubCategory(SubCategory sc){
		Connection conn = getConnection();
		
		int result = new SubCategoryDao().insertSubCategory(conn, sc);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;		
	}
	
	/**
	 * Main카테고리 번호 받아서 해당 sub카테고리list 조회요청처리
	 * @author HeeRak
	 */
	public ArrayList<SubCategory> selectSubListByMainCategory(int mcNo) {
		Connection conn = getConnection();
		ArrayList<SubCategory> list = new SubCategoryDao().selectSubListByMainCategory(conn, mcNo);
		close(conn);
		return list;
	}
			
	
}
