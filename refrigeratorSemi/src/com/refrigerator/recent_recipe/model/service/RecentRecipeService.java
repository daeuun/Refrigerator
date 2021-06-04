package com.refrigerator.recent_recipe.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.recent_recipe.model.doa.RecentRecipeDao;
import com.refrigerator.recent_recipe.model.vo.RecentRecipe;

public class RecentRecipeService {
	//------------------------------------------------------------------------------------------------
		public ArrayList<RecentRecipe> selectList(String[] recentRecipeNo ){
			// 넘겨받은 로그인 한 유저의 회원번호를 doa에 넘기고 받아와오는 메소드  
			Connection conn = getConnection();
			ArrayList<RecentRecipe> list = new RecentRecipeDao().selectList(conn, recentRecipeNo);
			close(conn);
			return list;	
		}
}
