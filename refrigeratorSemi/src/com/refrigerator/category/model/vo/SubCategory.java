package com.refrigerator.category.model.vo;

public class SubCategory {

	// 사실상 컬럼이 3개라서 vo까지 만들필요는 없겠지만 혹여나 이 클래스를 쓸분이 있을수 있으니 만들자
	private int categorySubNo;
	// erd에서 잘못만들었나 얘는 컬럼명이 왜이러지 일단 인지해두고 이에 맞게 진행하자 
	private int categoryMainNo;
	private String ingredientName;

	public SubCategory() {}
	
	public SubCategory(int categorySubNo, String ingredientName) {
		super();
		this.categorySubNo = categorySubNo;
		this.ingredientName = ingredientName;
	}

	public SubCategory(int categorySubNo, int categoryMainNo, String ingredientName) {
		super();
		this.categorySubNo = categorySubNo;
		this.categoryMainNo = categoryMainNo;
		this.ingredientName = ingredientName;
	}

	public int getCategorySubNo() {
		return categorySubNo;
	}

	public void setCategorySubNo(int categorySubNo) {
		this.categorySubNo = categorySubNo;
	}

	public int getCategoryMainNo() {
		return categoryMainNo;
	}

	public void setCategoryMainNo(int categoryMainNo) {
		this.categoryMainNo = categoryMainNo;
	}

	public String getIngredientName() {
		return ingredientName;
	}

	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}

	@Override
	public String toString() {
		return "SubCategory [categorySubNo=" + categorySubNo + ", categoryMainNo=" + categoryMainNo
				+ ", ingredientName=" + ingredientName + "]";
	}
	
}
