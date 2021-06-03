package com.refrigerator.recipe.model.vo;

/**
 * @author HeeRak
 */
public class Recipe {
	
	private int recipeNo;
	private int userNo;
	private String recipeTitle;
	private String recipeIntro;
	private int severalServings; 
	private int cookingTime;
	private double avrgStarPoint; 
	private int count;
	private int likeCount;
	private int scrapCount;
	private String recipeEnrollDate;
	private String status;
	private String mainImg;
	private String ingreImg;
	
	public Recipe() {}
	
	public Recipe(int userNo, String recipeTitle, String recipeIntro, int severalServings, int cookingTime, String mainImg,
			String ingreImg) {
		super();
		this.userNo = userNo;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.severalServings = severalServings;
		this.cookingTime = cookingTime;
		this.mainImg = mainImg;
		this.ingreImg = ingreImg;
	}

	public Recipe(int recipeNo, int userNo, String recipeTitle, String recipeIntro, int severalServings, int cookingTime,
			double avrgStarPoint, int count, int likeCount, int scrapCount, String recipeEnrollDate, String status,
			String mainImg, String ingreImg) {
		super();
		this.recipeNo = recipeNo;
		this.userNo = userNo;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.severalServings = severalServings;
		this.cookingTime = cookingTime;
		this.avrgStarPoint = avrgStarPoint;
		this.count = count;
		this.likeCount = likeCount;
		this.scrapCount = scrapCount;
		this.recipeEnrollDate = recipeEnrollDate;
		this.status = status;
		this.mainImg = mainImg;
		this.ingreImg = ingreImg;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public String getRecipeIntro() {
		return recipeIntro;
	}

	public void setRecipeIntro(String recipeIntro) {
		this.recipeIntro = recipeIntro;
	}

	public int getSeveralServings() {
		return severalServings;
	}

	public void setSeveralServings(int severalServings) {
		this.severalServings = severalServings;
	}

	public int getCookingTime() {
		return cookingTime;
	}

	public void setCookingTime(int cookingTime) {
		this.cookingTime = cookingTime;
	}

	public double getAvrgStarPoint() {
		return avrgStarPoint;
	}

	public void setAvrgStarPoint(double avrgStarPoint) {
		this.avrgStarPoint = avrgStarPoint;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getScrapCount() {
		return scrapCount;
	}

	public void setScrapCount(int scrapCount) {
		this.scrapCount = scrapCount;
	}

	public String getRecipeEnrollDate() {
		return recipeEnrollDate;
	}

	public void setRecipeEnrollDate(String recipeEnrollDate) {
		this.recipeEnrollDate = recipeEnrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getIngreImg() {
		return ingreImg;
	}

	public void setIngreImg(String ingreImg) {
		this.ingreImg = ingreImg;
	}

	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", userNo=" + userNo + ", recipeTitle=" + recipeTitle + ", recipeIntro="
				+ recipeIntro + ", severalServings=" + severalServings + ", cookingTime=" + cookingTime
				+ ", avrgStarPoint=" + avrgStarPoint + ", count=" + count + ", likeCount=" + likeCount + ", scrapCount="
				+ scrapCount + ", recipeEnrollDate=" + recipeEnrollDate + ", status=" + status + ", mainImg=" + mainImg
				+ ", ingreImg=" + ingreImg + "]";
	}
	

}
