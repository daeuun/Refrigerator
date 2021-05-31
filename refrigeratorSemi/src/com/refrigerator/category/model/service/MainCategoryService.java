package com.refrigerator.category.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.category.model.dao.MainCategoryDao;
import com.refrigerator.category.model.vo.MainCategory;
import com.refrigerator.tos.model.dao.TosDao;

public class MainCategoryService {
	public ArrayList<MainCategory> selectMainList(){
		Connection conn = getConnection();
		//	변수명칭은 list로 받아줘도 문제 없다 	
		ArrayList<MainCategory> list = new MainCategoryDao().selectMainList(conn);
		close(conn);
		return list;	
		
	} 
//-----------------------------------------------------------------------------------	
	public int insertMainCategory(String mainCatName){
		Connection conn = getConnection();
		
		int result = new MainCategoryDao().insertMainCategory(conn, mainCatName);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;		
	}
	
	
}
