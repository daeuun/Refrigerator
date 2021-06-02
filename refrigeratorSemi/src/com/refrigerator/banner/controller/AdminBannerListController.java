package com.refrigerator.banner.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.banner.model.service.BannerService;
import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.tos.model.service.TosService;

/**
 * Servlet implementation class AdminBannerListController
 */
@WebServlet("/adlist.ba")
public class AdminBannerListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// -------------------------------- <페이징 처리> ------------------------------------------
		int listCount;    
		int currentPage; 
		int pageLimit;   
		int boardLimit;  
		int maxPage;     
		int startPage;   
		int endPage;     
		
		// * listCount : 총 게시글 갯수를 sql를 통해서  조회를 해왔다 listCount에는 이제 총게시글 갯수가 들어가있는것이다.)
		listCount = new BannerService().selectListCount(); 
		
		// * currentPage : 현재 페이지 (즉, 사용자가 요청한 페이지)  (화면단에서 클릭시 같이 보낸것을 가져온것)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		// 애초에 sertvlet 호출할때에 쿼리스트링(query String ?)으로 값을넘긴상태이기에 !! 
		// getParameter로 받는것이다. 
		
		// * pageLimit : 하단에 보여질 페이징바의 페이지 최대 갯수 (페이지 목록들 몇 개 단위)
		pageLimit = 10; 
		
		// * boardLimit : 한 페이지내에 보여질 게시글 최대 갯수 (게시글 몇 개 단위)
		boardLimit = 6;
		
		// * maxPage : 제일 마지막 페이지 수 (총 페이지 수)
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수 
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		// int / int 시 ! 소수점은 안나오는것을 활용한것
		
		// * endPage : 페이지 하단에 보여질 페이징바의 끝 수
		endPage = startPage + pageLimit - 1;
		
		// startPage가 11이여서 endPage 20으로 됨 (근데 maxPage가 고작 13페이지 까지밖에 안된다면 ???)
		// 그럼 필요없는 14, ~20 페이지 목록이 보여진다?이래서는 안된다!! 
		// 이때는  endPage를 maxPage로 변경을 해줘야한다.
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		// 지금 구해진 7개의 값을 응답할때 꺼내쓰라고 request에 담아주면 되는데!! 이왕이면 어떤 하나의 공간에 차곡차곡 담으면 어떨까 해서 
		// 페이지 정보들을 하나의 공간에 담아서 보내자!!!! vo 클래스 만들러 가자 ! pageInfo(희락님이 만들어준것 활용) 
		// 1. 페이징바 만들떄 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// ★ 이제 핵심이다 위에서 페이징 처리는 모두 끝냈다 이제 실질적으로 banner 리스트들을 가져오자! 
		// 2. 현재 요청한 페이지 (currentPage)에 보여질 게시글 리스트 조회해오기
		ArrayList<Banner> list = new BannerService().selectList(pi); 
		// 데이터 값이 몇개 담겨있을지 모른다 단 max값은 6개이다! 
		
		// ArrayList를 복사할것인데 얘는 딱히 다시 이를 가지고 DB단을 돌아가서 수정해버리고 이런게 없기에!!! 
		// 얕은 복사를 해줘도된다! 
		// 아래는 변수 세팅 
		ArrayList<Banner> list1 = new ArrayList();
		ArrayList<Banner> list2 = new ArrayList();
		
		if(list.size()<4) {
			// 3개 이하로 잡히면 그떄는 전체 리스트에 접근해줘도 된다. 
			list1= list;			
		}else {
			// 혹여나 데이터의 갯수가 음 .. 4개가 넘고 이게 4개일지 5개일지 6개일지 모를떄는 !! 
			// 일단은 3개가 넘는 다는 소리이다. 이렇게 되면 최소 4개 까지는 있다는 것이다. 
			// 그럼 끝인덱스만을 알아오면 되는데 음 .. 
			// E e = list.get(list.size() - 1);
			for(int i=0; i<3; i++){
				list1.add(list.get(i));
			}
			for(int i=3; i<list.size(); i++) {
				list2.add(list.get(i));
			}
		}
		
		// banner 셈플데이터 기준으로 현재 6개의 행만이 담겨있을것이다. 
		
		// 이제 구한 pi 정보와 list정보를 request의 속성에 담아서 뿌려줄 페이지로 넘기면서 호출해주면된다!!
		request.setAttribute("pi", pi);// 페이징바 만들때 쓰라고 넘겨주는것
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		
		request.getRequestDispatcher("views/banner/adminBannerViewAndModifyAndDeletePage.jsp").forward(request, response);
		// adminTosPage.jsp 페이지 가서 작업해주자 !!
		// ★★★★ 그리고 나중에는 이 servlet을 호출해주는 방식으로 사용하면된다!!!! (여기서는 새로운 페이지로 넘어가기에 !! AJAX를 사용하는게 아니다!)

	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
