package com.peco.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int bno        ;
	private String category      ;
	private String title      ;
	private String content    ;
	private String regdate    ;
	private String updatedate ;
	private int visitcount ;
	private String likecount  ;
	private String m_id       ;
	private String nickname   ;
	
}
