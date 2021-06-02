package com.refrigerator.report.model.vo;

import java.sql.Date;

public class Report {
	
	private int reportNo;
	private int userNo;
	private int refNo;
	private String reportContent;
	private Date reportDate;
	private int reportType;
	
	public Report() {}

	public Report(int reportNo, int userNo, int refNo, String reportContent, Date reportDate, int reportType) {
		super();
		this.reportNo = reportNo;
		this.userNo = userNo;
		this.refNo = refNo;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportType = reportType;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public int getReportType() {
		return reportType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", userNo=" + userNo + ", refNo=" + refNo + ", reportContent="
				+ reportContent + ", reportDate=" + reportDate + ", reportType=" + reportType + "]";
	}
	
	

}
