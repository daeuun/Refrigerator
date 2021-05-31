package com.refrigerator.category.model.vo;

public class MainCategory {

	// 사실상 컬럼이 2개라서 vo까지 만들필요는 없겠지만 혹여나 이 클래스를 쓸분이 있을수 있으니 만들자

	private int categoryMainNo;
	private String categoryName;

	public MainCategory() {}

	public MainCategory(int categoryMainNo, String categoryName) {
		super();
		this.categoryMainNo = categoryMainNo;
		this.categoryName = categoryName;
	}

	public int getCategoryMainNo() {
		return categoryMainNo;
	}

	public void setCategoryMainNo(int categoryMainNo) {
		this.categoryMainNo = categoryMainNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "MainCategory [categoryMainNo=" + categoryMainNo + ", categoryName=" + categoryName + "]";
	}
	
}
