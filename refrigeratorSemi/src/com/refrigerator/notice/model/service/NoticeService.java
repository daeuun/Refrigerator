package com.refrigerator.notice.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.notice.model.dao.NoticeDao;
import com.refrigerator.notice.model.vo.Notice;

public class NoticeService {
	
	/**
	 * 공지사항 전체 목록 조회
	 * @author yeji
	 */
	
	public ArrayList<Notice> selectNoticeList(){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		close(conn);
		return list;
	}
	
	/**
	 * 공지사항 클릭시 조회수 증가
	 * @author yeji
	 */
	
	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	/**
	 * 공지사항 한 개 조회
	 * @author yeji
	 */
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;
	}

}
