package com.refrigerator.scrap.model.dao;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.scrap.model.vo.Scrap;
import com.refrigerator.tos.model.vo.Tos;

public class ScrapDao {
	// 실행되는 sql문을 실행할 xml파일을 등록을 해주자! 
	private Properties prop = new Properties();
	// 전역변수로 쓰기위해서 텅비어있는 Properties객체를 생성한것이다. 
	
	public ScrapDao() {
		//prop.loadFromXML(new FileInputStream( 읽어들이고자하는 물리적인 경로));
		// 동기화 되어있는 경로를 제시해야한다. (드라이브에서의 물리적인 경로를 알아올수있다것이다.) .getPath메소드는 필수 ! 
		try {
			prop.loadFromXML(new FileInputStream( ScrapDao.class.getResource("/sql/scrap/scrap-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		//dao쪽 세팅 끝났다. 
	}
//------------------------------------------------------------------------------------------------------------
	public ArrayList<Scrap> selectList(Connection conn,int loginUserNo){
		// 넘겨받은 페이지정보 객체를 doa에 활용하여 일부의 list를 뽑아오는 메소드 그후 반환
		//select문 => resultSet (여러행)
		ArrayList<Scrap> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUserNo);
			rset = pstmt.executeQuery();

			//☆ 다만 boardLimit의 갯수보다 적게 셈플데이터가 있을시에 담겨있는 객체의 수는 자동적으로 해당 행만큼만 가져온다.
			// banner 셈플데이터 쪽에서는 일단 6개의 행만이 rset에 담겨있는것이다. 
			while(rset.next()) {
				list.add(new Scrap(rset.getInt("RECIPE_NO"),
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
//-------------------------------------------------------------------------------------------------------	
	public int deleteScrap(Connection conn, int userNo, int recipeNo) {
		// delete문 => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteScrap");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
