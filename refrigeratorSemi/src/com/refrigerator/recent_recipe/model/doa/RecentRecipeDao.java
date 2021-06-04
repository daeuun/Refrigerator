package com.refrigerator.recent_recipe.model.doa;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.recent_recipe.model.vo.RecentRecipe;
import com.refrigerator.scrap.model.vo.Scrap;

public class RecentRecipeDao {
	// 실행되는 sql문을 실행할 xml파일을 등록을 해주자! 
	private Properties prop = new Properties();
	// 전역변수로 쓰기위해서 텅비어있는 Properties객체를 생성한것이다. 
	
	public RecentRecipeDao() {
		//prop.loadFromXML(new FileInputStream( 읽어들이고자하는 물리적인 경로));
		// 동기화 되어있는 경로를 제시해야한다. (드라이브에서의 물리적인 경로를 알아올수있다것이다.) .getPath메소드는 필수 ! 
		try {
			prop.loadFromXML(new FileInputStream(RecentRecipeDao.class.getResource("/sql/recent_recipe/recent_recipe-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		//dao쪽 세팅 끝났다. 
	}
//-----------------------------------------------------------------------------------
	public ArrayList<RecentRecipe> selectList(Connection conn, String[] recentRecipeNo){
		// 넘겨받은 페이지정보 객체를 doa에 활용하여 일부의 list를 뽑아오는 메소드 그후 반환
		//select문 => resultSet (여러행)
		ArrayList<RecentRecipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(recentRecipeNo[0]));
			pstmt.setInt(2, Integer.parseInt(recentRecipeNo[1]));
			pstmt.setInt(3, Integer.parseInt(recentRecipeNo[2]));
			pstmt.setInt(4, Integer.parseInt(recentRecipeNo[3]));
			pstmt.setInt(5, Integer.parseInt(recentRecipeNo[4]));
			pstmt.setInt(6, Integer.parseInt(recentRecipeNo[5]));
			pstmt.setInt(7, Integer.parseInt(recentRecipeNo[0]));
			pstmt.setInt(8, Integer.parseInt(recentRecipeNo[1]));
			pstmt.setInt(9, Integer.parseInt(recentRecipeNo[2]));
			pstmt.setInt(10, Integer.parseInt(recentRecipeNo[3]));
			pstmt.setInt(11, Integer.parseInt(recentRecipeNo[4]));
			pstmt.setInt(12, Integer.parseInt(recentRecipeNo[5]));

			rset = pstmt.executeQuery();

			// 무조건 6행
			while(rset.next()) {
				list.add(new RecentRecipe(rset.getInt("RECIPE_NO"),
										  rset.getString("RECIPE_TITLE"),
										  rset.getInt("COOKING_TIME"),
										  rset.getInt("LIKE_COUNT"),
										  rset.getString("MAIN_IMG"),
										  rset.getString("NICKNAME"),
										  rset.getString("PROFILE_IMG"),
										  rset.getDouble("AVRG_STAR_POINT")));
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
