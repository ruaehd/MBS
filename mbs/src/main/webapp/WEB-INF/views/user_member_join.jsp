<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Google Nexus Website Menu</title>
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/footer.css" />
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	</head>
<body>
	<div id="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div id="main">
			<div style="margin-top:68px">
			   <div class="container" style="width:80%;">
			      <div class="w3-display-container" style="height:200px">
			         <div class="w3-display-middle" align="center">
			            <img src="resources/imgs/join.png" style="width:200px; height:100%"/><br/>
			         </div>
			      </div>
			      <div class="container" style="width:64%;height:100px">
			      <div class="row form-group">
			         <div class="col-xs-12">
			            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
			               <li class="active"><a href="#step-1">
			                     <h4 class="list-group-item-heading">약관동의</h4>
			                     <p class="list-group-item-text">First step description</p>
			               </a></li>
			               <li class="disabled"><a href="#step-2">
			                     <h4 class="list-group-item-heading">본인확인</h4>
			                     <p class="list-group-item-text">Second step description</p>
			               </a></li>
			               <li class="disabled"><a href="#step-3">
			                     <h4 class="list-group-item-heading">개인정보</h4>
			                     <p class="list-group-item-text">Third step description</p>
			               </a></li>
			            </ul>
			         </div>
			      </div>
			   </div>
			   <div class="row setup-content" id="step-1">
			           <div class="col-xs-12">
			               <div style="width:80%; margin:0px auto">
			                  <h1> 회원약관</h1>
			                  <div style="border:1px solid #cccccc; width:100%;margin:0px auto;margin-bottom:50px"></div>
			                   <div class="wrapper" style="width:800px; margin:10px auto">
			                      <div style="margin-bottom:10px">
			                         <div class="row" style="margin-bottom:10px">
			                            <div class="col-md-6">
			                               <label>이용약관 (필수)</label>
			                            </div>
			                          <div class="col-md-offset-4 col-md-2">
			                           <div class="form-inline" align="right">
			                                  <label>동의</label>
			                                  <input type="checkbox" class="form-control" name="chk[]" style="width:25px; height:25px;"/>
			                               </div>
			                        </div>
			                         </div>
			                         <div style="margin-bottom:20px">
			                            <textarea class="form-control w3-white" rows="6" style="resize:none" readonly>
			
			
			
			본 약관은 LINE주식회사에서 가져왔으며 실제 이행되진 않습니다.
			
			1. 정의
			
			본 약관에서는 다음 용어를 사용합니다.
			1.1. ‘콘텐츠’란 문장, 음성, 음악, 이미지, 동영상, 소프트웨어, 프로그램, 코드 기타 정보를 말합니다.
			1.2. ‘본 콘텐츠’란 본 서비스를 통해 접속할 수 있는 콘텐츠를 말합니다.
			1.3. ‘투고 콘텐츠’란 고객이 본 서비스에 투고, 송신, 업로드한 콘텐츠를 말합니다.
			1.4. ‘코인’이란 본 서비스가 유상으로 제공하는 서비스 또는 콘텐츠와 교환 가능한 전자적 가상통화를 말합니다.
			1.5. ‘개별 이용약관’이란 본 서비스에 관하여 본 약관과는 별도로 ‘약관’, 가이드라인’, ‘정책’ 등의 명칭으로 당사가 배포 또는 게시한 문서를 말합니다.
			
			2. 약관 동의
			
			2.1 고객은 본 약관의 규정에 따라 본 서비스를 이용해야 합니다. 고객은 본 약관에 대해 유효하고 취소 불가능한 동의를 했을 경우에 한하여 본 서비스를 이용할 수 있습니다.
			2.2. 고객이 미성년자일 경우에는 친권자 등 법정대리인의 동의를 얻은 후 본 서비스를 이용하십시오. 또한 고객이 본 서비스를 사업자를 위해 이용할 경우에는 당해 사업자 역시 본 약관에 동의한 후, 본 서비스를 이용하십시오.
			2.3. 고객은 본 서비스를 실제로 이용함으로써 본 약관에 대해 유효하고 취소 불가능한 동의를 한 것으로 간주됩니다.
			2.4. 본 서비스에 개별 이용약관이 존재할 경우, 고객은 본 약관 외에 개별 이용약관의 규정에 따라 본 서비스를 이용해야 합니다.
			
			3. 약관 변경
			
			필요하다고 당사에서 판단할 경우, 당사는 고객에 대한 사전 통지 없이 언제라도 본 약관 및 개별 이용약관을 변경할 수 있습니다. 변경 후의 본 약관 및 개별 이용약관은 당사가 운영하는 웹사이트 내의 적절한 장소에 게시된 시점부터 그 효력이 발생하며, 본 약관 및 개별 이용약관이 변경된 후에도 고객이 본 서비스를 계속 이용함으로써 변경 후의 본 약관 및 적용된 개별 이용약관에 대해 유효하고 취소 불가능한 동의를 한 것으로 간주됩니다. 이러한 변경 내용은 고객에게 개별적으로 통지할 수 없기 때문에, 본 서비스를 이용할 때에는 수시로 최신의 본 약관 및 적용된 개별 이용약관을 참조하시기 바랍니다.
			
			4. 계정
			
			4.1. 고객은 본 서비스 이용을 위해 고객 자신과 관련된 정보를 등록할 경우, 진실하고 정확하며 완전한 정보를 제공해야 하며 언제나 최신 정보가 적용되도록 수정해야 합니다.
			4.2. 고객은 본 서비스 이용을 위해 패스워드를 등록할 경우, 이를 부정하게 이용당하지 않도록 본인 책임 하에 엄중하게 관리해야 합니다. 당사는 등록된 패스워드를 이용하여 이루어진 일체의 행위를 고객 본인의 행위로 간주할 수 있습니다.
			4.3. 본 서비스에 등록한 고객은 언제라도 계정을 삭제하고 탈퇴할 수 있습니다.
			4.4. 당사는 고객이 본 약관을 위반하거나 또는 위반할 우려가 있다고 인정된 경우, 고객에 대한 사전 통지 없이 계정을 정지 또는 삭제할 수 있습니다.
			4.5. 당사는 마지막 접속 시점부터 １년 이상 경과한 계정을 고객에 대한 사전 통지 없이 삭제할 수 있습니다.
			4.6. 고객이 본 서비스에서 가지는 모든 이용 권한은 이유를 막론하고 계정이 삭제된 시점에 소멸됩니다. 고객의 실수로 계정을 삭제한 경우에도 계정을 복구할 수 없으므로 주의하시기 바랍니다.
			4.7. 본 서비스의 계정은 고객에게 일신전속적으로 귀속됩니다. 고객이 본 서비스에서 가지는 모든 이용권은 제삼자에게 양도, 대여 또는 상속할 수 없습니다.
			
			5. 프라이버시
			
			5.1. 당사는 고객의 프라이버시를 존중합니다.
			5.2. 당사는 고객의 프라이버시 정보와 개인정보를 LINE 개인정보 취급방침에 따라 적절하게 취급합니다.
			5.3.당사는 고객으로부터 수집한 정보를 안전하게 관리하기 위해 보안에 최대한 주의를 기울이고 있습니다.
			
			6. 서비스 제공
			
			6.1. 고객은 본 서비스를 이용하는 데 있어 필요한 PC나 휴대전화 단말기, 통신 기기, 운영 체제, 통신 수단 및 전력 등을 고객의 비용과 책임 하에 준비해야 합니다.
			6.2. 당사는 본 서비스의 전부 또는 일부를 연령, 본인 확인 여부, 등록정보 유무, 기타 당사에서 필요하다고 판단한 조건을 만족시키는 고객에 한하여 제공할 수 있습니다.
			6.3. 당사는 필요하다고 판단될 경우, 고객에 대한 사전 통지 없이 언제라도 본 서비스의 전부 또는 일부 내용을 변경할 수 있으며 또한 그 제공을 중지할 수 있습니다.
			
			7. 긴급 신고 기능 미적용
			
			본 서비스는 경찰기관, 해상보안기관, 소방기관 기타 기관에 대한 긴급 신고 수단을 제공하지 않습니다
			
			8. 광고 게재
			
			당사는 본 서비스에 당사 또는 제삼자의 광고를 게재할 수 있습니다.
			
			9. 제휴 파트너 서비스
			
			본 서비스는 당사와 제휴한 다른 사업자가 제공하는 서비스 또는 콘텐츠가 포함되는 경우가 있습니다. 이러한 서비스 또는 콘텐츠에 대한 책임은 이를 제공하는 사업자에게 있습니다. 또한, 이러한 서비스 또는 콘텐츠에는 이를 제공하는 사업자가 정한 이용약관 기타 조건이 적용되는 경우가 있습니다.
			
			10.콘텐츠
			
			10.1.당사는 당사가 제공하는 본 콘텐츠에 대해 양도 및 재허락이 불가능하고 비독점적이며 본 서비스의 이용을 유일한 목적으로 하는 이용권을 고객에게 부여합니다.
			10.2. 고객은 이용료, 이용 기간 등의 이용 조건이 별도로 규정된 본 콘텐츠를 이용할 경우, 이와 같은 이용 조건에 따라야 합니다. 본 서비스의 화면에 ‘구입’, ‘판매’ 등이 표기되어 있을 경우에도 당사가 고객에게 제공하는 본 콘텐츠에 관한 지적재산권 기타 권리는 고객에게 이전되지 않으며, 고객에게는 상기 이용권만이 부여됩니다.
			10.3. 고객은 본 콘텐츠를 본 서비스에서 미리 정한 이용 형태를 넘어서 이용(복제, 송신, 전재, 수정 등의 행위를 포함)해서는 안 됩니다.
			10.4. 투고 콘텐츠의 백업은 고객이 직접 실시해야 합니다. 당사는 투고 콘텐츠의 백업을 실시할 의무를 갖지 않습니다.
			10.5. 본 서비스는 여러 고객이 투고, 수정, 삭제 등을 할 수 있는 편집 기능을 포함하는 경우가 있습니다. 이때 고객은 본인의 투고 콘텐츠에 대한 다른 고객의 편집을 허락하는 것으로 합니다.
			10.6. 고객은 투고 콘텐츠에 대해 보유하는 권리를 기존과 다름없이 보유하며, 당사가 이 권리를 취득하지는 않습니다. 단, 투고 콘텐츠 중 친구관계가 아닌 다른 고객에게 일반적으로 공개되는 것에 한하여 고객은 이를 서비스와 프로모션에 이용할 수 있는 권리(당사가 필요하고 적절하다고 판단한 범위 내에서 생략 등의 변경을 가할 수 있는 권리를 포함하며, 이러한 이용 권한을 당사와 제휴하는 제삼자에게 재허락할 수 있는 권리를 포함함)를 당사에 대해 무상으로 기한과 지역의 제한 없이 허락하는 것으로 간주합니다.
			10.7. 당사는 법령 또는 본 약관의 준수 상황 등을 확인할 필요가 있을 경우, 투고 콘텐츠의 내용을 확인할 수 있습니다. 단, 당사가 그러한 확인 작업을 실시할 의무를 가지는 것은 아닙니다.
			10.8. 당사는 고객이 투고 콘텐츠에 관하여 법령 혹은 본 약관을 위반하거나 또는 위반할 우려가 있다고 인정한 경우, 기타 업무상 필요한 경우, 고객에게 사전 통지 없이 투고 콘텐츠를 삭제하는 등의 방법을 통하여 본 서비스에서 투고 콘텐츠를 이용하는 것을 제한할 수 있습니다.</textarea>
			                         </div>
			                      </div>
			                      
			                      <div style="margin-bottom:10px">
			                         <div class="row" style="margin-bottom:10px">
			                            <div class="col-md-6">
			                               <label>개인정보 수집 및 이용 (필수)</label>
			                            </div>
			                          <div class="col-md-offset-4 col-md-2">
			                           <div class="form-inline" align="right">
			                                  <label>동의</label>
			                                  <input type="checkbox" class="form-control" name="chk[]" style="width:25px; height:25px;"/>
			                               </div>
			                        </div>
			                         </div>
			                         <div style="margin-bottom:20px">
			                            <textarea class="form-control w3-white" rows="6" style="resize:none" readonly>
			
			
			
			▷수집하는 개인정보 항목
			- 성명, 주민등록번호, 주소, 연락처, E-Mail
			▷ 수집목적
			-빅데이터 분석 및  프로젝트 활용
			▷ 보관기간
			- 프로젝트인원이 더이상 회원정보가 필요없어질 시에  수집된 개인정보 자료는 삭제됩니다.
			※ 개인정보를 악용하거나 이용하는 일이 없이 프로젝트 진행시에만 사용될 예정이니 안심하시기 바랍니다.</textarea>
			                         </div>
			                      </div>
			                      
			                      <div style="margin-bottom:10px">
			                         <div class="row" style="margin-bottom:10px">
			                            <div class="col-md-6">
			                               <label>광고성 정보 수신 (선택)</label>
			                            </div>
			                          <div class="col-md-offset-4 col-md-2">
			                           <div class="form-inline" align="right">
			                                  <label>동의</label>
			                                  <input type="checkbox" class="form-control" style="width:25px; height:25px;"/>
			                               </div>
			                        </div>
			                         </div>
			                         <div style="margin-bottom:20px">
			                            <textarea class="form-control w3-white" rows="6" style="resize:none" readonly> 사실 광고는 있지 않지만 체크항목 필수,선택 구별을 하기위한 항목이니 안심하셔도 됩니다.</textarea>
			                         </div>
			                      </div>
			                      <div style="border:1px solid #cccccc; width:100%;margin-bottom:20px;margin-top:50px; margin-left:auto;margin-right:auto"></div>
			                         <div class="row" style="margin-bottom:10px">
			                            <div class="col-md-6"></div>
			                          <div class="col-md-offset-3 col-md-3">
			                           <div class="form-inline" align="right" style="margin-left:25px">
			                                  <label>전체동의</label>
			                                  <input type="checkbox" class="form-control" id="allcheck" style="width:25px; height:25px;"/>
			                               </div>
			                        </div>
			                      </div>
			
			                   </div>
			                   
			                   <div align="center" style="margin-bottom:20px;margin-top:50px">
			                      <a href="index.do"><button class="btn btn-primary">홈으로</button></a>
			                      <button id="next-2" class="btn btn-primary">다음단계로</button>
			                   </div>
			               </div>
			           </div>
			       </div>
			       <div class="row setup-content" id="step-2">
			           <div class="col-xs-12">
			               <div class="col-md-12" style="width:100%;margin:0px auto">
			                  <div style="margin-left:20%">
			                      <h1>본인확인</h1>
			                      </div>
			                   <div style="border:1px solid #cccccc; width:64%;margin:0px auto;margin-bottom:50px">
			                    </div>
			                   <form name="auth" class="form-horizontal" action="emailAuth.do" target="emailAuth">
			                      <div class="form-group">
			                     <label class="col-sm-4 control-label" for="email">본인확인</label>
			                     <div class="col-sm-5">
			                        <div class="form-inline">
			                           <input type="text" class="form-control" id="email" name="email" placeholder="이메일 주소를 입력하세요" />
			                           <input type="button" class="btn btn-info" value="이메일 인증" onClick="openAuth()" style="margin-left:20px">
			                        </div>
			                     </div>
			                  </div>
			                  <div class="form-group">
			                     <label class="col-sm-4 control-label"></label>
			                     <div class="col-sm-5">
			                        <input type="text" class="form-control" name="emailauth" readonly>
			                     </div>
			                  </div>
			                  <div class="form-group">
			                     <label class="col-sm-4 control-label">자동가입 방지</label>
			                     <div class="col-sm-5">
			                        <div class="g-recaptcha" id ="grecaptcha" data-sitekey="6LdfiEoUAAAAANEiw_ZLNO_1pmL3fj-Ttt1rX44c"></div>
			                     </div>
			                  </div>
			                   </form>
			                   <div align="center" style="margin-bottom:20px;margin-top:50px">
			                      <button id="prev-1" class="btn btn-primary">이전단계로</button>
			                      <button id="next-3" class="btn btn-primary">다음단계로</button>
			                  </div>
			            </div>   
			           </div>
			       </div>
			      
			      <div  class="container setup-content" style="width:80%;padding:30px;margin:0px auto"  align="center" id="step-3">
			      <form:form action="user_join.do" method="post" modelAttribute="vo" id="form">
			         <div style="margin:0px auto">
			            <div align="left">
			                  <h1>개인정보입력</h1>
			               </div>
			           </div>
			                   <div style="border:1px solid #cccccc; width:100%;margin:0px auto;margin-bottom:50px">
			                  </div>
			                  <div class="container">
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  아이디
			               </div>
			               <div class="col-md-4">
			                  <form:input type="text" path="mb_id" id="mb_id" class="w3-input w3-round w3-border form-control" />
			               </div>
			            
			               <div class="col-md-1" style="margin-left:20px">
			                  <input type="button" id="idcheck" class="btn btn-info w3-red" value="중복확인"/>
			               </div>
			            </div>
			            <div class="row menu" style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  암호
			               </div>
			               <div class="col-md-4">
			                  <form:input type="password" path="mb_pw" id="mb_pw" maxlength="16" class="w3-input w3-round w3-border form-control" />
			               </div>
			               <div id="exp"></div>
			            </div>
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  암호재확인
			               </div>
			               <div class="col-md-4">
			                  <input type="password" id="mb_repw"  size="16" class="w3-input w3-round w3-border form-control" />
			               </div>
			               <div id="reexp"></div>
			            </div>
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			               이름
			               </div>
			               <div class="col-md-4">
			                  <form:input type="text" path="mb_name" id="mb_name" class="w3-input w3-round w3-border form-control" />
			               </div>
			            </div>
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  성별
			               </div>
			               <div class="col-md-4 row">
			               	<div class="col-md-6">
			                  <button type="button" id="man" class="w3-button w3-round w3-border form-control gender">남성</button>
			                </div>
			                <div class="col-md-6">
			                  <button type="button" id="woman" class="w3-button w3-round w3-border form-control gender">여성</button>
			                </div>
			                  <form:input type="hidden" path="mb_gender" value="" id="gender"/>
			               </div>
			            </div>
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  생년월일
			               </div>
			               <div class="col-md-4">
			                  <form:input type="text" path="mb_birth" id="mb_brith" value="" class="w3-input w3-round w3-border form-control w3-white" readonly="true"/>
			               </div>
			            </div>
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  이메일
			               </div>
			               <div class="col-md-4">
			                  <form:input type="text" path="mb_email" id="mb_email" class="w3-input w3-round w3-border form-control" readonly="true"/>
			               </div>
			            </div>
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  전화번호
			               </div>
			               <div class="form-inline col-md-4">
			                  <input type="text" id="tel1" class="w3-input w3-round w3-border form-control" maxlength="3" style="width:70px"/>-
			                  <input type="text" id="tel2"class="w3-input w3-round w3-border form-control" maxlength="4" style="width:90px"/>-
			                  <input type="text" id="tel3"class="w3-input w3-round w3-border form-control" maxlength="4" style="width:90px"/>
			                  <form:input type="hidden" path="mb_tel" value=""/>
			               </div>
			         </div>
			         <div style="margin:50px auto">
			                  <button type="button" id="abc" class="btn btn-primary" style="width:300px">회원가입</button>
			               </div>
			         </div>  
			   		</form:form> 
			      </div>
			   </div>
			   </div>
		</div>
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
=======
<jsp:include page="header.jsp"></jsp:include>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="//code.jquery.com/jquery-1.10.2.js"></script>
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<div style="margin-top:68px">
   <div class="container" style="width:80%;">
      <div class="w3-display-container" style="height:200px">
         <div class="w3-display-middle" align="center">
            <img src="resources/imgs/join.png" style="width:200px; height:100%"/><br/>
         </div>
      </div>
      <div class="container" style="width:64%;height:100px">
      <div class="row form-group">
         <div class="col-xs-12">
            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
               <li class="active"><a href="#step-1">
                     <h4 class="list-group-item-heading">약관동의</h4>
                     <p class="list-group-item-text">First step description</p>
               </a></li>
               <li class="disabled"><a href="#step-2">
                     <h4 class="list-group-item-heading">본인확인</h4>
                     <p class="list-group-item-text">Second step description</p>
               </a></li>
               <li class="disabled"><a href="#step-3">
                     <h4 class="list-group-item-heading">개인정보</h4>
                     <p class="list-group-item-text">Third step description</p>
               </a></li>
            </ul>
         </div>
      </div>
   </div>
   <div class="row setup-content" id="step-1">
           <div class="col-xs-12">
               <div style="width:80%; margin:0px auto">
                  <h1> 회원약관</h1>
                  <div style="border:1px solid #cccccc; width:100%;margin:0px auto;margin-bottom:50px"></div>
                   <div class="wrapper" style="width:800px; margin:10px auto">
                      <div style="margin-bottom:10px">
                         <div class="row" style="margin-bottom:10px">
                            <div class="col-md-6">
                               <label>이용약관 (필수)</label>
                            </div>
                          <div class="col-md-offset-4 col-md-2">
                           <div class="form-inline" align="right">
                                  <label>동의</label>
                                  <input type="checkbox" class="form-control" name="chk[]" style="width:25px; height:25px;"/>
                               </div>
                        </div>
                         </div>
                         <div style="margin-bottom:20px">
                            <textarea class="form-control w3-white" rows="6" style="resize:none" readonly>



본 약관은 LINE주식회사에서 가져왔으며 실제 이행되진 않습니다.

1. 정의

본 약관에서는 다음 용어를 사용합니다.
1.1. ‘콘텐츠’란 문장, 음성, 음악, 이미지, 동영상, 소프트웨어, 프로그램, 코드 기타 정보를 말합니다.
1.2. ‘본 콘텐츠’란 본 서비스를 통해 접속할 수 있는 콘텐츠를 말합니다.
1.3. ‘투고 콘텐츠’란 고객이 본 서비스에 투고, 송신, 업로드한 콘텐츠를 말합니다.
1.4. ‘코인’이란 본 서비스가 유상으로 제공하는 서비스 또는 콘텐츠와 교환 가능한 전자적 가상통화를 말합니다.
1.5. ‘개별 이용약관’이란 본 서비스에 관하여 본 약관과는 별도로 ‘약관’, 가이드라인’, ‘정책’ 등의 명칭으로 당사가 배포 또는 게시한 문서를 말합니다.

2. 약관 동의

2.1 고객은 본 약관의 규정에 따라 본 서비스를 이용해야 합니다. 고객은 본 약관에 대해 유효하고 취소 불가능한 동의를 했을 경우에 한하여 본 서비스를 이용할 수 있습니다.
2.2. 고객이 미성년자일 경우에는 친권자 등 법정대리인의 동의를 얻은 후 본 서비스를 이용하십시오. 또한 고객이 본 서비스를 사업자를 위해 이용할 경우에는 당해 사업자 역시 본 약관에 동의한 후, 본 서비스를 이용하십시오.
2.3. 고객은 본 서비스를 실제로 이용함으로써 본 약관에 대해 유효하고 취소 불가능한 동의를 한 것으로 간주됩니다.
2.4. 본 서비스에 개별 이용약관이 존재할 경우, 고객은 본 약관 외에 개별 이용약관의 규정에 따라 본 서비스를 이용해야 합니다.

3. 약관 변경

필요하다고 당사에서 판단할 경우, 당사는 고객에 대한 사전 통지 없이 언제라도 본 약관 및 개별 이용약관을 변경할 수 있습니다. 변경 후의 본 약관 및 개별 이용약관은 당사가 운영하는 웹사이트 내의 적절한 장소에 게시된 시점부터 그 효력이 발생하며, 본 약관 및 개별 이용약관이 변경된 후에도 고객이 본 서비스를 계속 이용함으로써 변경 후의 본 약관 및 적용된 개별 이용약관에 대해 유효하고 취소 불가능한 동의를 한 것으로 간주됩니다. 이러한 변경 내용은 고객에게 개별적으로 통지할 수 없기 때문에, 본 서비스를 이용할 때에는 수시로 최신의 본 약관 및 적용된 개별 이용약관을 참조하시기 바랍니다.

4. 계정

4.1. 고객은 본 서비스 이용을 위해 고객 자신과 관련된 정보를 등록할 경우, 진실하고 정확하며 완전한 정보를 제공해야 하며 언제나 최신 정보가 적용되도록 수정해야 합니다.
4.2. 고객은 본 서비스 이용을 위해 패스워드를 등록할 경우, 이를 부정하게 이용당하지 않도록 본인 책임 하에 엄중하게 관리해야 합니다. 당사는 등록된 패스워드를 이용하여 이루어진 일체의 행위를 고객 본인의 행위로 간주할 수 있습니다.
4.3. 본 서비스에 등록한 고객은 언제라도 계정을 삭제하고 탈퇴할 수 있습니다.
4.4. 당사는 고객이 본 약관을 위반하거나 또는 위반할 우려가 있다고 인정된 경우, 고객에 대한 사전 통지 없이 계정을 정지 또는 삭제할 수 있습니다.
4.5. 당사는 마지막 접속 시점부터 １년 이상 경과한 계정을 고객에 대한 사전 통지 없이 삭제할 수 있습니다.
4.6. 고객이 본 서비스에서 가지는 모든 이용 권한은 이유를 막론하고 계정이 삭제된 시점에 소멸됩니다. 고객의 실수로 계정을 삭제한 경우에도 계정을 복구할 수 없으므로 주의하시기 바랍니다.
4.7. 본 서비스의 계정은 고객에게 일신전속적으로 귀속됩니다. 고객이 본 서비스에서 가지는 모든 이용권은 제삼자에게 양도, 대여 또는 상속할 수 없습니다.

5. 프라이버시

5.1. 당사는 고객의 프라이버시를 존중합니다.
5.2. 당사는 고객의 프라이버시 정보와 개인정보를 LINE 개인정보 취급방침에 따라 적절하게 취급합니다.
5.3.당사는 고객으로부터 수집한 정보를 안전하게 관리하기 위해 보안에 최대한 주의를 기울이고 있습니다.

6. 서비스 제공

6.1. 고객은 본 서비스를 이용하는 데 있어 필요한 PC나 휴대전화 단말기, 통신 기기, 운영 체제, 통신 수단 및 전력 등을 고객의 비용과 책임 하에 준비해야 합니다.
6.2. 당사는 본 서비스의 전부 또는 일부를 연령, 본인 확인 여부, 등록정보 유무, 기타 당사에서 필요하다고 판단한 조건을 만족시키는 고객에 한하여 제공할 수 있습니다.
6.3. 당사는 필요하다고 판단될 경우, 고객에 대한 사전 통지 없이 언제라도 본 서비스의 전부 또는 일부 내용을 변경할 수 있으며 또한 그 제공을 중지할 수 있습니다.

7. 긴급 신고 기능 미적용

본 서비스는 경찰기관, 해상보안기관, 소방기관 기타 기관에 대한 긴급 신고 수단을 제공하지 않습니다

8. 광고 게재

당사는 본 서비스에 당사 또는 제삼자의 광고를 게재할 수 있습니다.

9. 제휴 파트너 서비스

본 서비스는 당사와 제휴한 다른 사업자가 제공하는 서비스 또는 콘텐츠가 포함되는 경우가 있습니다. 이러한 서비스 또는 콘텐츠에 대한 책임은 이를 제공하는 사업자에게 있습니다. 또한, 이러한 서비스 또는 콘텐츠에는 이를 제공하는 사업자가 정한 이용약관 기타 조건이 적용되는 경우가 있습니다.

10.콘텐츠

10.1.당사는 당사가 제공하는 본 콘텐츠에 대해 양도 및 재허락이 불가능하고 비독점적이며 본 서비스의 이용을 유일한 목적으로 하는 이용권을 고객에게 부여합니다.
10.2. 고객은 이용료, 이용 기간 등의 이용 조건이 별도로 규정된 본 콘텐츠를 이용할 경우, 이와 같은 이용 조건에 따라야 합니다. 본 서비스의 화면에 ‘구입’, ‘판매’ 등이 표기되어 있을 경우에도 당사가 고객에게 제공하는 본 콘텐츠에 관한 지적재산권 기타 권리는 고객에게 이전되지 않으며, 고객에게는 상기 이용권만이 부여됩니다.
10.3. 고객은 본 콘텐츠를 본 서비스에서 미리 정한 이용 형태를 넘어서 이용(복제, 송신, 전재, 수정 등의 행위를 포함)해서는 안 됩니다.
10.4. 투고 콘텐츠의 백업은 고객이 직접 실시해야 합니다. 당사는 투고 콘텐츠의 백업을 실시할 의무를 갖지 않습니다.
10.5. 본 서비스는 여러 고객이 투고, 수정, 삭제 등을 할 수 있는 편집 기능을 포함하는 경우가 있습니다. 이때 고객은 본인의 투고 콘텐츠에 대한 다른 고객의 편집을 허락하는 것으로 합니다.
10.6. 고객은 투고 콘텐츠에 대해 보유하는 권리를 기존과 다름없이 보유하며, 당사가 이 권리를 취득하지는 않습니다. 단, 투고 콘텐츠 중 친구관계가 아닌 다른 고객에게 일반적으로 공개되는 것에 한하여 고객은 이를 서비스와 프로모션에 이용할 수 있는 권리(당사가 필요하고 적절하다고 판단한 범위 내에서 생략 등의 변경을 가할 수 있는 권리를 포함하며, 이러한 이용 권한을 당사와 제휴하는 제삼자에게 재허락할 수 있는 권리를 포함함)를 당사에 대해 무상으로 기한과 지역의 제한 없이 허락하는 것으로 간주합니다.
10.7. 당사는 법령 또는 본 약관의 준수 상황 등을 확인할 필요가 있을 경우, 투고 콘텐츠의 내용을 확인할 수 있습니다. 단, 당사가 그러한 확인 작업을 실시할 의무를 가지는 것은 아닙니다.
10.8. 당사는 고객이 투고 콘텐츠에 관하여 법령 혹은 본 약관을 위반하거나 또는 위반할 우려가 있다고 인정한 경우, 기타 업무상 필요한 경우, 고객에게 사전 통지 없이 투고 콘텐츠를 삭제하는 등의 방법을 통하여 본 서비스에서 투고 콘텐츠를 이용하는 것을 제한할 수 있습니다.</textarea>
                         </div>
                      </div>
                      
                      <div style="margin-bottom:10px">
                         <div class="row" style="margin-bottom:10px">
                            <div class="col-md-6">
                               <label>개인정보 수집 및 이용 (필수)</label>
                            </div>
                          <div class="col-md-offset-4 col-md-2">
                           <div class="form-inline" align="right">
                                  <label>동의</label>
                                  <input type="checkbox" class="form-control" name="chk[]" style="width:25px; height:25px;"/>
                               </div>
                        </div>
                         </div>
                         <div style="margin-bottom:20px">
                            <textarea class="form-control w3-white" rows="6" style="resize:none" readonly>



▷수집하는 개인정보 항목
- 성명, 주민등록번호, 주소, 연락처, E-Mail
▷ 수집목적
-빅데이터 분석 및  프로젝트 활용
▷ 보관기간
- 프로젝트인원이 더이상 회원정보가 필요없어질 시에  수집된 개인정보 자료는 삭제됩니다.
※ 개인정보를 악용하거나 이용하는 일이 없이 프로젝트 진행시에만 사용될 예정이니 안심하시기 바랍니다.</textarea>
                         </div>
                      </div>
                      
                      <div style="margin-bottom:10px">
                         <div class="row" style="margin-bottom:10px">
                            <div class="col-md-6">
                               <label>광고성 정보 수신 (선택)</label>
                            </div>
                          <div class="col-md-offset-4 col-md-2">
                           <div class="form-inline" align="right">
                                  <label>동의</label>
                                  <input type="checkbox" class="form-control" style="width:25px; height:25px;"/>
                               </div>
                        </div>
                         </div>
                         <div style="margin-bottom:20px">
                            <textarea class="form-control w3-white" rows="6" style="resize:none" readonly> 사실 광고는 있지 않지만 체크항목 필수,선택 구별을 하기위한 항목이니 안심하셔도 됩니다.</textarea>
                         </div>
                      </div>
                      <div style="border:1px solid #cccccc; width:100%;margin-bottom:20px;margin-top:50px; margin-left:auto;margin-right:auto"></div>
                         <div class="row" style="margin-bottom:10px">
                            <div class="col-md-6"></div>
                          <div class="col-md-offset-3 col-md-3">
                           <div class="form-inline" align="right" style="margin-left:25px">
                                  <label>전체동의</label>
                                  <input type="checkbox" class="form-control" id="allcheck" style="width:25px; height:25px;"/>
                               </div>
                        </div>
                      </div>

                   </div>
                   
                   <div align="center" style="margin-bottom:20px;margin-top:50px">
                      <a href="index.do"><button class="btn btn-primary">홈으로</button></a>
                      <button id="next-2" class="btn btn-primary">다음단계로</button>
                   </div>
               </div>
           </div>
       </div>
       <div class="row setup-content" id="step-2">
           <div class="col-xs-12">
               <div class="col-md-12" style="width:100%;margin:0px auto">
                  <div style="margin-left:20%">
                      <h1>본인확인</h1>
                      </div>
                   <div style="border:1px solid #cccccc; width:64%;margin:0px auto;margin-bottom:50px">
                    </div>
                   <form name="auth" class="form-horizontal" action="emailAuth.do" target="emailAuth">
                      <div class="form-group">
                     <label class="col-sm-4 control-label" for="email">본인확인</label>
                     <div class="col-sm-5">
                        <div class="form-inline">
                           <input type="text" class="form-control" id="email" name="email" placeholder="이메일 주소를 입력하세요" />
                           <input type="button" class="btn btn-info" value="이메일 인증" onClick="openAuth()" style="margin-left:20px">
                        </div>
                     </div>
                  </div>
                  <div class="form-group">
                     <label class="col-sm-4 control-label"></label>
                     <div class="col-sm-5">
                        <input type="text" class="form-control" name="emailauth" readonly>
                     </div>
                  </div>
                  <div class="form-group">
                     <label class="col-sm-4 control-label">자동가입 방지</label>
                     <div class="col-sm-5">
                        <div class="g-recaptcha" id ="grecaptcha" data-sitekey="6LdfiEoUAAAAANEiw_ZLNO_1pmL3fj-Ttt1rX44c"></div>
                     </div>
                  </div>
                   </form>
                   <div align="center" style="margin-bottom:20px;margin-top:50px">
                      <button id="prev-1" class="btn btn-primary">이전단계로</button>
                      <button id="next-3" class="btn btn-primary">다음단계로</button>
                  </div>
            </div>   
           </div>
       </div>
      
      <div  class="container setup-content" style="width:80%;padding:30px;margin:0px auto"  align="center" id="step-3">
      <form:form action="user_join.do" method="post" modelAttribute="vo" id="form">
         <div style="margin:0px auto">
            <div align="left">
                  <h1>개인정보입력</h1>
               </div>
           </div>
                   <div style="border:1px solid #cccccc; width:100%;margin:0px auto;margin-bottom:50px">
                  </div>
                  <div class="container">
            <div class="row menu"  style="margin-bottom:20px">
               <div class="col-md-offset-3 col-md-3" style="width:100px">
                  아이디
               </div>
               <div class="col-md-4">
                  <form:input type="text" path="mb_id" id="mb_id" class="w3-input w3-round w3-border form-control" />
               </div>
            
               <div class="col-md-1" style="margin-left:20px">
                  <input type="button" id="idcheck" class="btn btn-info w3-red" value="중복확인"/>
               </div>
            </div>
            <div class="row menu" style="margin-bottom:20px">
               <div class="col-md-offset-3 col-md-3" style="width:100px">
                  암호
               </div>
               <div class="col-md-4">
                  <form:input type="password" path="mb_pw" id="mb_pw" maxlength="16" class="w3-input w3-round w3-border form-control" />
               </div>
               <div id="exp"></div>
            </div>
            <div class="row menu"  style="margin-bottom:20px">
               <div class="col-md-offset-3 col-md-3" style="width:100px">
                  암호재확인
               </div>
               <div class="col-md-4">
                  <input type="password" id="mb_repw"  size="16" class="w3-input w3-round w3-border form-control" />
               </div>
               <div id="reexp"></div>
            </div>
            <div class="row menu"  style="margin-bottom:20px">
               <div class="col-md-offset-3 col-md-3" style="width:100px">
               이름
               </div>
               <div class="col-md-4">
                  <form:input type="text" path="mb_name" id="mb_name" class="w3-input w3-round w3-border form-control" />
               </div>
            </div>
            <div class="row menu"  style="margin-bottom:20px">
               <div class="col-md-offset-3 col-md-3" style="width:100px">
                  성별
               </div>
               <div class="col-md-4 row">
               	<div class="col-md-6">
                  <button type="button" id="man" class="w3-button w3-round w3-border form-control gender">남성</button>
                </div>
                <div class="col-md-6">
                  <button type="button" id="woman" class="w3-button w3-round w3-border form-control gender">여성</button>
                </div>
                  <form:input type="hidden" path="mb_gender" value="" id="gender"/>
               </div>
            </div>
            <div class="row menu"  style="margin-bottom:20px">
               <div class="col-md-offset-3 col-md-3" style="width:100px">
                  생년월일
               </div>
               <div class="col-md-4">
                  <form:input type="text" path="mb_birth" id="mb_brith" value="" class="w3-input w3-round w3-border form-control w3-white" readonly="true"/>
               </div>
            </div>
            <div class="row menu"  style="margin-bottom:20px">
               <div class="col-md-offset-3 col-md-3" style="width:100px">
                  이메일
               </div>
               <div class="col-md-4">
                  <form:input type="text" path="mb_email" id="mb_email" class="w3-input w3-round w3-border form-control" readonly="true"/>
               </div>
            </div>
            <div class="row menu"  style="margin-bottom:20px">
               <div class="col-md-offset-3 col-md-3" style="width:100px">
                  전화번호
               </div>
               <div class="form-inline col-md-4">
                  <input type="text" id="tel1" class="w3-input w3-round w3-border form-control" maxlength="3" style="width:70px"/>-
                  <input type="text" id="tel2"class="w3-input w3-round w3-border form-control" maxlength="4" style="width:90px"/>-
                  <input type="text" id="tel3"class="w3-input w3-round w3-border form-control" maxlength="4" style="width:90px"/>
                  <form:input type="hidden" path="mb_tel" value=""/>
               </div>
         </div>
         <div style="margin:50px auto">
                  <button type="button" id="abc" class="btn btn-primary" style="width:300px">회원가입</button>
               </div>
         </div>  
   		</form:form> 
      </div>
   </div>
   </div>
>>>>>>> branch 'final_lkh' of https://github.com/ruaehd/MBS.git
  <script>
           
  $(document).ready(function() {
	  var pcheck = 0;
	  var repcheck = 0;
	  $('#idcheck').click(function(){
   		 $('#idcheck').removeClass('w3-green');
   		 $('#idcheck').addClass('w3-red');
		  var a = $('#mb_id').val();
		  if(a == ""){
			  alert('아이디를 입력해주세요');
			  return null;
		  }
		  $.post('ajax_idcheck.do',{"id":a},function(ret){
	      	if(ret == 0){
	      		 alert('이 아이디는 가입이 가능합니다 !');
	       		 $('#idcheck').removeClass('w3-red');
	      		 $('#idcheck').addClass('w3-green');
	      	}
	      	else if(ret == 1){
	      		alert('동일한 아이디가 존재합니다 다른 아이디를 입력해주세요');
	      		$('#idcheck').removeClass('w3-green');
	      		$('#idcheck').addClass('w3-red');
	      	}
	      	else{
	      		alert('중복확인에 실패하셨습니다 다시 눌러주세요 !');
	      		return null;
	      	}
	      });
	  });
	
		$('.gender').click(function(){
			  var gein = $('.gender').index(this);
			$('.gender').removeClass('w3-blue w3-hover-blue');
			$('.gender').eq(gein).addClass('w3-blue w3-hover-blue');
		});
	  
			$('#mb_pw').keyup(function(event){
			if($('#mb_repw').val() != ""){
				if($('#mb_pw').val() != $('#mb_repw').val()){
					$('#reexp').empty();
					$('#reexp').append('<font color="red" style="font-size:12px;margin-left:20px">비밀번호가 일치하지 않습니다</font>');
					repcheck = 0;
				}
				else if($('#mb_pw').val() == $('#mb_repw').val()){
					$('#reexp').empty();
					$('#reexp').append('<font color="green" style="font-size:12px;margin-left:20px">비밀번호가 일치합니다</font>');
					repcheck = 1;
				}
				else if($('#mb_repw').val() == ""){
					if($('#mb_pw').val() != $('#mb_repw').val()){
						$('#reexp').empty();
						$('#reexp').append('<font color="red" style="font-size:12px;margin-left:20px">비밀번호가 일치하지 않습니다</font>');
						repcheck = 0;
					}
				}
			}
			if($('#exp').text() == ""){
				if($('#mb_pw').val().length < 8 || $('#mb_pw').val().length > 16){
					$('#exp').append('<font color="red" style="font-size:12px;margin-left:20px">*비밀번호는 8자 이상 16자 이하로 작성해주세요</font>');
					pcheck = 0;
				}
			}
			else if($('#exp').text() != "" ){
				if($('#mb_pw').val().length >= 8 && $('#mb_pw').val().length <= 16){
					$('#exp').empty();
					pcheck = 1;
				}
			}	
		});
	
		$('#mb_repw').keyup(function(event){
			if($('#mb_pw').val() != $('#mb_repw').val()){
				$('#reexp').empty();
				$('#reexp').append('<font color="red" style="font-size:12px;margin-left:20px">비밀번호가 일치하지 않습니다</font>');
				repcheck = 0;
			}
			else if($('#mb_pw').val() == $('#mb_repw').val()){
				$('#reexp').empty();
				$('#reexp').append('<font color="green" style="font-size:12px;margin-left:20px">비밀번호가 일치합니다</font>');
				repcheck = 1;
			}
	
		});
           $('#abc').click(function(){
        	  	 var a = $('#mb_id').val();
             	 var b = $('#mb_pw').val();
             	 var r = $('#mb_repw').val();
                 var c = $('#mb_name').val();
                 var d = $('#mb_brith').val();   
                 var e = $('#mb_email').val();
                 var t1 = $('#tel1').val();
                 var t2 = $('#tel2').val();
                 var t3 = $('#tel3').val();
                 if(a == ""){alert('아이디를 입력해주세요 !');$('#mb_id').focus(); return null}
                 else if(b == ""){alert('암호를 입력해주세요 !');$('#mb_pw').focus(); return null}
                 else if(c == ""){alert('이름을 입력해주세요 !');$('#mb_name').focus(); return null}
                 else if(d == ""){alert('생년월일을 입력해주세요 !');$('#mb_birth').focus(); return null}
                 else if(e == ""){alert('이메일을 입력해주세요 !');$('#mb_email').focus(); return null}
                 else if(t1 == "" ||t2 == "" ||t3 == ""){alert('전화번호를 입력해주세요 !');$('#mb_tel').focus(); return null}
                 else if($('#idcheck').hasClass('w3-red')){alert('중복확인을 해주세요');return null}
                 else if(pcheck == 0 || repcheck == 0){alert('암호 , 암호재확인 규정에 맞춰주세요.');$('#mb_pw').focus(); return null}
                 var g = 0;
                 if($('#man').hasClass('w3-blue')){
                	$('#gender').val("1");
                 }
                 else if($('#woman').hasClass('w3-blue')){
                	 $('#gender').val("2");
                 }
                 else{
                	 alert('성별을 선택해 주세요 !');
                	 return null
                 }
                 $('#mb_tel').val(t1+"-"+t2+"-"+t3);
                 $('#form').submit();
       
           });
           
           $('#allcheck').click(function(){
        	   if($('#allcheck').prop("checked")){
        		   $('input[type=checkbox]').prop("checked",true);
        	   }
        	   else{
        		   $('input[type=checkbox]').prop("checked",false);
        	   }
           });
         var navListItems = $('ul.setup-panel li a'), allWells = $('.setup-content');
         allWells.hide();
         navListItems
               .click(function(e) {
                  e.preventDefault();
                  var $target = $($(this).attr('href')), $item = $(
                        this).closest('li');
                  if (!$item.hasClass('disabled')) {
                     navListItems.closest('li')
                           .removeClass('active');
                     $item.addClass('active');
                     allWells.hide();
                     $target.show();
                  }
               });
         $('ul.setup-panel li.active a').trigger('click');
         // DEMO ONLY //
         $('#next-2').on('click',function(e) {
        	 if($('input[name="chk[]"]:checked').length == 2){
            $('ul.setup-panel li:eq(1)').removeClass('disabled');
            $('ul.setup-panel li a[href="#step-2"]').trigger('click');
        	 }
        	 else{
        		 alert("필수항목을 모두 체크해주세요");
        		 return null;
        	 }
         });
         $('#next-3').on('click',function(e) {
        	 var em = $('#email').val();
        	 $('#mb_email').val(em);
        	 
        	 //이메일 인증 유효성검사 확인 필요
            $('ul.setup-panel li:eq(2)').removeClass('disabled');
            $('ul.setup-panel li a[href="#step-3"]').trigger('click');
         });
         $('#prev-1').on('click',function(e) {
            $('ul.setup-panel li a[href="#step-1"]').trigger('click');
         });
      });
  </script>
  <script>
  $(function(){
	  $('#mb_brith').datepicker({
			dateFormat:"yy-mm-dd",
			changeMonth: true,
			changeYear: true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			showMonthAfterYear:true
		});
});
  </script>
  </body>
  </html>
  
