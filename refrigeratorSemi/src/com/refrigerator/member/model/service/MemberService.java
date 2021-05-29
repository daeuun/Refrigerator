package com.refrigerator.member.model.service;

import java.sql.Connection;

import static com.refrigerator.common.JDBCTemplate.*;
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

}
