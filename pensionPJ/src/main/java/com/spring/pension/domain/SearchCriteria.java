package com.spring.pension.domain;

public class SearchCriteria extends Criteria{

	private String searchType; //검색 타입 (제목, 내용, 글쓴이...)
	private String keyword; //키워드 (검색 내용)
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", getSearchType()="
				+ getSearchType() + ", getKeyword()=" + getKeyword() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
