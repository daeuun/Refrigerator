package com.refrigerator.recipe.model.dao;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.recipe.model.vo.Reply;


public class RecipeDao{

	
	private Properties prop = new Properties();
	
	public RecipeDao() {
		try {
			prop.loadFromXML(new FileInputStream(RecipeDao.class.getResource("/sql/recipe/recipe-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 레시피 상세 페이지의 댓글 전체 목록 조회 리스트 
	 * @author seong
	 */
	
	public ArrayList <Reply> selectReplyList(Connection conn, int recipeNo){
		
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("REPLY_NO")
						,rset.getString("NICKNAME")
						,rset.getString("CREATE_DATE")
						,rset.getString("REPLY_CONTENT")
						
						));
			}

			
			System.out.println(list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	/**
	 * 레시피 상세 페이지 댓글 작성 기능 
	 * @author seong
	 */
	
	public int insertReply(Connection conn, Reply r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(r.getReplyWriter()));
			pstmt.setInt(2, r.getRecipeNo());
			pstmt.setString(3, r.getReplyContent());
			
			result = pstmt.executeUpdate();
			
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	
	
}
