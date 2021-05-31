package com.refrigerator.member.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.member.model.dao.MemberDao;
import com.refrigerator.member.model.vo.Member;

public class MemberService {
	

	
	
	/** 회원가입폼
	 * @param m 회원가입 폼에 작성한 사용자가 입력한 값들을 담아놓은 Member객체
	 * @return 처리된 행수
	 */
	
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	/** 로그인 요청
	 * @param userId 사용자가 입력한 아이디값
	 * @param userPwd 사용자가 입력한 비밀번호값
	 * @return 
	 */
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		return m;
	}
	
	/**
	 * @author leeyeji
	 * 페이징 - 총 페이지 수 
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new MemberDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * @author leeyeji
	 * 멤버 전체 목록 조회  
	 */
	public ArrayList<Member> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		close(conn);
		return list;
	}


	/**
	 * @author HeeRak
	 * 멤버 프로필 조회
	 */
	public Member selectProfile(int userNo) {
		Connection conn = getConnection();
		Member m = new MemberDao().selectProfile(conn, userNo);
		close(conn);
		return m;
	}


	/**
	 * @author HeeRak
	 * 멤버 프로필 수정
	 */
	public int updateProfile(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateProfile(conn, m);
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	

}
