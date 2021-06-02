package com.refrigerator.report.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.report.model.dao.ReportDao;
import com.refrigerator.report.model.vo.Report;


public class ReportService {
	
	/**
	 * @author leeyeji
	 * 페이징 - 총 페이지 수
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new ReportDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * @author leeyeji
	 * 신고 전체 목록 조회
	 */
	public ArrayList<Report> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Report> list = new ReportDao().selectList(conn, pi);
		close(conn);
		return list;
	}
}
