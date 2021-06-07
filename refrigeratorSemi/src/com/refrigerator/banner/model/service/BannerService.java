package com.refrigerator.banner.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.banner.model.dao.BannerDao;
import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.tos.model.dao.TosDao;


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
	public int insertBanner(Banner ba) {
		Connection conn = getConnection();
		
		int result = new BannerDao().insertBanner(conn, ba);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;		
	}
//-------------------------------------------------------------------------------------------------	
	public int deleteBanner(int bannerNo) {
		Connection conn = getConnection();
		
		int result = new BannerDao().deleteBanner(conn, bannerNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;		
	}
//------------------------------------------------------------------------------------------------
	//한행 조회랑 삭제에서 활용
	public Banner selectBanner(int bannerNo) {
		Connection conn = getConnection();
		Banner selectedBanner = new BannerDao().selectBanner(conn, bannerNo);
		close(conn);
		return selectedBanner;	

	}
//------------------------------------------------------------------------------------------------	
	public int updateBanner(Banner ba) {
		Connection conn = getConnection();
		
		int result = new BannerDao().updateBanner(conn, ba);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;		
	}
	
	
	
	/** 배너 관리자페이지 : 메인 레시피 리스트 조회
	 * @author daeun
	 */
	public ArrayList<Banner> selectBannerRecipeList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Banner> list = new BannerDao().selectBannerRecipeList(conn, pi);
		close(conn);
		return list;
	}
	
	
	/** 배너 관리자페이지 : 메인 레시피 등록
	 * @author daeun
	 */
	public int insertBannerRecipe(Banner ba) {
		Connection conn = getConnection();
		int result = new BannerDao().insertBannerRecipe(conn, ba);
		close(conn);
		return result;
	}
	
	/** 배너 관리자페이지 : 메인 레시피 수정
	 * @author daeun
	 */
	public int updateBannerRecipe(Banner ba) {
		Connection conn = getConnection();
		int result = new BannerDao().updateBannerRecipe(conn, ba);
		close(conn);
		return result;
	}
	
	/** 배너 관리자페이지 : 메인 레시피 삭제
	 * @author daeun
	 */
	public int deleteBannerRecipe(int bannerNo) {
		Connection conn = getConnection();
		int result = new BannerDao().deleteBannerRecipe(conn, bannerNo);
		close(conn);
		return result;
	}
}
