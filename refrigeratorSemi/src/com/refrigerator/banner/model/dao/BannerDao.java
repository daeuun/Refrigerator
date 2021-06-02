package com.refrigerator.banner.model.dao;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.common.model.vo.PageInfo;

public class BannerDao {
	// 실행되는 sql문을 실행할 xml파일을 등록을 해주자! 
	private Properties prop = new Properties();
	// 전역변수로 쓰기위해서 텅비어있는 Properties객체를 생성한것이다. 
	
	public BannerDao() {
		//prop.loadFromXML(new FileInputStream( 읽어들이고자하는 물리적인 경로));
		// 동기화 되어있는 경로를 제시해야한다. (드라이브에서의 물리적인 경로를 알아올수있다것이다.) .getPath메소드는 필수 ! 
		try {
			prop.loadFromXML(new FileInputStream( BannerDao.class.getResource("/sql/banner/banner-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		//dao쪽 세팅 끝났다. 
	}
//---------------------------------------------------------------------------------------------------------------------------
	public int selectListCount(Connection conn) {
		//※ 페이징 처리를 위한 전체 게시슬 갯수를 가져오는 메소드
		// select문 => ResultSet객체 (한행 count만 담겨있을것이다.)
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		// 이제 받아주는 컬럼은 !!! SQLDEVELOPER상에서 조회시 나오는  컬럼명으로 받아줘야한다.
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			// 한행한열짜리가 지금 rset에 담겨있다 그래도 무조건 커서는 한번 움직여줘야한다.
			
			//한행이기에 조건문을 단것이다.
			if(rset.next()) {
				listCount = rset.getInt("count");
				// sql상에서 별칭을 부여했기에 컬럼명을 별칭으로 써주면 된다.
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	
//---------------------------------------------------------------------------------------------------------------------------
	public ArrayList<Banner> selectList(Connection conn,PageInfo pi){
		// 넘겨받은 페이지정보 객체를 doa에 활용하여 일부의 list를 뽑아오는 메소드 그후 반환
		//select문 => resultSet (여러행)
		ArrayList<Banner> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			// 가져올 rset에서의 첫행에 테이블기준으로 몇번째 행을 가져올것인지 정하는 숫자 
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			// 첫행에서 BoardLimit(6)개에서 -1 한 행까지 가져오겠다는것
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);// 0~5 0행에서 ~5행까지 총 6개 가져오겠다는것이다.
			pstmt.setInt(2, endRow);
			
			// 이미 sql문에서 정렬까지 끝난것을 가상의 테이블에 정렬을 해놓은 상태로 RNUM을 바탕으로 between 사용하여 
			// 6개정도의 행을 가져오는것을 선정함  (서브쿼리 사용하겠다는것임 !) 
			rset = pstmt.executeQuery();

			//☆ 다만 boardLimit의 갯수보다 적게 셈플데이터가 있을시에 담겨있는 객체의 수는 자동적으로 해당 행만큼만 가져온다.
			// banner 셈플데이터 쪽에서는 일단 6개의 행만이 rset에 담겨있는것이다. 
			while(rset.next()) {
				list.add(new Banner(rset.getInt("banner_no"),
             					    rset.getString("banner_name"),
             					    rset.getString("company_name"),
             					    rset.getString("banner_category"),
             					    rset.getString("banner_status"),
             					    rset.getDate("enroll_date"),
             					    rset.getDate("modify_date"),
             					    rset.getString("start_date"),
             					    rset.getString("end_date"),
             					    rset.getString("banner_img"),
             					    rset.getString("page")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return list;
	}

}
