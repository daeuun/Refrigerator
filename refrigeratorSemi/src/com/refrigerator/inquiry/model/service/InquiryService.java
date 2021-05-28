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

	/**
	 * HeeRak 미해결문의 번호 받아 해당문의 내용 조회
	 * @param inqNo
	 * @return
	 */
	public Inquiry selectUnSolvedInquiry(int inqNo) {
		Connection conn = getConnection();
		Inquiry inq = new InquiryDao().selectUnSolvedInquiry(conn, inqNo);
		close(conn);
		return inq;
	}

	/**
	 * HeeRak 해결문의 번호 받아 해당문의 내용 조회
	 * @param inqNo
	 * @return
	 */
	public Inquiry selectSolvedInquiry(int inqNo) {
		Connection conn = getConnection();
		Inquiry inq = new InquiryDao().selectSolvedInquiry(conn, inqNo);
		close(conn);
		return inq;
	}

	/**
	 * HeeRak [미해결|해결] 답변내용 update => commit/rollback
	 * @param inqryNo
	 * @param inqryContent
	 * @return
	 */
	public int updateInquiryAnswer(Inquiry inq) {
		Connection conn = getConnection();
		int result = new InquiryDao().updateInquiryAnswer(conn, inq);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	
	
	
}
