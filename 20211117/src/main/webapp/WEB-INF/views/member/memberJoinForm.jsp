<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
		
			function CheckEmail(str) {
				var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
				// 정규표현식인지 확인하는 구문.
				if(!reg_email.test(str)) {
					return false;
				}
				else {
					return true;
				}
			}
			
			function idCheck() {
				var id = $("#id").val();
				if(!CheckEmail(id)) {
					alert("eMail을 입력하세요.");
					$("#id").val("");
					$("#id").focus();
					return;
				}
				
				$.ajax({
					url : "ajaxIdCheck.do",
					type : "post",
					data : {chkid : id},
					dataType : "text",
					success : function(data) {
						if(data == '0') {
							alert(id + "은(는) 사용할 수 있는 아이디 입니다.");
							$("#idchk").val("Yes");
							$("#idchk").attr("disabled", true);
							$("#password").focus();
						} else {
							alert(id + "은(는) 이미 존재하는 아이디 입니다.");
							$("#id").val("");
							$("#id").focus();
						}
					}
				});	
			}
			
			function formCheck() {
				if($("#idchk").val() != 'Yes') {
					alert("ID 중복체크를 해주세요 !!");
					return false;
				}
				
				if($("#password").val() != $("#passwordChk").val()) {
					alert("PASSWORD 확인을 해주세요 !!");
					$("#password").val("");
					$("#passwordChk").val("");
					$("#password").focus();
					return false;
				}
				
				$("#frm").submit();
			}
		</script>
	</head>
	
	<body>
		<jsp:include page="../home/header.jsp"/>
		<div align ="center">
			<h3>회원가입</h3>
			<h5>(* 는 반드시 입력해야 하는 필수 기재 항목입니다.)</h5>
			<div>
				<form id="frm" action="memberJoin.do" method="post">
					<table border="1">
						<tr>
							<th width="150">* 아이디</th>
							<td width="500"><input type="email" id="id" name="id" required="required" placeholder="id(email)를 입력하세요">
								&nbsp;&nbsp;<button id="idchk" onclick="idCheck()" value="No">중복체크</button></td>
						</tr>
						<tr>
							<th>* 비밀번호</th>
							<td><input type="password" id="password" name="password" required="required" placeholder="pw를 입력하세요"></td>
						</tr>
						<tr>
							<th>* 비밀번호 확인</th>
							<td><input type="password" id="passwordChk" name="passwordChk" required="required" placeholder="pw를 입력하세요"></td>
						</tr>
						<tr>
							<th>* 이름</th>
							<td><input type="text" id="name" name="name" required="required" placeholder="이름을 입력하세요"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" id="tel" name="tel" placeholder="전화번호를 입력하세요"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" id="address" name="address" size="70" placeholder="주소를 입력하세요"></td>
						</tr>
					</table>
					<br>
					<input type="button" onclick="formCheck()" value="회원가입">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소"> 
				</form>
			</div>
		</div>
	</body>
</html>