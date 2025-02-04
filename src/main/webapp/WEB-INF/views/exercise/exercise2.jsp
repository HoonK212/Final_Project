<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/exercise/exercise.css">


<!-- HEADER -->
<%@include file="../layout/header.jsp" %>

<script type="text/javascript">

$(document).ready(function() {
	
	$(".levelForm").submit(function() {
		if( !($("input:radio[name='level']").is(":checked")) ) {
			alert("1개 이상을 선택해주세요")
			return false;
		}
		$(this).submit()
	})
	
	if( <%= session.getAttribute("level") %> != null) {
		$("input:radio[id='<%= session.getAttribute("level") %>']").prop("checked", true)
	}
});
</script>


<!-- section 시작 -->
<section style="min-height:73vh;">

	<!-- div wrap 시작 -->
	<div id="wrap">
	
		<!-- 프로그래스바 시작 -->
		<div class="max-w-5xl mx-auto my-16 border-b-2 pb-4">	
		<div class="flex pb-3">
			<div class="flex-1">
			</div>
	
			<div class="flex-1">
				<div class="w-10 h-10 bg-blue-500 mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-white text-center w-full">1</span>
				</div>
			</div>
	
	
			<div class="w-1/6 align-center items-center align-middle content-center flex">
				<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
				 	<div class="bg-blue-500 text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 100%"></div>
				</div>
			</div>
		
			
			<div class="flex-1">
				<div class="w-10 h-10 bg-blue-500 mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-white text-center w-full">2</span>
				</div>
			</div>
		
			<div class="w-1/6 align-center items-center align-middle content-center flex">
				<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
				 	<div class="bg-blue-500 text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 20%"></div>
				</div>
			</div>
		
			<div class="flex-1">
				<div class="w-10 h-10 bg-white border-2 border-grey-light mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-gray-600 text-center w-full">3</span>
				</div>
			</div>
		
		
			<div class="w-1/6 align-center items-center align-middle content-center flex">
				<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
				 	<div class="bg-green-light text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 0%"></div>
				</div>
			</div>
	
	
			<div class="flex-1">
				<div class="w-10 h-10 bg-white border-2 border-grey-light mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-gray-600 text-center w-full">4</span>
				</div>
			</div>
		
		
			<div class="flex-1">
			</div>		
		</div>
		
		<div class="flex text-base content-center text-center font-bold">
			<div class="w-1/4">
				종류선택
			</div>
			
			<div class="w-1/4">
				등급선택
			</div>
			
			<div class="w-1/4">
				운동선택
			</div>
			
			<div class="w-1/4">
				운동시작
			</div>			
		</div>
		</div>
		<!-- 프로그래스바 끝 -->
		
		<!-- radiobox 시작 -->
		<div class="container_checkbox">
		<h1 class="level-title font-bold">등급을 선택해주세요</h1>
		<form class="levelForm cf" action="<%=request.getContextPath() %>/exercise/select" method="post">
			<section class="plan cf">
				<input type="radio" name="level" id="level1" value="1"><label class="free-label four-level col" for="level1">왕초보자</label>
				<input type="radio" name="level" id="level2" value="2"><label class="basic-label four-level col" for="level2">초보자</label>
				<input type="radio" name="level" id="level3" value="3"><label class="basic-label four-level col" for="level3">중급자</label>
				<input type="radio" name="level" id="level4" value="4"><label class="basic-label four-level col" for="level4">고급자</label>
				<input type="radio" name="level" id="level5" value="5"><label class="premium-label four-level col" for="level5">마스터</label>
			</section>
				
			<!-- 버튼 시작 -->
			<div class="flex nav-button margin-topbottom">
			    <button type="button" class="border border-blue-500 text-white block rounded-sm font-bold py-4 px-6 mr-2 flex items-center hover:bg-blue-600 hover:text-white bg-blue-500">
			        <svg class="h-5 w-5 mr-2 fill-current" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="-49 141 512 512" style="enable-background:new -49 141 512 512;" xml:space="preserve">
			            <path id="XMLID_10_" d="M438,372H36.355l72.822-72.822c9.763-9.763,9.763-25.592,0-35.355c-9.763-9.764-25.593-9.762-35.355,0 l-115.5,115.5C-46.366,384.01-49,390.369-49,397s2.634,12.989,7.322,17.678l115.5,115.5c9.763,9.762,25.593,9.763,35.355,0 c9.763-9.763,9.763-25.592,0-35.355L36.355,422H438c13.808,0,25-11.193,25-25S451.808,372,438,372z"></path>
			        </svg>
			        <a href="<%=request.getContextPath() %>/exercise/type">Previous page</a>
			    </button>
			    <button type="submit" class="border border-gary-500 bg-blue-500 text-white block rounded-sm font-bold py-4 px-6 ml-2 flex items-center hover:bg-blue-600">
			        Next page
			        <svg class="h-5 w-5 ml-2 fill-current" clasversion="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
			             viewBox="-49 141 512 512" style="enable-background:new -49 141 512 512;" xml:space="preserve">
			        <path id="XMLID_11_" d="M-24,422h401.645l-72.822,72.822c-9.763,9.763-9.763,25.592,0,35.355c9.763,9.764,25.593,9.762,35.355,0
			            l115.5-115.5C460.366,409.989,463,403.63,463,397s-2.634-12.989-7.322-17.678l-115.5-115.5c-9.763-9.762-25.593-9.763-35.355,0
			            c-9.763,9.763-9.763,25.592,0,35.355l72.822,72.822H-24c-13.808,0-25,11.193-25,25S-37.808,422-24,422z"/>
			        </svg>
			    </button>
			</div>
			<!-- 버튼 끝 -->
			
		</form>
		</div>
		<!-- radiobox 끝 -->
		
	</div>
	<!-- div wrap 끝 -->
	
</section>
<!-- section 끝 -->


<!-- FOOTER -->
<%@include file="../layout/footer.jsp" %>