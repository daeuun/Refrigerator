package com.refrigerator.faq.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.faq.model.dao.FaqDao;
import com.refrigerator.faq.model.vo.Faq;

public class FaqService {
	
	/**
	 * FAQ 전체 목록 조회
	 * @author leeyeji
	 */
	
	public ArrayList<Faq> selectFaqList(){
		Connection conn = getConnection();
		ArrayList<Faq> list = new FaqDao().selectFaqList(conn);
		close(conn);
		return list;
	}
}
