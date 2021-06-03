package com.refrigerator.follow.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.follow.model.dao.FollowDao;
import com.refrigerator.follow.model.vo.Follow;
import static com.refrigerator.common.JDBCTemplate.*;

public class FollowService {

	/**
	 * 마이페이지 - 로그인한 유저의 번호 => 팔로우한 유저 정보조회 요청처리
	 * @author HeeRak
	 */
	public ArrayList<Follow> selectFollowList(int userNo) {
		Connection conn = getConnection();
		ArrayList<Follow> list = new FollowDao().selectFollowList(conn, userNo);
		close(conn);
		return list;
	}

}
