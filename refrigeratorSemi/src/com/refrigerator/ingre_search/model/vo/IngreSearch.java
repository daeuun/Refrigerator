package com.refrigerator.ingre_search.model.vo;

/**
 * 검색버튼데이터 저장객체
 * @author HeeRak
 */
public class IngreSearch {
	
	private int ingredientSearch;
	private int recipeNo;
	private int categorySno;
	
	public IngreSearch(){}

	public IngreSearch(int ingredientSearch, int recipeNo, int categorySno) {
		super();
		this.ingredientSearch = ingredientSearch;
		this.recipeNo = recipeNo;
		this.categorySno = categorySno;
	}

	public int getIngredientSearch() {
		return ingredientSearch;
	}

	public void setIngredientSearch(int ingredientSearch) {
		this.ingredientSearch = ingredientSearch;
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

	@Override
	public String toString() {
		return "IngreSearch [ingredientSearch=" + ingredientSearch + ", recipeNo=" + recipeNo + ", categorySno="
				+ categorySno + "]";
	}
	
}
