package com.refrigerator.reply.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.reply.model.dao.ReplyDao;
import com.refrigerator.reply.model.vo.AdmReply;

public class ReplyService {

	
	/**
	 * 전체 댓글 갯수  조회
	 * @author seong
	 * @Date 05/29
	 * @return
	 */
		
	public int selectReplyListCount() {
		
		Connection conn = getConnection();
		int listCount = new ReplyDao().selectReplyListCount(conn);
		
		close(conn);
	
		return listCount;
	}
		
	
	/**
	 * 
	 * 관리자단에서 신고된 댓글 전체 조회 
	 * @author seong
	 * @Date 5/29
	 *
	 */
		
		public ArrayList<AdmReply> adminSelectReplyList(PageInfo pi){
			
			
			Connection conn = getConnection();
			
			ArrayList<AdmReply> list = new ReplyDao().adminSelectReplyList(conn,pi);
			
			close(conn);
			
			return list;
			
		}	
		
	/**
	 * 
	 * 관리자단에서 신고된 댓글 삭제
	 * @author seong
	 * @Date 5/29
	 *
	 */
		
		public int adminDeleteReply(int replyNo) {
			
			Connection conn = getConnection();
			
			int result = new ReplyDao().adminDeleteReply(conn,replyNo);
			
			if(result>0) {
				
				commit(conn);
				
			} else {
				
				rollback(conn);
				
			}
			
			 close(conn);
			 
			return result;
			
		}
		
	
	
}
