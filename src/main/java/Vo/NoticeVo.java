package Vo;

import lombok.Data;

@Data
public class NoticeVo
{
	private int notice_no;
	private String notice_title;
	private String notice_date;
	private String notice_content;

	public NoticeVo()
	{
	}


	public NoticeVo(String notice_title, String notice_content)
	{
		this.notice_title = notice_title;
		this.notice_content = notice_content;
	}

}
