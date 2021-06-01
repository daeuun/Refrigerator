package com.refrigerator.nav_menu.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.nav_menu.model.dao.NavMenuDao;
import com.refrigerator.nav_menu.model.vo.NavMenu;

public class NavMenuService {
	public ArrayList<NavMenu> seletNavMenuList() {
		Connection conn = getConnection();
		ArrayList<NavMenu> list = new NavMenuDao().seletNavMenuList(conn);
		// 트랜젝션 처리할 필요없음 총개시글 조회만 해오는것이니! 
		
		close(conn);
		return list; 
	}
}
