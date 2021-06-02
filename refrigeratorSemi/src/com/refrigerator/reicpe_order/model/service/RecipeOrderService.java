package com.refrigerator.reicpe_order.model.service;

import static com.refrigerator.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.reicpe_order.model.dao.RecipeOrderDao;
import com.refrigerator.reicpe_order.model.vo.RecipeOrder;
/**
 * @author HeeRak
 */
public class RecipeOrderService {

	/**
	 * 레시피등록페이지에 입력된 요리순서 insert 요청처리
	 * @author HeeRak
	 */
	public int insertRecipeOrderList(ArrayList<RecipeOrder> ordList) {
		Connection conn = getConnection();
		int result = new RecipeOrderDao().insertRecipeOrderList(conn, ordList);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
}
