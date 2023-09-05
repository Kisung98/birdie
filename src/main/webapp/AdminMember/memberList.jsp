<%@page import="Vo.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- <link rel="stylesheet" type="text/css" href="../css/memberList.css">   서블릿한테 포워딩을 당하면 외부 css가 꺠져버린다. -->
<style>
table {
	width: 100%;
	border-collapse: collapse;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px;
	text-align: left;
	background-color: #f7f7f7;
	color: #333;
}

th {
	background-color: #B6CFB6;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ffeb3b;
}

.rounded-input {
	border: none;
	border-radius: 20px;
	padding: 10px 15px;
	font-size: 16px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.rounded-submit {
	background-color: #ff4081;
	color: #fff;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	font-size: 16px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

.rounded-submit:hover {
	background-color: #e6005c;
}

#wrapper {
	height: auto;
	min-height: 100%;
	padding-bottom: (footer높이);
}

.footer {
	height: (footer높이);
	position: relative;
	transform: translateY(-100%);
}
</style>




<%
List<MemberVo> mlist = (List<MemberVo>) request.getAttribute("mlist");
%>

</head>

<body>

	<%@include file="/include/header.jsp"%>

	<br>
	<br>
	<br>
	<h1>회원목록</h1>

	<form action="/birdie/memberListSearch.member" style="display: inline;">
		<input type="text" class="rounded-input" placeholder="이름입력" name="mem_name">
		<input type="submit" value="검색" class="rounded-submit">

	</form>

	<input type="button" value="전체조회" class="rounded-submit" onclick="location.href='/birdie/memberList.member';">
	<hr>



	<table>
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>누적점수</th>
			<th>성별</th>
			<th>타입코드</th>
		</tr>
		<%
		if (mlist != null)
		{
			for (MemberVo member : mlist)
			{
		%>
		<tr>
			<td><%=member.getMem_no()%></td>
			<td><%=member.getMem_id()%></td>
			<td><%=member.getMem_password()%></td>
			<td><%=member.getMem_name()%></td>
			<td><%=member.getMem_phone()%></td>
			<td><%=member.getMem_score()%></td>
			<td><%=member.getMem_gender()%></td>
			<td><%=member.getMem_type()%></td>
		</tr>
		<%
		} //end of for
		} //end of if
		else
		{
		%>
		<tr>
			<td colspan="9">조회결과가 없습니다.</td>
		</tr>
		<%
		}
		%>
	</table>




</body>

</html>