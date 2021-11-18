<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function inputCheck() {
		if (frm.id.value == "") {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		} else if (frm.password.value == "") {
			alert("비밀번호를 입력하세요.");
			frm.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="../home/header.jsp"></jsp:include>
	<div align="center">
		<div></div>
		<div>
			<p>
			<p>
			<p>
		</div>
		<div>
			<h2>로그인</h2>
		</div>
		<div>
			<form id="frm" action="memberLogin.do" method="post">
				<div>
					<table border="1">
						<tr>
							<th width="150">아이디</th>
							<td width="200"><input type="text" id="id" name="id">
							</td>
						</tr>
						<tr>
							<th width="150">비밀번호</th>
							<td width="200"><input type="password" id="password" name="password"></td>
						</tr>
					</table>
				</div>
				<br> <input type="submit" onclick="inputCheck()" value="로그인">&nbsp;&nbsp;&nbsp;
			</form>
		</div>
		<br>
	</div>
</body>
</html>