package com.refrigerator.recent_recipe.model.vo;

public class RecentRecipe {
	private int recipeNo; // 레시피 번호를 넘겨서 정보를 가져와야한다. 
	private String recipeTitle; //recipe테이블의 레시피제목
	private int cookingTime; //recipe테이블의 레시피 소요시간
	private int likeCount; //recipe테이블의 총 좋요수 
	private String mainImg;	 //recipe테이블의 대표이미지 경로 
	private String nickName; // member테이블의 프로필명
	private String profileImg; // member테이블의 프로필 이미지 	
	private double avgStar; // member테이블의  별점 
	
	public RecentRecipe() {}
	
	public RecentRecipe(int recipeNo, String recipeTitle, int cookingTime, int likeCount, String mainImg,
			String nickName, String profileImg, double avgStar) {
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
		return "RecentRecipe [recipeNo=" + recipeNo + ", recipeTitle=" + recipeTitle + ", cookingTime=" + cookingTime
				+ ", likeCount=" + likeCount + ", mainImg=" + mainImg + ", nickName=" + nickName + ", profileImg="
				+ profileImg + ", avgStar=" + avgStar + "]";
	}
	
	
}
