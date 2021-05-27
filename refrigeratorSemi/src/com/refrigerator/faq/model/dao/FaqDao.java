package com.refrigerator.faq.model.dao;

import static com.refrigerator.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.faq.model.vo.Faq;
import com.refrigerator.notice.model.dao.NoticeDao;

public class FaqDao {
	
	private Properties prop = new Properties();
		
	public FaqDao() {
			
		try {
			prop.loadFromXML(new FileInputStream(FaqDao.class.getResource("/sql/notice/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	
	/**
	 * FAQ 전체 목록 조회
	 * @author leeyeji
	 */
	
	public ArrayList<Faq> selectFaqList(Connection conn){
		// ArrayList => ResultSet 여러행
		ArrayList<Faq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaqList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Faq(rset.getInt("faq_no"),
								 rset.getString("ques_content"),
								 rset.getString("answer_content"),
								 rset.getDate("enroll_date"),
								 rset.getDate("modify_date"),
								 rset.getInt("count")
								 ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
