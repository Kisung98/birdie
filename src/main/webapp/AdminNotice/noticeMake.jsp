<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/noticeMake.css">




</head>

<body>

	<%@include file="/include/header.jsp"%>

	<br>
	<br>
	<br>
	<h1>공지사항 글쓰기</h1>

	<form action="/birdie/noticeInsert.notice">

		<table>

			<tr>
				<th>제목</th>
				<th><input type="text" style="width: 300px; height: 30px;" name="notice_title"></th>
			</tr>

			<tr>
				<th>내용</th>
				<th><textarea class="form-control" aria-label="With textarea" style="height: 400px;" name="notice_content"></textarea></th>
			</tr>

		</table>
		<hr>
		<input type="submit" class="btn btn-outline-success" value="글등록">

	</form>

</body>

</html>