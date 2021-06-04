package com.refrigerator.reply.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private int userNo;
	private int recipeNo;
	private String replyContent;
	private Date enrollDate;
	private Date modifyDate;
	private String deleteStatus;
	private String reportStatus;
	private String recipeTitle;

	public Reply() {}

	public Reply(int replyNo, int userNo, int recipeNo, String replyContent, Date enrollDate, Date modifyDate,
			String deleteStatus, String reportStatus, String recipeTitle) {
		super();
		this.replyNo = replyNo;
		this.userNo = userNo;
		this.recipeNo = recipeNo;
		this.replyContent = replyContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.deleteStatus = deleteStatus;
		this.reportStatus = reportStatus;
		this.recipeTitle = recipeTitle;
	}

	public Reply(int replyNo, int recipeNo, String replyContent, Date modifyDate, String recipeTitle) {
		super();
		this.replyNo = replyNo;
		this.recipeNo = recipeNo;
		this.replyContent = replyContent;
		this.modifyDate = modifyDate;
		this.recipeTitle = recipeTitle;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
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

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", userNo=" + userNo + ", recipeNo=" + recipeNo + ", replyContent="
				+ replyContent + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", deleteStatus="
				+ deleteStatus + ", reportStatus=" + reportStatus + ", recipeTitle=" + recipeTitle + "]";
	}
	
	

	
}
