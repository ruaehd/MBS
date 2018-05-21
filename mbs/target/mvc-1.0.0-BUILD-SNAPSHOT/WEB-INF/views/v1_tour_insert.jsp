<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관광지 추가</title>
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<style>
		.container{
			z-index:2;
		}
		.gn-menu-main{
			z-index:10;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div id="main">
			<div class="container" style="margin-top:150px; min-height:600px">
			      <div class="row form-group">
			      <div class="col-xs-12">
			      <div align="center" style="margin-bottom:50px">
						<h1 style="font-size:56px">
							<b>사업체 등록</b>
						</h1>
					</div>
			               <ul class="nav nav-pills nav-justified thumbnail setup-panel">
			                   <li class="active"><a href="#step-1">
			                       <h4 class="list-group-item-heading">사업자 정보</h4>
			                       <p class="list-group-item-text">First step description</p>
			                   </a></li>
			                   <li class="disabled"><a href="#step-2">
			                       <h4 class="list-group-item-heading">운영 정보</h4>
			                       <p class="list-group-item-text">Second step description</p>
			                   </a></li>
			               </ul>
			           </div>
			      
					
			      </div>
			      
			      
			      <form:form action="tour_insert.do" id="form" class="form-horizontal" enctype="multipart/form-data" modelAttribute="vo" method="post" >
			       <div class="row setup-content" id="step-1">
			           <div class="col-xs-12">
			            
			               <div class="col-md-12">
			                   <h2>사업자정보</h2>
			                   <hr />
			                  
			                  <div class="form-group">
			                     <label class="col-sm-4 control-label" for="company_name">상호명</label>
			                     <div class="col-sm-5">
			                     <form:input type="text" class="form-control" id="company_name" path="company_name" placeholder="예)MBS 프로젝트" />
			                  </div>
			                     
			                  </div>
			                  <div class="form-group">
			                     <label class="col-sm-4 control-label">사업자분류</label>
			                     <div class="col-sm-5">
			                        <div class="form-inline">
			                           <input type="radio" id="one" name="company_class"/> 개인
			                           <input type="radio" id="group" name="company_class"/> 법인
			                           <form:input type="hidden" path="company_class" id="company_class"/>
			                        </div>
			                     </div>
			                  </div>
			                  <div class="form-group">
			                     <label class="col-sm-4 control-label">사업자 등록번호</label>
			                     <div class="col-sm-5">
			                        <form:input type="text" class="form-control" id="company_num" path="company_num" placeholder="예)000-00-00000" />
			                     </div>
			                     	<font id="numfont" style="font-size:12px;color:red" ></font>
			                  </div>
			                  <div class="form-group">
			                     <label class="col-sm-4 control-label" >업태</label>
			                     <div class="col-sm-5">
			                        <form:input type="text" class="form-control" id="company_conditions" path="company_conditions" placeholder="업태를 입력하세요" />
			                     </div>
			                  </div>
			                  <div class="form-group">
			                     <label class="col-sm-4 control-label" >대표 전화 번호</label>
			                     <div class="col-sm-5">
			                        <form:input type="text" class="form-control" id="company_tel" path="company_tel" placeholder="예)02-000-0000" />
			                     </div>
			                  </div>
			                  <div class="form-group">
			                     <label class="col-sm-4 control-label" >사업체 주소</label>
			                     <div class="col-sm-5">
			                        <form:input type="text" path="company_add" class="form-control w3-white" onclick="sample4_execDaumPostcode()" id="sample4_roadAddress"  placeholder="예) 부산시 강서구 가나다" readonly="true"/>
			                        <form:input type="hidden" path="company_lat" id="lat"/>
			                        <form:input type="hidden" path="company_lng" id="lng"/>
			                     </div>
			                  </div>
			                 <div class="form-group">
			                     <label class="col-sm-4 control-label">사업자 등록증</label>
			                     <div class="col-sm-5">
			                     <input type="file" id="business_file" name="business_file" class="filestyle"  data-btnClass="btn-primary" data-placeholder="No file" data-text="파일 찾기">
			                     </div>
			                  </div>
			                  
			                   <div align="center">
			                      <a href="map_main.do"><button type="button" class="btn btn-info btn-lg">메인페이지로</button></a>
			                       <button type="button" id="next-2" class="btn btn-primary btn-lg">다음 단계로</button>
			                   </div>
			               </div> 
			               
			           </div>
			       </div>
			       <div class="row setup-content" id="step-2">
			           <div class="col-xs-12">
			               <div class="col-md-12">
			                   <h1>운영 정보</h1>
			                   <hr />
			                 <div class="form-group">
			                     <label class="col-sm-4 control-label" for="time">영업시간</label>
			                      <div class="col-sm-5">
				                     <div class="row">
					                     <div class="col-md-5">
					                        <form:input type="text" path="stime" class="form-control" id="stime" placeholder="예)08" />
					                     </div>
					                     <div class="col-md-1">
					                        <b>~</b>
					                     </div>
					                     <div class="col-md-5">
					                        <form:input type="text" path="etime" class="form-control" id="etime" placeholder="예)21" />
					                     </div>
				                     </div>
			                     </div>
			                  </div>
			                 
			                  <div class="form-group">
			                     <label class="col-sm-4 control-label" for="intro">소개글</label>
			                     <div class="col-sm-5">
			                        <form:textarea class="form-control" rows="6" style="resize:none" id="str_document" path="str_document"></form:textarea>
			                     </div>
			                  </div>
			                  
			                  
			                  
			                  <div class="form-group">
			                     <label class="col-sm-4 control-label" for="time">이미지</label>
			                     <div class="col-sm-5">
			                     	<div class="row well">
			                     		<div class="col-md-4 ">
			                     			<a class="imgs"><img src="resources/imgs/no-image.png" class="imgs_0" style="width:100%;height:114px"/></a>
			                     			<input type="file" style="display:none"  name="imgs_0" class="fileload_0"/>
			                     		</div>
			                     		<div class="col-md-4 ">
			                     			<a class="imgs"><img src="resources/imgs/no-image.png" class="imgs_1" style="width:100%;height:114px"/></a>
			                     			<input type="file" style="display:none"  name="imgs_1" class="fileload_1"/>
			                     		</div>
			                     		<div class="col-md-4 ">
			                     			<a class="imgs"><img src="resources/imgs/no-image.png" class="imgs_2" style="width:100%;height:114px"/></a>
			                     			<input type="file" style="display:none"  name="imgs_2" class="fileload_2"/>
			                     		</div>
			                     		<div class="col-md-offset-2 col-md-4 " style="margin-top:20px">
			                     			<a class="imgs"><img src="resources/imgs/no-image.png" class="imgs_3" style="width:100%;height:114px"/></a>
			                     			<input type="file" style="display:none"  name="imgs_3" class="fileload_3"/>
			                     		</div>
			                     		<div class="col-md-4 " style="margin-top:20px">
			                     			<a class="imgs"><img src="resources/imgs/no-image.png" class="imgs_4" style="width:100%;height:114px"/></a>
			                     			<input type="file" style="display:none"  name="imgs_4" class="fileload_4"/>
			                     		</div>
			                     	</div>
			                     </div>
			                  </div>
			               <div align="center">
			                      <button type="button" id="prev-1" class="btn btn-primary btn-lg">이전 단계로</button>
			                      <button type="button" id="next-3" class="btn btn-primary btn-lg">관광지 등록</button>
			                  </div>
			               </div>
			              
			           </div>
			       </div>
			       </form:form>
			   </div>
		</div>
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
 <script src="resources/js/jquery-3.2.1.min.js"></script>
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script src="resources/js/bootstrap-filestyle.min.js"> </script>
   <script>
   	$(function(){
   		$("#business_file").filestyle({btnClass: "btn-primary"},{placeholder: "No file"},{text: "Find file"});
   		var sel_file;
   		
   		    $('#company_personnel').keyup(function(){
   		         $(this).val($(this).val().replace(/[^0-9]/g,""));
   		    }); 
   		 	
   		 	$('#company_num').keyup(function(event){
   		 	 $(this).val($(this).val().replace(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/,""));
   		 		var num = $('#company_num').val();
   		 		$.post('ajax_companynum',{"num":num},function(ret){
   		 			if(ret != 0){
   		 				$('#numfont').text('데이터베이스에 해당 테스트 값이 이미 존재합니다');
   		 			}
   		 			else{
   		 			$('#numfont').empty();
   		 			}
   		 		});
   		 	});
   		$('.imgs').click(function(){
   			var idx = $(this).index('.imgs');
   			$('.fileload_'+idx).trigger('click');
   		});
   		
		$('.fileload_0').on("change",handleImgFileSelect0);
		$('.fileload_1').on("change",handleImgFileSelect1);
		$('.fileload_2').on("change",handleImgFileSelect2);
		$('.fileload_3').on("change",handleImgFileSelect3);
		$('.fileload_4').on("change",handleImgFileSelect4);
   		
   		
   		function handleImgFileSelect0(e){
   			var files = e.target.files;
   			var filesArr = Array.prototype.slice.call(files);
   			if(files.length == "0"){
   				$('.imgs_0').attr("src","resources/imgs/no-image.png");
   			}
   			filesArr.forEach(function(f){
   				if(!f.type.match("image.*")){
   					alert("이미지 파일만 가능합니다");
   					return;
   				}
   				sel_file = f;
   			
   			var reader = new FileReader();
   			reader.onload = function(e){
   				$('.imgs_0').attr("src",e.target.result);
   			}
   			reader.readAsDataURL(f);
   			});
   		}
   		
		function handleImgFileSelect1(e){
   			var files = e.target.files;
   			var filesArr = Array.prototype.slice.call(files);
   			if(files.length == "0"){
   				$('.imgs_1').attr("src","resources/imgs/no-image.png");
   			}
   			filesArr.forEach(function(f){
   				if(!f.type.match("image.*")){
   					alert("이미지 파일만 가능합니다");
   					return;
   				}
   				sel_file = f;
   			
   			var reader = new FileReader();
   			reader.onload = function(e){
   				$('.imgs_1').attr("src",e.target.result);
   			}
   			reader.readAsDataURL(f);
   			});
   		}
		
		
		function handleImgFileSelect2(e){
   			var files = e.target.files;
   			var filesArr = Array.prototype.slice.call(files);
   			if(files.length == "0"){
   				$('.imgs_2').attr("src","resources/imgs/no-image.png");
   			}
   			filesArr.forEach(function(f){
   				if(!f.type.match("image.*")){
   					alert("이미지 파일만 가능합니다");
   					return;
   				}
   				sel_file = f;
   			
   			var reader = new FileReader();
   			reader.onload = function(e){
   				$('.imgs_2').attr("src",e.target.result);
   			}
   			reader.readAsDataURL(f);
   			});
   			}
		function handleImgFileSelect3(e){
   			var files = e.target.files;
   			var filesArr = Array.prototype.slice.call(files);
   			if(files.length == "0"){
   				$('.imgs_3').attr("src","resources/imgs/no-image.png");
   			}
   			filesArr.forEach(function(f){
   				if(!f.type.match("image.*")){
   					alert("이미지 파일만 가능합니다");
   					return;
   				}
   				sel_file = f;
   			
   			var reader = new FileReader();
   			reader.onload = function(e){
   				$('.imgs_3').attr("src",e.target.result);
   			}
   			reader.readAsDataURL(f);
   			});
   			}
		function handleImgFileSelect4(e){
   			var files = e.target.files;
   			var filesArr = Array.prototype.slice.call(files);
   			if(files.length == "0"){
   				$('.imgs_4').attr("src","resources/imgs/no-image.png");
   			}
   			filesArr.forEach(function(f){
   				if(!f.type.match("image.*")){
   					alert("이미지 파일만 가능합니다");
   					return;
   				}
   				sel_file = f;
   			
   			var reader = new FileReader();
   			reader.onload = function(e){
   				$('.imgs_4').attr("src",e.target.result);
   			}
   			reader.readAsDataURL(f);
   			});
   			}
   	});

	function sample4_execDaumPostcode() {
		$('#sample4_roadAddress').val("");
		new daum.Postcode(
				{
					oncomplete : function(data) {

						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						document.getElementById('sample4_roadAddress').value = fullRoadAddr;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
        
        var navListItems = $('ul.setup-panel li a'),
            allWells = $('.setup-content');
 
        allWells.hide();
 
        navListItems.click(function(e)
        {
            e.preventDefault();
            var $target = $($(this).attr('href')),
                $item = $(this).closest('li');
            
            if (!$item.hasClass('disabled')) {
                navListItems.closest('li').removeClass('active');
                $item.addClass('active');
                allWells.hide();
                $target.show();
            }
        });
        

        $('ul.setup-panel li.active a').trigger('click');
        
        // DEMO ONLY //
        $('#next-2').on('click', function(e) {
            $('ul.setup-panel li:eq(1)').removeClass('disabled');
            $('ul.setup-panel li a[href="#step-2"]').trigger('click');
        });
        
        $('#next-3').on('click', function(e) {
           var name = $('#company_name').val();
  			var company_class = null;
  			if($('#one:checked').length == 1){
  				$('#company_class').val("개인");
  			}
  			else{
  				$('#company_class').val("법인");
  			}
  			var company_num = $('#company_num').val();
  			var company_conditions = $('#company_conditions').val();
  			var company_event = $('#company_event').val();
  			var company_tel = $('#company_tel').val();
  			var company_add = $('#sample4_roadAddress').val();
  			var business_file = $('#business_file').val();
  			var stime = $('#stime').val();
  			var etime = $('#etime').val();
  			var str_document = $('#str_document').val();
  			if(name == ""){alert("상호명을 입력해주세요");return null;}
  			else if(company_num == ""){alert("사업자 등록번호를 입력해주세요");return null;}
  			else if(company_conditions == ""){alert("업태를 입력해주세요");return null;}
  			else if(company_event == ""){alert("종목을 입력해주세요");return null;}
  			else if(company_tel == ""){alert("대표 전화번호를 입력해주세요");return null;}
  			else if(company_add == ""){alert("사업체 주소를 입력해주세요");return null;}
  			else if(business_file == ""){alert("사업자 등록증을 등록해주세요");return null;}
  			else if(stime == "" || etime == ""){alert("영업시간을 입력해주세요");return null;}
  			else if(str_document ==""){alert("소개글을 입력해주세요");return null;}
  			else{
  				var geocoder = new daum.maps.services.Geocoder();
  				geocoder.addressSearch(company_add, function(result, status) {
  				    // 정상적으로 검색이 완료됐으면 
  				     if (status === daum.maps.services.Status.OK) {
  				       $('#lat').val(result[0].x);
  				       $('#lng').val(result[0].y);
  				       $('#form').submit();
  				     }
  				});
  				
  			}
        });
        $('#prev-1').on('click', function(e) {
            $('ul.setup-panel li a[href="#step-1"]').trigger('click');
        });
    </script>
</body>
</html>