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

import com.refrigerator.category.model.vo.MainCategory;
import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.tos.model.vo.Tos;

public class MainCategoryDao {

	// 실행되는 sql문을 실행할 xml파일을 등록을 해주자! 
	private Properties prop = new Properties();
	// 전역변수로 쓰기위해서 텅비어있는 Properties객체를 생성한것이다. 
	
	public MainCategoryDao() {
		//prop.loadFromXML(new FileInputStream( 읽어들이고자하는 물리적인 경로));
		// 동기화 되어있는 경로를 제시해야한다. (드라이브에서의 물리적인 경로를 알아올수있다것이다.) .getPath메소드는 필수 ! 
		try {
			prop.loadFromXML(new FileInputStream( MainCategoryDao.class.getResource("/sql/main_category/main_category-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		//dao쪽 세팅 끝났다. 
	}
//-----------------------------------------------------------------------------------
	public ArrayList<MainCategory> selectMainList(Connection conn){
		//select문 => resultSet (여러행)
		ArrayList<MainCategory> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new MainCategory(rset.getInt("category_mno"),
             					 rset.getString("category_name")));
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
	public int insertMainCategory(Connection conn, String mainCatName) {
		// insert문 => 처리된 행수 
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMainCategory");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mainCatName); // 메일 카테고리 명 						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
}
