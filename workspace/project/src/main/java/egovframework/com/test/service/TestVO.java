package egovframework.com.test.service;

import egovframework.com.cmm.ComDefaultVO;

public class TestVO extends ComDefaultVO {
	private String te_id;
	private String te_name;
	private String te_content;
	private String insert_date;
	private String modify_date;
	
	public String getTe_id() {
		return te_id;
	}
	public void setTe_id(String te_id) {
		this.te_id = te_id;
	}
	public String getTe_name() {
		return te_name;
	}
	public void setTe_name(String te_name) {
		this.te_name = te_name;
	}
	public String getTe_content() {
		return te_content;
	}
	public void setTe_content(String te_content) {
		this.te_content = te_content;
	}
	public String getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}
}
