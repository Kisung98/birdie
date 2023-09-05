<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">

<title>관리자 페이지</title>
<style>
.button-container {
	display: flex;
	justify-content: center;
}

.button {
	display: inline-block;
	padding: 20px 20px;
	margin: 10px;
	border-radius: 50px;
	background-color: #ffca28;
	color: #ffffff;
	font-size: 16px;
	text-decoration: none;
	text-align: center;
	transition: background-color 0.3s ease;
}

.button:hover {
	background-color: #ffc107;
}
</style>
</head>
<body>
	<h1 style="margin-top: 100px; text-align: center;">관리자 페이지</h1>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="button-container" style="align-content: center;">
		<a href="/birdie/memberList.member" style="margin-right: 30px;"class="btn btn-outline-primary">회원관리</a>
		<a href="/birdie/noticeList.notice" style="margin-right: 30px;" class="btn btn-outline-primary">공지사항</a>
		<a href="/birdie/qnaList.qna" style="margin-right: 30px;" class="btn btn-outline-primary">Q&A</a>
		<a href="/birdie/reservationList.reservation" style="margin-right: 30px;" class="btn btn-outline-primary">예약관리</a>
		<a href="/birdie/rankingList.ranking" style="margin-right: 30px;" class="btn btn-outline-primary">랭킹확인</a>
	</div>
</body>
</html>
