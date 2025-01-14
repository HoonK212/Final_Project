<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../layout/shopping_header.jsp" %>

<link href="https://tailwindcomponents.com/css/component.ecommerce-products-list.css" rel="stylesheet">

<style>
.animated {
	-webkit-animation-duration: 1s;
	animation-duration: 1s;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
}

.animated.faster {
	-webkit-animation-duration: 500ms;
	animation-duration: 500ms;
}

.fadeIn {
	-webkit-animation-name: fadeIn;
	animation-name: fadeIn;
}

.fadeOut {
	-webkit-animation-name: fadeOut;
	animation-name: fadeOut;
}

@keyframes fadeIn {
	from {
		opacity: 0;
	}
		to {
		opacity: 1;
	}
}

@keyframes fadeOut {
	from {
		opacity: 1;
	}
		to {
			opacity: 0;
	}
}
</style>

<main class="my-5">
	<div class="container mx-auto px-6">
		<h3 class="text-gray-700 text-2xl font-medium">
			<c:choose>
				<c:when test="${listno eq 0}">전체 보기</c:when>
				<c:when test="${listno eq 1}">이벤트 상품</c:when>
				<c:when test="${listno eq 2}">인기 상품</c:when>
				<c:when test="${listno eq 3}">신규 상품</c:when>
				<c:when test="${listno eq 4}">운동 보조제</c:when>
				<c:when test="${listno eq 5}">운동 기구</c:when>
				<c:when test="${listno eq 6}">다이어트 식품</c:when>
			</c:choose>
		</h3>
            
		<div class="grid gap-6 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 mt-6">

			<c:forEach items="${list}" var="list">
				<div class="w-full max-w-sm mx-auto rounded-md shadow-md overflow-hidden">
	                <a href="/shopping/detail?code=${list.code }">
	                  	<div class="flex items-end justify-end h-56 w-full bg-cover" style="background-position: center; background-size: 290px 224px; background-image: url('<%=request.getContextPath() %>/resources/${list.path }/${list.renamed }.${list.ext }')"></div>
	                </a>
	                <div class="py-2" style="text-align: right;">
	                	<!-- 장바구니 버튼 -->
		                <button onclick="loadBody('${list.code}');" class="p-2 rounded-full bg-blue-600 text-white mx-5 -mb-4 hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
		                    <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
		                </button>
	                </div>
                    <div class="px-5 py-3">
                        <h3 class="text-gray-700 uppercase"><a href="/shopping/detail?code=${list.code }">
                        <c:if test="${list.event eq 1 }"><span class="bg-yellow-500 text-xs">event</span></c:if>
                        ${list.name}</a></h3>
                        
                        <c:if test="${list.event eq 0 }"><span class="text-gray-500 mt-2"><fmt:formatNumber pattern="#,###" value="${list.price}" />원</span></c:if>
                        <c:if test="${list.event eq 1 }">
                        <span class="text-gray-500 mt-2 line-through"><fmt:formatNumber pattern="#,###" value="${list.price}" />원</span>
                        <span class="text-red-500 mt-2 pl-1"><fmt:formatNumber pattern="#,###" value="${list.price * 0.95}" />원</span>
                        </c:if>
                    </div>
                </div>
			</c:forEach>            
         
        </div>
        
        <div class="paging flex justify-center"><!-- section pagination -->
		<div class="flex rounded-md mt-8">
			<c:choose>
			<c:when test="${paging.blockStart > 1 }">
				<a href="<%= request.getContextPath() %>/shopping/list?listno=${listno}&cPage=${paging.blockStart-1}" class="py-2 px-4 leading-tight bg-white border border-gray-200 text-blue-700 border-r-0 ml-0 rounded-l hover:bg-blue-500 hover:text-white"><span>Previous</span></a>
			</c:when>
			
			<c:otherwise>
				<a href="<%= request.getContextPath() %>/shopping/list?listno=${listno}&cPage=${paging.blockStart}" class="py-2 px-4 leading-tight bg-white border border-gray-200 text-blue-700 border-r-0 ml-0 rounded-l hover:bg-blue-500 hover:text-white"><span>Previous</span></a>
			</c:otherwise>
	        </c:choose>
	        
	        <c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
	        <c:if test="${paging.currentPage eq page }">
				<a href="<%= request.getContextPath() %>/shopping/list?listno=${listno}&cPage=${page}" class="py-2 px-4 leading-tight border border-gray-200 border-r-0 bg-blue-500 text-white"><span>${page}</span></a>
			</c:if>
	        <c:if test="${paging.currentPage ne page }">
				<a href="<%= request.getContextPath() %>/shopping/list?listno=${listno}&cPage=${page}" class="py-2 px-4 leading-tight bg-white border border-gray-200 text-blue-700 border-r-0 hover:bg-blue-500 hover:text-white"><span>${page}</span></a>
			</c:if>
			</c:forEach> 
	        
			<c:choose>
			<c:when test="${paging.blockEnd+1 > paging.lastPage }">
				<a href="<%= request.getContextPath() %>/shopping/list?listno=${listno}&cPage=${paging.blockEnd}" class="py-2 px-4 leading-tight bg-white border border-gray-200 text-blue-700 border-r-0 hover:bg-blue-500 hover:text-white"><span>Next</span></a>
			</c:when>
			
			<c:otherwise>
				<a href="<%= request.getContextPath() %>/shopping/list?listno=${listno}&cPage=${paging.blockEnd+1}" class="py-2 px-4 leading-tight bg-white border border-gray-200 text-blue-700 border-r-0 hover:bg-blue-500 hover:text-white"><span>Next</span></a>
			</c:otherwise>
			</c:choose>
	 	   	 
		</div>
	</div><!-- // section pagination -->
        
	<!-- 모달창 -->
	<div class="main-modal fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster"
	style="background: rgba(0,0,0,.7);">
		<div style="max-width: 40rem;"
		class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">

				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">장바구니 담기</p>
					<div class="modal-close cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
						<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
						</svg>
					</div>
				</div>
					
				<!--Body-->
				<div class="my-5" id="modalBody"></div><!-- 모달 body end -->
				
			</div>
		</div>
	</div><!-- 모달창 end -->
	
	<input type="hidden" id="userId" value="${logInInfo.id }"/>
</div>
</main>

<script>
const modal = document.querySelector('.main-modal');
const closeButton = document.querySelectorAll('.modal-close');

const modalClose = () => {
	modal.classList.remove('fadeIn');
	modal.classList.add('fadeOut');
	setTimeout(() => {
		modal.style.display = 'none';
	}, 500);
}

const openModal = () => {
	
	//loadBody(code);

	modal.classList.remove('fadeOut');
	modal.classList.add('fadeIn');
	modal.style.display = 'flex';
	
}

for (let i = 0; i < closeButton.length; i++) {
	const elements = closeButton[i];
	elements.onclick = (e) => modalClose();
	modal.style.display = 'none';
	window.onclick = function (event) {
		if (event.target == modal) modalClose();
	}
}
		
const loadBody = (code) => {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '<%=request.getContextPath()%>/shopping/modalload?code='+code);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send();
	xhr.addEventListener('load', function() {
		var data = xhr.response;
		document.querySelector('#modalBody').innerHTML = data;
		openModal();
	});
}

const sendOrder = () => {
	var orderForm = document.createElement("form");
	orderForm.setAttribute("method", "get");
	orderForm.setAttribute("action", "<%=request.getContextPath()%>/shopping/payment");
	
	var code = document.createElement("input"); 
	code.setAttribute("type", "hidden"); 
	code.setAttribute("name", "codes"); 
	code.setAttribute("value", document.querySelector("#code").value);

	var sale = document.createElement("input"); 
	sale.setAttribute("type", "hidden"); 
	sale.setAttribute("name", "sale"); 
	sale.setAttribute("value", parseInt(document.querySelector("#sale").value * document.querySelector('#amount').value));
	
	var amount = document.createElement("input"); 
	amount.setAttribute("type", "hidden"); 
	amount.setAttribute("name", "amount"); 
	amount.setAttribute("value", document.querySelector('#amount').value);
	
	var userId = document.createElement("input"); 
	userId.setAttribute("type", "hidden"); 
	userId.setAttribute("name", "userId"); 
	userId.setAttribute("value", document.querySelector('#userId').value);
	
	orderForm.appendChild(code);
	orderForm.appendChild(sale);
	orderForm.appendChild(amount);
	orderForm.appendChild(userId);
	
	document.body.appendChild(orderForm); 
	orderForm.submit();
}

//장바구니 추가
const sendBasket = () => {
	var basketForm = document.createElement("form");
	basketForm.setAttribute("method", "post");
	basketForm.setAttribute("action", "<%=request.getContextPath()%>/shopping/basket");
	
	var code = document.createElement("input"); 
	code.setAttribute("type", "hidden"); 
	code.setAttribute("name", "codes"); 
	code.setAttribute("value", document.querySelector("#code").value);
	
	var amount = document.createElement("input"); 
	amount.setAttribute("type", "hidden"); 
	amount.setAttribute("name", "amount"); 
	amount.setAttribute("value", document.querySelector('#amount').value);
	
	var userId = document.createElement("input"); 
	userId.setAttribute("type", "hidden"); 
	userId.setAttribute("name", "userId"); 
	userId.setAttribute("value", document.querySelector('#userId').value);
	
	basketForm.appendChild(code);
	basketForm.appendChild(amount);
	basketForm.appendChild(userId);
	
	document.body.appendChild(basketForm);
	
	send(event, basketForm);
}

const send = (e,form) => {
	fetch(form.action,{method:'post', body: new FormData(form)})
	.then(function(response) {
		if(response.ok) {
			var con_test = confirm("장바구니에 상품을 담았습니다. \n장바구니로 이동하시겠습니까?");
			if(con_test == true){
				location.href='<%=request.getContextPath()%>/shopping/basket';
			}
			else if(con_test == false){
				modalClose();
			}
		}
	});
	e.preventDefault();
}
</script>

<%@include file="../layout/shopping_footer.jsp" %>