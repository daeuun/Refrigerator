package com.refrigerator.report.model.dao;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.report.model.vo.Report;

public class ReportDao {
	
	Properties prop = new Properties();
		
	public ReportDao() {
			
		try {
			prop.loadFromXML(new FileInputStream(ReportDao.class.getResource("/sql/report/report-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	
	/**
	 * @author leeyeji
	 * 페이징 - 총 페이지 수
	 */
	public int selectListCount(Connection conn) {
		// select => ResultSet 한행
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	/**
	 * @author leeyeji
	 * 신고 전체 목록 조회
	 */
	public ArrayList<Report> selectList(Connection conn, PageInfo pi){
		// select => ResultSet 여러행
		ArrayList<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
	}
	
	
	
	

}
