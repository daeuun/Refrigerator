package com.refrigerator.reicpe_order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.reicpe_order.model.vo.RecipeOrder;
import static com.refrigerator.common.JDBCTemplate.close;

/**
 * @author HeeRak
 */
public class RecipeOrderDao {

	Properties prop = new Properties();
	
	public RecipeOrderDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(RecipeOrderDao.class.getResource("/sql/recipe_order-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 레시피등록페이지에 입력된 요리순서 insert 요청처리
	 * @author HeeRak
	 */
	public int insertRecipeOrderList(Connection conn, ArrayList<RecipeOrder> ordList) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRecipeOrderList");
		String sql2 = prop.getProperty("insertNoImgRecipeOrderList");
		
		try {
			
			for(int i=0; i<ordList.size(); i++) {
				
				if(ordList.get(i).getRecipeImg()!= null) {// 이미지 있는 경우
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, ordList.get(i).getRecipeOrder());
					pstmt.setString(2, ordList.get(i).getRecipeExpln());
					pstmt.setString(3, ordList.get(i).getRecipeImg());
					
					result = result * pstmt.executeUpdate();
					
				}else {// 이미지 없는경우
					
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, ordList.get(i).getRecipeOrder());
					pstmt.setString(2, ordList.get(i).getRecipeExpln());
					
					result = result * pstmt.executeUpdate();
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
