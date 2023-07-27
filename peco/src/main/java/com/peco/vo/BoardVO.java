package com.peco.vo;

import lombok.Data;

@Data
public class BoardVO {
	private String bno        ;
	private String title      ;
	private String content    ;
	private String writer     ;
	private String regdate    ;
	private String updatedate ;
	private String visitcount ;
	private String likecount  ;
	private String m_id       ;
}
