package com.refrigerator.banner.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.banner.model.dao.BannerDao;
import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.common.model.vo.PageInfo;


public class BannerService {
//------------------------------------------------------------------------------------------------
	public int selectListCount() {
		//※ 페이징 처리를 위한 전체 게시슬 갯수를 가져오는 메소드
		
		Connection conn = getConnection();
		int listCount = new BannerDao().selectListCount(conn);
		// 트랜젝션 처리할 필요없음 총개시글 조회만 해오는것이니! 
		
		close(conn);
		return listCount; 
	}
//------------------------------------------------------------------------------------------------
	public ArrayList<Banner> selectList(PageInfo pi){
		// 넘겨받은 페이지정보 객체를 doa에 넘기고 받아와오는 메소드  
		Connection conn = getConnection();
		ArrayList<Banner> list = new BannerDao().selectList(conn , pi);
		close(conn);
		return list;	
	}

//------------------------------------------------------------------------------------------------

}
