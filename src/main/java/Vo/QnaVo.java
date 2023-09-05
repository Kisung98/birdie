package Vo;

import lombok.Data;

@Data
public class QnaVo
{
	private int qna_no;
	private int mem_no;
	private String qna_title;
	private String qna_content;
	private String qna_date;
	private String qna_answer;

	public QnaVo()
	{
	}


	public QnaVo(int qna_no, String qna_answer)
	{
		this.qna_no = qna_no;
		this.qna_answer = qna_answer;
	}

}
