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
		
		return result;
	}

}
