package Vo;

import lombok.Data;

@Data
public class MemberVo
{
	private int mem_no; //시퀀스
	private String mem_id;
	private String mem_password;
	private String mem_name;
	private String mem_phone;
	private int mem_score; //0기본값
	private String mem_gender;
	int mem_type; //0기본값

	public MemberVo()
	{
	}


	// 회원가입 생성자
	public MemberVo(String mem_id, String mem_password, String mem_name, String mem_phone, String mem_gender)
	{
		this.mem_id = mem_id; // 아이디
		this.mem_password = mem_password; // 비밀번호
		this.mem_name = mem_name; // 이름
		this.mem_phone = mem_phone; // 전화번호
		this.mem_gender = mem_gender; // 성별
	}

	

	

}
