<%@page import="Vo.QnaVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
table {
	width: 90%;
	border-collapse: collapse;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
	margin-left: auto;
	margin-right: auto;
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
</style>



<%
List<QnaVo> qlist = (List<QnaVo>) request.getAttribute("qlist");
%>


</head>

<body>

	<%@include file="/include/header.jsp"%>

	<br>
	<br>
	<br>
	<h1>QnA</h1>

	<form action="/birdie/qnaListSearch.qna" style="display: inline;">
		<input type="text" class="rounded-input" placeholder="제목입력" name="qna_title">
		<input type="submit" value="검색" class="rounded-submit">
	</form>

	<input type="button" value="전체조회" class="rounded-submit" onclick="location.href='/birdie/qnaList.qna';">
	<hr>


	<table>
		<tr>
			<th style="width: 20%">QnA번호</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<%
		if (qlist != null)
		{
			for (QnaVo qnaVo : qlist)
			{
		%>
		<tr>
			<td>
				<%=qnaVo.getQna_no() %>
			</td>

			<td>
			<a href="/birdie/qnaDetail.qna?qna_title=<%=qnaVo.getQna_title()%>" style="text-decoration: underline;"><%=qnaVo.getQna_title()%></a>
			</td>
			<td>
			<%=qnaVo.getQna_date()%>
			</td>
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