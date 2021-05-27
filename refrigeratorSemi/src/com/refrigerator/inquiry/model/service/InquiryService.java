package com.refrigerator.inquiry.model.service;

import static com.refrigerator.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.inquiry.model.dao.InquiryDao;
import com.refrigerator.inquiry.model.vo.Inquiry;

/**
 * @author Heerak 05.27
 *
 */
public class InquiryService {

	/**
	 * 윤희락 [문의/답변] [미해결 문의]글 수 Count
	 * @return
	 */
	public int selectUnsolvedListCount() {
		Connection conn = getConnection();
		int unSolvedListCount = new InquiryDao().selectUnsolvedListCount(conn);
		close(conn);
		return unSolvedListCount;
	}
	
	/**
	 * 윤희락 [문의/답변] [해결 문의]글 수 Count
	 * @return
	 */
	public int selectSolvedListCount() {
		Connection conn = getConnection();
		int solvedListCount = new InquiryDao().selectSolvedListCount(conn);
		close(conn);
		return solvedListCount;
	}

	/**
	 * HeeRak [문의/답변] 미해결 문의 list 전체조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Inquiry> selectUnSolvedList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Inquiry> unSolvedList = new InquiryDao().selectUnSolvedList(conn, pi);
		close(conn);
		return unSolvedList;
	}

	/**
	 * HeeRak [문의/답변] 해결 문의 list 전체조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Inquiry> selectSolvedList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Inquiry> solvedList = new InquiryDao().selectSolvedList(conn, pi);
		close(conn);
		return solvedList;
	}

	
	
	
}
