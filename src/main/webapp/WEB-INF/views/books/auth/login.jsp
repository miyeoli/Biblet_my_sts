<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
 if(${!empty sessionScope.authInfo}){
	 window.history.forward();
 }
</script>

<title><spring:message code="login.title" /></title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/adminbootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/registPage.css"
	type="text/css">

</head>
<body>
	<div class="container">
		<div class="row d-flex justify-content-center mt-5">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
				<div class="card py-3 px-2">
					<p class="text-center mb-3 mt-2">LOGIN</p>
					<form:form commandName="commandLogin" class="myform">
						<form:errors />

						<div class="form-group">
							<form:input path="mem_id" type="text" class="form-control"
								placeholder="아이디" />
							<form:errors path="mem_id" />
						</div>

						<div class="form-group">
							<form:input type="password" path="mem_pass" class="form-control"
								placeholder="비밀번호" />
							<form:errors path="mem_pass" />
						</div>
						<div class="row">
							<div class="col-md-6 col-12">
								<div class="form-group form-check">
									<input type="checkbox" class="form-check-input" id="rememberId"
										name="rememberId"> <label class="form-check-label"
										for="rememberId">REMMBER ME</label>
								</div>
							</div>
							<div class="col-md-6 col-12 bn" id=findBtn
								onclick="location.href='findId'">FORGET</div>
						</div>

						<div class="form-group mt-3" style="text-align: center;">
							<button type="submit" class="btn btn-block btn-primary btn-lg">
								<small><i class="far fa-user pr-2"></i>LOGIN</small>
							</button>
						</div>
					</form:form>
					
					<div class="division">

						<div class="row">
							<div class="col-3">
								<div class="line l"></div>
							</div>
							<div class="col-6">
								<span>간편 로그인</span>
							</div>
							<div class="col-3">
								<div class="line r"></div>
							</div>
						</div>
					</div>
	
	<!-- 네이버 로그인 버튼 노출 영역 -->
		<%
		String clientId = "d49IDn_y2lOLJI_iR5pL";//애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://localhost:8080/www/home", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
		%>
		
	<div class="row mx-auto ">
		<div class="col-4">
			<a href="<%=apiURL%>"><img height="50"
			src="http://static.nid.naver.com/oauth/small_g_in.PNG" />
			
			</a>
		</div>
	</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>