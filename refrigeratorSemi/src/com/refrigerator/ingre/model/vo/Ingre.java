package com.refrigerator.ingre.model.vo;

/**
 * @author HeeRak
 */
public class Ingre {
	
	private int IngreNo;
	private int recipeNo;
	private int categorySno;
	private int ingreAmount;
	private String ingreUnit;
	private String ingreCategory;
	
	public Ingre() {}
	
	public Ingre(int categorySno, int ingreAmount, String ingreUnit, String ingreCategory) {
		super();
		this.categorySno = categorySno;
		this.ingreAmount = ingreAmount;
		this.ingreUnit = ingreUnit;
		this.ingreCategory = ingreCategory;
	}

	public Ingre(int ingreNo, int recipeNo, int categorySno, int ingreAmount, String ingreUnit, String ingreCategory) {
		super();
		IngreNo = ingreNo;
		this.recipeNo = recipeNo;
		this.categorySno = categorySno;
		this.ingreAmount = ingreAmount;
		this.ingreUnit = ingreUnit;
		this.ingreCategory = ingreCategory;
	}

	public int getIngreNo() {
		return IngreNo;
	}

	public void setIngreNo(int ingreNo) {
		IngreNo = ingreNo;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getCategorySno() {
		return categorySno;
	}

	public void setCategorySno(int categorySno) {
		this.categorySno = categorySno;
	}

	public int getIngreAmount() {
		return ingreAmount;
	}

	public void setIngreAmount(int ingreAmount) {
		this.ingreAmount = ingreAmount;
	}

	public String getIngreUnit() {
		return ingreUnit;
	}

	public void setIngreUnit(String ingreUnit) {
		this.ingreUnit = ingreUnit;
	}

	public String getIngreCategory() {
		return ingreCategory;
	}

	public void setIngreCategory(String ingreCategory) {
		this.ingreCategory = ingreCategory;
	}

	@Override
	public String toString() {
		return "Ingre [IngreNo=" + IngreNo + ", recipeNo=" + recipeNo + ", categorySno=" + categorySno
				+ ", ingreAmount=" + ingreAmount + ", ingreUnit=" + ingreUnit + ", ingreCategory=" + ingreCategory
				+ "]";
	}
	
	
}
