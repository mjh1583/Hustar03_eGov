package hustar.bbs.service;

import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class GalleryVO extends ComDefaultVO {
	private int seq;
	private String subject;
	private String writer;
	private Date date;
	private String contents;
	private String filename;
	private String oriFilename;
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getOriFilename() {
		return oriFilename;
	}

	public void setOriFilename(String oriFilename) {
		this.oriFilename = oriFilename;
	}

	public int getSeq() {
		return seq;
	}
	
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
}
