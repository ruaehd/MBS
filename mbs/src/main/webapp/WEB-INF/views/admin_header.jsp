<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
 <div class="side-menu" style="overflow:auto">
    
    <nav class="navbar navbar-default" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <div class="brand-wrapper">
            <!-- Hamburger -->
            <button type="button" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <!-- Brand -->
            <div class="brand-name-wrapper">
                <a class="navbar-brand" href="#">
                       관리자 페이지
                </a>
            </div>
        </div>
    </div>

    <!-- Main Menu -->
    <div class="side-menu-container">
        <ul class="nav navbar-nav">

         <li class="panel panel-default" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl1">
                   <span class="glyphicon glyphicon-send"></span> 회원관리
                </a>
            </li>
         
         <li class="panel panel-default" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl2">
                   <span class="glyphicon glyphicon-plane"></span> 예약관리
                </a>
            </li>
            
            <li class="panel panel-default" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl3">
                   <span class="glyphicon glyphicon-cloud"></span> 컨텐츠관리
                </a>
            </li>
            <!-- Dropdown-->
            <li class="panel panel-default" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl4">
                    <span class="glyphicon glyphicon-user"></span> 고객센터관리<span class="caret"></span>
                </a>

                <!-- Dropdown level 1 -->
                <div id="dropdown-lvl4" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="admin_notice.do">공지</a></li>
                            <li><a href="admin_event.do">이벤트</a></li>
                            <li><a href="admin_qna.do">1:1문의</a></li>
                             <li><a href="admin_fna.do">자주하는질문</a></li>
                        </ul>
                    </div>
                </div>
            </li>

           <li class="panel panel-default" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl5">
                      <span class="glyphicon glyphicon-signal"></span>통계
                </a>
            </li>
          

        </ul>
    </div><!-- /.navbar-collapse -->
</nav>
    
    </div>