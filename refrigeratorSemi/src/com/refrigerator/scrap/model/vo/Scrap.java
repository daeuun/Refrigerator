package com.refrigerator.scrap.model.vo;

public class Scrap {
	// 애초에 만들떄!!!! 중요한게 넘기는 값이 
	// 회원번호와 레시피 번호 2개만 가지고 해결을 할수있게 만들어둬야지만 
	// 나중에 최근본레시피 쿠기를 사용하여 조회해올때 이게 가능할듯하다. 
	
	// 기준점을 생각해주자! user가 여러개의 레시피를 스크랩을 할수있는것이다. 잘생각해야하는게
	
	// 순서가 찜하기 테이블에서 => recipe table갔다가 => review(요리후)테이블 과 
	//                                    => 회원 테이블을 동시에 접근해줘야한다 
	
	// 아래의 회원번호 필드는 값을 넘길때 쓰는 필드
	private int userNo; // ★  얘는 로그인한 회원을 회원번호이다. (즉 where절에서 해당 회원이 찜한 레시피들이 기준이 되는것이다.)
	private int recipeNo; // 레시피 번호를 넘겨서 정보를 가져와야한다. 
	//recipe테이블에서 레시피명  대표이미지  COOKING_TIME, LIKE_COUNT총 좋아요를 받아와야한다, 
	private String recipeTitle; //recipe테이블의 레시피제목
	private int cookingTime; //recipe테이블의 레시피 소요시간
	private int likeCount; //recipe테이블의 총 좋요수 
	private String mainImg;	 //recipe테이블의 대표이미지 경로 
	//member테이블에서 프로필 이미지, 프로필명,
	private String nickName; // member테이블의 프로필명
	private String profileImg; // member테이블의 프로필 이미지 
	
	// REVIEW 테이블에서 별점 star가져와야한다. 
	private double avgStar; // review테이블의  별점 
	// 소수점 까지 받아줘야하기에 double로 받아라 

	
	// 일단은 여기까지만 받아보자 후에 뭔가 추가되면 변경한다 먼저 sql짜러가라 
//---------------------------------------------------------------------------------------------------------------	
	public Scrap() {}


	public Scrap(int userNo, int recipeNo, String recipeTitle, int cookingTime, int likeCount, String mainImg,
			String nickName, String profileImg, double avgStar) {
		super();
		this.userNo = userNo;
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.cookingTime = cookingTime;
		this.likeCount = likeCount;
		this.mainImg = mainImg;
		this.nickName = nickName;
		this.profileImg = profileImg;
		this.avgStar = avgStar;
	}


	public Scrap(int recipeNo, String recipeTitle, int cookingTime, int likeCount, String mainImg, String nickName,
			String profileImg, double avgStar) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.cookingTime = cookingTime;
		this.likeCount = likeCount;
		this.mainImg = mainImg;
		this.nickName = nickName;
		this.profileImg = profileImg;
		this.avgStar = avgStar;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getRecipeNo() {
		return recipeNo;
	}


	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}


	public String getRecipeTitle() {
		return recipeTitle;
	}


	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}


	public int getCookingTime() {
		return cookingTime;
	}


	public void setCookingTime(int cookingTime) {
		this.cookingTime = cookingTime;
	}


	public int getLikeCount() {
		return likeCount;
	}


	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}


	public String getMainImg() {
		return mainImg;
	}


	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getProfileImg() {
		return profileImg;
	}


	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}


	public double getAvgStar() {
		return avgStar;
	}


	public void setAvgStar(double avgStar) {
		this.avgStar = avgStar;
	}


	@Override
	public String toString() {
		return "Scrap [userNo=" + userNo + ", recipeNo=" + recipeNo + ", recipeTitle=" + recipeTitle + ", cookingTime="
				+ cookingTime + ", likeCount=" + likeCount + ", mainImg=" + mainImg + ", nickName=" + nickName
				+ ", profileImg=" + profileImg + ", avgStar=" + avgStar + "]";
	}

	
}
