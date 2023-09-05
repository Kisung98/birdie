<%@page import="Vo.QnaVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/noticeMake.css">

<%
QnaVo qnaVo = (QnaVo) request.getAttribute("qnaVo");
%>

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
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ffeb3b;
}

textarea {
	height: 200px;
}

input {
	border-radius: 5px;
}
</style>



</head>

<body>

	<%@include file="/include/header.jsp"%>

	<br>
	<br>
	<br>
	<h1>QnA 상세보기</h1>


	<form action="/birdie/qnaAnswer.qna">
		<table>
			
			<tr>
				<th>제목</th>
				<th><input readonly="readonly" type="text" style="width: 300px; height: 30px;" value="<%=qnaVo.getQna_title()%>"></th>
				<th><input type="hidden" name="qna_no" value="<%=qnaVo.getQna_no()%>"></th>
			</tr>

			<tr>
				<th>내용</th>
				<th><textarea readonly="readonly" class="form-control" aria-label="With textarea" style="height: 400px;" ><%=qnaVo.getQna_content()%></textarea></th>
			</tr>


			<%
			if (qnaVo.getQna_answer().equals(" "))
			{
			%>

			<tr>
				<th>답변</th>
				<th><textarea class="form-control" name="qna_answer" aria-label="With textarea" style="height: 400px;"><%=qnaVo.getQna_answer()%></textarea></th>
			</tr>
			<%
			}

			else
			{
			%>
			<tr>
				<th>답변</th>
				<th><textarea class="form-control" readonly="readonly" aria-label="With textarea" style="height: 400px;"><%=qnaVo.getQna_answer()%></textarea></th>
			</tr>

			<%
			}
			%>


		</table>

		<hr>
		<div style="margin-left: 1500px;">
			<input type="button" class="btn btn-outline-success" value="글목록" onclick="location.href='/birdie/qnaList.qna'">
			<%
			if (qnaVo.getQna_answer().equals(" "))
			{
			%>
			<input type="submit" class="btn btn-outline-success" value="답변달기">
			<%
			}
			%>
		</div>
	</form>



</body>

</html>