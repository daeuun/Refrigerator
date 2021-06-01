package com.refrigerator.category.model.dao;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.category.model.vo.SubCategory;

public class SubCategoryDao {

	// 실행되는 sql문을 실행할 xml파일을 등록을 해주자! 
	private Properties prop = new Properties();
	// 전역변수로 쓰기위해서 텅비어있는 Properties객체를 생성한것이다. 
	
	public SubCategoryDao() {
		//prop.loadFromXML(new FileInputStream( 읽어들이고자하는 물리적인 경로));
		// 동기화 되어있는 경로를 제시해야한다. (드라이브에서의 물리적인 경로를 알아올수있다것이다.) .getPath메소드는 필수 ! 
		try {
			prop.loadFromXML(new FileInputStream( SubCategoryDao.class.getResource("/sql/sub_category/sub_category-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		//dao쪽 세팅 끝났다. 
	}
//-----------------------------------------------------------------------------------
	public ArrayList<SubCategory> selectSubList(Connection conn){
		//select문 => resultSet (여러행)
		ArrayList<SubCategory> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSubList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new SubCategory(rset.getInt("category_sno"),
										 rset.getInt("category_no"),
										 rset.getString("ingredient_name")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return list;
	}
//-----------------------------------------------------------------------------------
	public int insertSubCategory(Connection conn, SubCategory sc) {
		// insert문 => 처리된 행수 
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertSubCategory");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sc.getCategoryMainNo()); // 참조메인카테고리번호
			pstmt.setString(2, sc.getIngredientName()); // 서브카테고리명						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * Main카테고리 번호 받아서 해당 sub카테고리 list DB조회요청처리
	 * @author HeeRak
	 */
	public ArrayList<SubCategory> selectSubListByMainCategory(Connection conn, int mcNo) {
		// select => rset 여러행 조회
		ArrayList<SubCategory> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSubListByMainCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mcNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new SubCategory(rset.getInt("category_sno"),
										 rset.getString("ingredient_name")
										 ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}	
		
	
	
}
