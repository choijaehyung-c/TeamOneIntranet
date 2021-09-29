<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
        
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ICIA Technology</title>

    <!-- Custom fonts for this template-->
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" >
   <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />

	
    <link href="${pageContext.request.contextPath}/resources/css/IYJ.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/CJH.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 
<script>

$(window).scroll(function(){
	var scrollTop = $(document).scrollTop()+200;
	if (scrollTop < 300) {
	 scrollTop = 300;
	}
	$("#sidebarLayer").stop();
	$("#sidebarLayer").animate( { "top" : scrollTop });
	});
	
</script>

<script>
function getcl(){
	<%
		String cld = (String) session.getAttribute("cld");
		String clp = (String) session.getAttribute("clp");
		String region = (String)session.getAttribute("userCp") + (String)session.getAttribute("userOf") + (String)session.getAttribute("userDp");
	%>
	return {cld:'<%=cld%>', clp:'<%=clp%>', region:'<%=region%>'};
}
</script>
        


</head>

<body id="page-top" onLoad="mainPage()">
	
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <div class="sidebar-brand d-flex align-items-center justify-content-center" >
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
  <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"/>
</svg>
                <div class="sidebar-brand-text mx-3" href="home.jsp"><i class="bi bi-rss-fill">ICIA Technology </i><sup>2</sup></div>
            </div>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" onClick="mainPage();chartMain()">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span >Dashboard</span></a>
            </li>
		
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg>
                    <span >소모품 구매</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">소모품구매</h6>
                        <a class="collapse-item" onClick="getBkinds()" >구매하기</a>
                        <a class="collapse-item" onClick="myCartView()" >장바구니</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities2"
                    aria-expanded="true" aria-controls="collapseUtilities2">
                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/>
  <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/>
</svg>
                    <span>주문관리</span>
                </a>
                <div id="collapseUtilities2" class="collapse" aria-labelledby="headingUtilities2"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header" >주문관리</h6>
                        <div class="collapse-item"  onClick="orderList()">주문 내역</div>
                        <div class="collapse-item"  onClick="refundList()">반품 내역</div>
                        <div class="collapse-item"  onClick="exchangeList()">교환 내역</div>
                    </div>
                </div>
            </li>

            <hr class="sidebar-divider">
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
</svg>
                    <span>전자결재</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">전자결재</h6>
                        <div class="collapse-item" onClick="ApprovalPage()">주문결재 신청</div>
                        <div class="collapse-item" onClick="anyApprovalPage()">일반결재 신청</div>
                        <div class="collapse-item" onClick="receiveApprovalPage('')">받은결재함</div>
                        <div class="collapse-item" onClick="sendApprovalPage('')">보낸결재함</div>

                    </div>
                </div>
            </li>
         
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities3"
                    aria-expanded="true" aria-controls="collapseUtilities3">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16">
  <path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z"/>
</svg>
                    <span>회계</span>
                </a>
                <div id="collapseUtilities3" class="collapse" aria-labelledby="headingUtilities3"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">accountancy</h6>
                        <div class="collapse-item" onClick="taxbillPage()">세금계산서 조회</div>
                        <div class="collapse-item" onClick="getBudget()">예산조회</div>
                    </div>
                </div>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
</svg>
                    <span>관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">지사관리</h6>
                        <div class="collapse-item" >지사목록</div>
                    </div>
                </div>
            </li>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                  
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                               
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                       \
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                              
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                       
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                       
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                      
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                        
                            <a class="nav-link dropdown-toggle" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-square" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z"/>
</svg>           
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${Name }</span>
                                
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
        <div id="layoutSidenav_content">
		<main style="height: 100%; width: 100%;">
			<div id="mainVue" style="height: 100%; width: 100%;">
<!------------------------------------------------------------------------------------------>
				<template v-if="display[0].show">
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4" style="float:left;">
                        <div class="card shadow mb-4" style="border:0.5px solid #FDFFFF; border-radius:5px; width:350px; height:350px; background:#fff;">
                        	<svg style="margin:20px 35%;" xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
  								<path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
  								<div style="margin-left:35%; font-size:25px; font-weight:bold;">${Name }님</div>
  								<div style="margin-left:37%;">(주)${of}</div>
  								<div style="margin:0 auto; padding-top:50px;">
  									<div>부서 : <span>${Dp} </span></div>
  									<div>연락처 : <span>${email }</span></div>
  								</div>
							</svg>                       	 
                        </div>                        
                    </div>
                     <div class="col-lg-5" style="max-width:35%; float:left;" >
						<div class="mb-4 card" >
							<div class="card-header">
								<h6 class="card-heading">베스트 상품 </h6></div>
					
						<div class="container card-body" >
							<div class="row">
								<div class="col-md-16">
									<canvas id="myChartOne" style="display: block; height: 253px; width: 358px;"></canvas>
								</div>
							</div>
						</div>
						
				</div>
			</div >

			
				<input id="detectRandering" type="hidden" value="ccc"/>
				</template>
<!-------------------------------------------IYJ-------------------------------------------->			
							
				<template v-if="display[1].show">
								<div id="id01" class="w3-modal w3-animate-opacity" style="display:none;">
									<div class="w3-modal-content" style="width:450px;" >
										<div class="w3-container" style="max-width: 100%; width: auto; display: table;">
											<span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
											<div style="border: 1px solid #ddd; display: inline-block; margin-top:15px;">상품코드:{{prdetail.pr_code}}</div>
											<table class="dataTable-table">
												<img :src="prdetail.pr_image" style="padding-left:16.5%;">
												<tbody>
													<tr>
														<td>상품명</td>
														<td><div style="width: 300px;">{{prdetail.pr_name}}</div></td>
													</tr>
													<tr>
														<td>가격(VAT포함)</td>
														<td><div style="width: 300px;">{{prdetail.pr_price+prdetail.pr_tax}}원</div></td>
													</tr>
													<tr>
														<td>공급사</td>
														<td><div style="width: 300px;">{{prdetail.sp_name}}({{prdetail.pr_spcode}})</div></td>
													</tr>
													<tr>
														<td>원산지</td>
														<td><div style="width: 300px;">{{prdetail.pr_origin}}</div></td>
													</tr>
													<tr>
														<td>정보</td>
														<td><div style="width: 300px;">{{prdetail.pr_info}}</div></td>
													</tr>

												</tbody>
											</table>

										</div>
									</div>
								</div>


								<div class="input-group" style="margin-left:30%; width:30%;">
                       <input name="word"type="text" class="dataTable-input" placeholder="상품명을 입력하세요." guddll>
                        <span class="mdi mdi-magnify search-icon"></span>
                       <button class="input-group-text btn-primary" type="submit"  @click="searchItem()">Search</button>
                 </div>
				<div  style="height: 100%; width: 95%; margin-left:5%">

						<div class="menu_wrap" style="margin-left:23%; ">
								
									<ul  class="dep1">
										<li v-for="li in list">										
											<a @click="getCateName(li.bk_code)">{{li.bk_name}}</a>
												<ul  class="dep2">
													<li v-for="ll in detail">
														<a  @click="getCateItem(ll.cate)">{{ll.cate_name}}</a>
													</li>
												</ul>
										</li>
									</ul>
								</div>



									<div id="sidebarLayer"
										style="position: absolute; right:0.4%; top: 80px; width: 120px;  border: 1px solid #ddd; text-align: center; background-color: #FFFFFF; z-index: 1;">
									<div>My Cart<br><br>
										<div id="space"></div>
										<div id="add" style="display:none; border:1px solid #000;" @click="addCart()">담기</div>
									</div>																					
								</div>

								<div class="row" v-for="(item,index) in items" style="margin-bottom:10px; ">
									<img class="img-fluid fit-cover w-sm-100 h-sm-100 rounded-1 absolute-sm-centered"
										:src="item.pr_image" alt="" style="width:220px; height:250px; border-radius:20px;">
								<div class="col-sm-7 col-md-8">
										<div class="row">
											<div class="col-lg-8">
												<h5 class="mt-3 mt-sm-0" >
													<a style="color:#000;" @click="getPrDetail(item.pr_code)" onclick="document.getElementById('id01').style.display='block'">
														{{item.pr_name}}</a>
												</h5>
												<p class="fs--1 mb-2 mb-md-3">
													<a>{{item.cate_name}}</a>
												</p>

											</div>
											<div
												class="col-lg-4 d-flex justify-content-between flex-column">
												<div>
													<h4 class="fs-1 fs-md-2 text-warning mb-0">{{item.pr_price}}원</h4>


													<div class="d-none d-lg-block">
														<p class="fs--1 mb-1">
														<p class="fs--1 mb-1">
															VAT: <strong class="text-success">{{item.pr_tax}}</strong>
														</p>
															배송료: <strong>무료배송</strong>
														</p>
														<p class="fs--1 mb-1">
															재고: <strong class="text-success">{{item.pr_stock}}</strong>
														</p>
													</div>
												</div>
													<div class="input-group input-group-sm"
														data-quantity="data-quantity">
													
														<input name="quantity" 
															class="form-control text-center input-quantity input-spin-none"
															type="number" min="1" max="10" value="1" style="max-width: 50px">
													</div>
													<div class="mt-2">
													<div  @click="addSideBar(item.pr_code,index,item.pr_spcode,item.pr_price,item.pr_tax,item.pr_image,item.pr_name)">
														<button type="button" class="btn btn-danger ms-2">장바구니 담기</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<input id="detectRandering" type="hidden" value="ccc"/>
							</template>
							
				<template v-if="display[2].show">
						<div id="modal01" class="w3-modal" onclick="this.style.display='none'" style="display:none;">
   							<span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
   								<div class="w3-modal-content w3-animate-zoom" style="width:450px; padding:10px;">
     		 						<div style="border: 1px solid #ddd; display: inline-block; margin-top:15px;">상품코드:{{prdetail.pr_code}}</div>
										<table class="dataTable-table">
											<img :src="prdetail.pr_image" style="padding-left:16.5%;">
											<tbody>
												<tr>
													<td>상품명</td>
													<td><div style="width: 300px;">{{prdetail.pr_name}}</div></td>
												</tr>
												<tr>
													<td>가격(VAT포함)</td>
													<td><div style="width: 300px;">{{prdetail.pr_price+prdetail.pr_tax}}원</div></td>
												</tr>
												<tr>
													<td>공급사</td>
													<td><div style="width: 300px;">{{prdetail.sp_name}}({{prdetail.pr_spcode}})</div></td>
												</tr>
												<tr>
													<td>원산지</td>
													<td><div style="width: 300px;">{{prdetail.pr_origin}}</div></td>
												</tr>
												<tr>
													<td>정보</td>
													<td><div style="width: 300px;">{{prdetail.pr_info}}</div></td>
												</tr>

												</tbody>
											</table>
    											</div>
  											</div>
  											
					<div  style="height: 100%; width: 100%;">
						<div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Shopping Cart</h1>
                    <p class="mb-4">※장바구니는 7일까지만 보관이 됩니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" >Cart List</h6>
                        </div>
                         <div class="card-body">
                            <div class="table-responsive">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4"><div class="row"><div class="col-sm-12"><table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                <button type="button" class="btn btn-success mb-2 me-1" style="float:right;" @click="sendApproval()">결재하기</button>
                                    <thead>
										<tr role="row">
											<th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
												aria-sort="ascending" aria-label="Image: activate to sort column descending" style="width: 70px;">
											<input type="checkbox" id="check_all" name="chkYn" onclick="selectAll(this)" >
											Image </th>
											<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
												aria-label="Supply Code: activate to sort column ascending" style="width: 100px;">
											Supply Code</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
												aria-label="Item: activate to sort column ascending" style="width: 100px;">
											Item</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
												aria-label="Item Code: activate to sort column ascending" style="width: 80px;">
											Item Code</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
												aria-label="Item Code: activate to sort column ascending" style="width: 80px;">
											Price<br>(VAT포함)</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
												aria-label="Quantity: activate to sort column ascending" style="width: 40px;">
											Quantity</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
												aria-label="Total Price: activate to sort column ascending" style="width: 100px;">
											Total Price<br>(VAT포함)</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
												aria-label="Total Price: activate to sort column ascending" style="width: 100px;">
											구문</th>
										</tr>
									</thead>
                                    
                                    <tbody id="table">        
                                  		<tr class="odd" v-for="li in cart">
                                  			<td id="img" ><input type='checkbox'name='chkYn' :value=li.spcode+li.prname+li.prcode+li.price+li.count+li.price*li.count /><img :src="li.img" style='width:150px; cursor:zoom-in' @click="getPrDetail(li.prcode)" onclick="document.getElementById('modal01').style.display='block'"/></td>
                                  			<td id="spcode"  >{{li.spcode}}</td>
                                  			<td id="prname">{{li.prname}}</td>
                                  			<td id="prcode">{{li.prcode}}</td>
                                  			<td id="price">{{li.price}}</td>
                                  			<td id="count"><input type="number"   v-model="li.count" style="width:45%;"></td>
                                  			<td id="tt_price"><input type='text' readonly name='tt_price' :value=li.price*li.count>원</td>
                                  			<td><span class="btn btn-primary btn-sm" @click="delItem(li.prcode)">삭제</span></td>
                                  		</tr>
                                     </tbody>
                                </table></div></div>
                            </div>
                        </div>
                    </div>

                </div>
										
					</div>
				<input id="detectRandering" type="hidden" value="ccc"/>
				</template>
<!-------------------------------------------CJH-------------------------------------------->				
			
            
            <div id="loadingBack" style="display: none; position: absolute; top: 0%; left: 0%; width: 100%;
            height: 100% ; z-index:1001; -moz-opacity: 0.8; opacity:.80; filter: alpha(opacity=60);">
            	<div id="loadingCat" style="position: absolute; transform:translate(-50%,-50%); z-index:1000; overflow: auto;">
	            	<img src="${pageContext.request.contextPath}/resources/img/loadcat.gif">
	            </div>
			</div>
	
				<template v-if="display[3].show">
				
				     <div id="modalBack" v-if="modalcjh2.show" :style="styleObject">
							<div style="width:70%; max-height:80%; background: #fff; transform:translate(-50%,0%);
							border-radius: 10px; padding: 20px; z-index:1; position: absolute; margin-top:3%; left:50%; overflow:auto;">
							<div style="float: left; width:95%; color:#000; font-weight: 900; font-size:35px">&nbsp&nbsp배송 조회</div>
							<button @click="modalcjh2Close()" type="button" class="btn btn-dark" style="font-weight: 900; font-size:16px;">X</button>
										<hr style="display:block;">
								<table class="dataTable-table">
									<tr>
										<td style="text-align:center; vertical-align:middle;">운송장 번호</td>
										<td style="text-align:center; vertical-align:middle;">{{modalList.dl_code}}</td>
										<td style="text-align:center; vertical-align:middle;">주문서 번호</td>
										<td style="text-align:center; vertical-align:middle;">{{modalList.dl_oscode}}</td>
									</tr>
									<tr>
										<td style="text-align:center; vertical-align:middle;">배송 기사</td>
										<td style="text-align:center; vertical-align:middle;">{{modalList.dv_name}}</td>
										<td style="text-align:center; vertical-align:middle;">연락처</td>
										<td style="text-align:center; vertical-align:middle;">{{modalList.dv_hp}}</td>
									</tr>
									<tr>
										<td style="text-align:center; vertical-align:middle;" colspan="4" v-if="modalList.dl_dscode == 1">상품준비중</td>
										<td style="text-align:center; vertical-align:middle;" colspan="4" v-else-if="modalList.dl_dscode == 2">배송중</td>
										<td style="text-align:center; vertical-align:middle;" colspan="4" v-else>배송완료</td>
									</tr>
								</table>
								<table class="dataTable-table">
								     <thead>
                                        <tr>
                                            <th style="width: 25%; text-align:center;"><a>x좌표</a></th>
                                            <th style="width: 25%; text-align:center;"><a>y좌표</a></th>
                                            <th style="width: 50%; text-align:center;"><a>날짜</a></th>
                                        </tr>
                                    </thead>
									<tbody>
										<tr v-for="item in modalList.lc">
											<td style="text-align:center; vertical-align:middle;">{{item.lc_x}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.lc_y}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.lc_date}}</td>
										</tr>
									</tbody>
								</table>
							</div>
					 </div>
				     <div id="modalBack" v-if="modal.show" :style="styleObject">
							<div style="width:70%; max-height:80%; background: #fff; transform:translate(-50%,0%);
							border-radius: 10px; padding: 20px; z-index:1; position: absolute; margin-top:3%; left:50%; overflow:auto;">
							
							<div style="float: left; width:95%; color:#000; font-weight: 900; font-size:35px">&nbsp&nbsp주문 정보</div>
							<button @click="modalClose()" type="button" class="btn btn-dark" style="font-weight: 900; font-size:16px;">X</button>
										<hr style="display:block;">
								<table class="dataTable-table" id="modalTable">
								     <thead>
                                        <tr>
                                            <th style="width: 10%; text-align:center;"><a>이미지</a></th>
                                            <th style="width: 27%; text-align:center;"><a>상품명</a></th>
                                            <th style="width: 37%; text-align:center;"><a>상품정보</a></th>
                                            <th style="width: 10%; text-align:center;"><a>가격(원)</a></th>
                                            <th style="width: 6%; text-align:center;"><a>수량</a></th>
                                            <th style="width: 10%; text-align:center;"><a>원산지</a></th>                                          
                                        </tr>
                                    </thead>
									<tbody>
										<tr v-for="(item,index) in modalList">
											<td><img :src="item.pr_image" width="100%" height="100%" alt="no search image"></td>
											<td style="text-align:center; vertical-align:middle;">{{item.pr_name}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.pr_info}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.perPrice}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.od_quantity}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.pr_origin}}</td>
										</tr>
										<tr><td colspan="6" style="text-align:center; vertical-align:middle;"> 총 가격(VAT포함) : {{modalList.ttPrice}} 원</td></tr>
									</tbody>
								</table>
							</div>
						</div>
				     <div id="modalBack" v-if="modalcjh.show" :style="styleObject">
							<div style="width:70%; max-height:80%; background: #fff; transform:translate(-50%,0%);
							border-radius: 10px; padding: 20px; z-index:1; position: absolute; margin-top:3%; left:50%; overflow:auto;">
							<div style="float: left; width:95%; color:#000; font-weight: 900; font-size:35px">&nbsp&nbsp교환/반품</div>
							<button @click="modalcjhClose()" type="button" class="btn btn-dark" style="font-weight: 900; font-size:16px;">X</button>
										<hr style="display:block;">
								<table class="dataTable-table" id="modalTable">
								     <thead>
                                        <tr>
                                            <th style="width: 10%; text-align:center;"><a>이미지</a></th>
                                            <th style="width: 27%; text-align:center;"><a>상품명</a></th>
                                            <th style="width: 37%; text-align:center;"><a>상품정보</a></th>
                                            <th style="width: 10%; text-align:center;"><a>가격(원)</a></th>
                                            <th style="width: 6%; text-align:center;"><a>수량</a></th>
                                            <th style="width: 10%; text-align:center;"><a>반품/교환</a></th>                                          
                                        </tr>
                                    </thead>
									<tbody><!-- OD_PRSPCODE,OD_OSCODE AS "OS_ORIGIN",OD_PRCODE,OD_QUANTITY,PR_NAME,PR_IMAGE,PR_PRICE,PR_TAX,PR_INFO,PR_ORIGIN,OD_STCODE -->
										<tr v-for="(item,index) in modalList" @click="insReason(index,item)">
											<td><img :src="item.pr_image" width="100%" height="100%" alt="no search image"></td>
											<td style="text-align:center; vertical-align:middle;">{{item.pr_name}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.pr_info}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.perPrice}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.od_quantity}}</td>
											<td style="text-align:center; vertical-align:middle;"><input style="zoom:2.0;" type="checkbox" name="As_Checkbox" :value="item.od_prcode" /></td>
										</tr>										
									</tbody>									
								</table>
								<hr>
								<div style="text-align: center;">
								<button @click="exchangeCheckbox()" type="button" class="btn btn-outline-secondary" style="display: inline-block;">교환하기</button>
								<button @click="refundCheckbox()" type="button" class="btn btn-outline-secondary" style="display: inline-block;">반품하기</button>
								</div>
							</div>
						</div>
				<div style="z-index: 3;">
					<div class="tabs">
					  <ul>
						<li class="litab activeT" @click="changeTab(0)">주문 리스트</li>
						<li class="litab" @click="changeTab(1)">완료 리스트</li>
					  </ul>
					</div>
					<div v-if="display2[0].show">
					<div style="margin:1%; padding:1%; box-shadow: 0px 0px 10px #222;" v-for="ios in list3">
								<p style="color:#000; font-weight:bold;">내부 주문 번호 {{ios}}</p><br>
									<table id="datatablesSimple" class="dataTable-table">
	 										<thead>
												<tr>
													<th style="width: 12%; text-align:center;"><a>외부 주문 번호</a></th>
													<th style="width: 10%; text-align:center;"><a>상태</a></th>
													<th style="width: 40%; text-align:center;"><a>상품명</a></th>
													<th style="width: 17%; text-align:center;"><a>날짜</a></th>
													<th colspan="3" style="width: 21%; text-align:center;"><a>Click!</a></th>

												</tr>
												</thead> 

											<tbody style="text-align:center;">
												<tr v-for="order in list" v-if="order.ios == ios">
													<td @click="getOrderDetail(order.os_code)">{{order.os_code}}</td>
														<td @click="getOrderDetail(order.os_code)">{{order.os_stname}}</td>
													<td @click="getOrderDetail(order.os_code)">{{order.os_summary}}</td>
													<td @click="getOrderDetail(order.os_code)">{{order.os_date}}</td>
													<td><div v-if="order.os_state==='OA'" @click="sendOrderDecide(order.os_code)">구매 확정</div><div v-else>-</div></td>
													<td><div v-if="order.os_state==='OA'" @click="getOrderDetail2(order.os_code,order.ios)">교환/반품</div><div v-else>-</div></td>
													<td><div v-if="order.os_state==='OA'" @click="getDelivery(order.os_code)">배송 조회</div><div v-else>-</div></td>
												</tr>
											</tbody>
											
											
										</table>		
					</div>
					
					</div>
					<div v-if="display2[1].show">
					<div style="margin:1%; padding:1%; box-shadow: 0px 0px 10px #222;" v-for="ios in list2">
								<p style="color:#000; font-weight:bold;">내부 주문 번호 {{ios}}</p><br>
									<table id="datatablesSimple" class="dataTable-table">
	 										<thead>
												<tr>
													<th style="width: 15%;"><a>외부 주문 번호</a></th>
													<th style="width: 15%;"><a>상태</a></th>
													<th style="width: 50%;"><a>상품명</a></th>
													<th style="width: 20%;"><a>날짜</a></th>
						
												</tr>
												</thead> 

											<tbody>
												<tr v-for="order in list1" v-if="order.ios == ios" @click="getOrderDetail(order.os_code)">
													<td>{{order.os_code}}</td>
													<td>{{order.os_stname}}</td>
													<td>{{order.os_summary}}</td>
													<td>{{order.os_date}}</td>
												</tr>
											</tbody>
											
											
										</table>		
					</div>
					</div>
					</div>
					<input id="detectRandering" type="hidden" value="ccc"/>
				</template>
				<template v-if="display[4].show">
					<div id="modalBack" v-if="modal.show" :style="styleObject">
							<div style="width:70%; max-height:80%; background: #fff; transform:translate(-50%,0%);
							border-radius: 10px; padding: 20px; z-index:1; position: absolute; margin-top:3%; left:50%; overflow:auto;">
							<button @click="modalClose()" type="button"
										class="btn btn-dark" style="float: right;">닫기</button><br>
								<table class="dataTable-table" id="modalTable">
								     <thead>
                                        <tr>
                                            <th style="width: 10%; text-align:center;"><a>이미지</a></th>
                                            <th style="width: 27%; text-align:center;"><a>상품명</a></th>
                                            <th style="width: 37%; text-align:center;"><a>상품정보</a></th>
                                            <th style="width: 10%; text-align:center;"><a>가격(원)</a></th>
                                            <th style="width: 6%; text-align:center;"><a>수량</a></th>
                                            <th style="width: 10%; text-align:center;"><a>원산지</a></th>                                          
                                        </tr>
                                    </thead>
									<tbody><!-- OD_PRSPCODE,OD_OSCODE AS "OS_ORIGIN",OD_PRCODE,OD_QUANTITY,PR_NAME,PR_IMAGE,PR_PRICE,PR_TAX,PR_INFO,PR_ORIGIN,OD_STCODE -->
										<tr v-for="(item,index) in modalList" v-if="item.od_stcode ==='RR'">
											<td><img :src="item.pr_image" width="100%" height="100%" alt="no search image"></td>
											<td style="text-align:center; vertical-align:middle;">{{item.pr_name}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.pr_info}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.perPrice}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.od_quantity}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.pr_origin}}</td>
										</tr>
										<tr><td colspan="6" style="text-align:center; vertical-align:middle;"> 총 가격(VAT포함) : {{modalList.ttPrice}} 원</td></tr>
									</tbody>
								</table>
							</div>
						</div>
					<div class="tabs">
					  <ul>
						<li class="litab activeT" @click="changeTab(0)">요청 리스트</li>
						<li class="litab" @click="changeTab(1)">응답 리스트</li>
					  </ul>
					</div>
					<div v-if="display2[0].show">
					<div style="margin:1%; padding:1%; box-shadow: 0px 0px 10px #222;" v-for="ios in list3">
								<p style="color:#000; font-weight:bold;">내부 주문 번호 {{ios}}</p><br>
									<table id="datatablesSimple" class="dataTable-table">
	 										<thead>
												<tr>
													<th style="width: 15%;"><a>외부 주문 번호</a></th>
													<th style="width: 15%;"><a>상태</a></th>
													<th style="width: 50%;"><a>상품명</a></th>
													<th style="width: 20%;"><a>날짜</a></th>
						
												</tr>
												</thead> 

											<tbody>
												<tr v-for="order in list" v-if="order.ios == ios" @click="getOrderDetail(order.os_code)">
													<td>{{order.os_code}}</td>
													<td>{{order.os_stname}}</td>
													<td>{{order.os_summary}}</td>
													<td>{{order.os_date}}</td>
												</tr>
											</tbody>
										</table>		
					</div>
					</div>
					<div v-if="display2[1].show">
					<div style="margin:1%; padding:1%; box-shadow: 0px 0px 10px #222;" v-for="ios in list2">
								<p style="color:#000; font-weight:bold;">내부 주문 번호 {{ios}}</p><br>
									<table id="datatablesSimple" class="dataTable-table">
	 										<thead>
												<tr>
													<th style="width: 15%;"><a>외부 주문 번호</a></th>
													<th style="width: 12%;"><a>상태</a></th>
													<th style="width: 47%;"><a>상품명</a></th>
													<th style="width: 18%;"><a>날짜</a></th>
													<th style="width: 7%;"><a>Click!</a></th>
												</tr>
												</thead> 

											<tbody>
												<tr v-for="order in list1" v-if="order.ios == ios" style="text-align:center; vertical-align:middle;">
													<td  @click="getOrderDetail(order.os_code)">{{order.os_code}}</td>
													<td  @click="getOrderDetail(order.os_code)">{{order.os_stname}}</td>
													<td  @click="getOrderDetail(order.os_code)">{{order.os_summary}}</td>
													<td  @click="getOrderDetail(order.os_code)">{{order.os_date}}</td>
													<td><div v-if="order.os_state==='RA'" @click="getDelivery(order.os_code)">배송 조회</div><div v-else>-</div></td>
												</tr>
											</tbody>
											
											
										</table>		
					</div>

					</div>
					<input id="detectRandering" type="hidden" value="ccc"/>
				</template>
				<template v-if="display[11].show">
				     <div id="modalBack" v-if="modal.show" :style="styleObject">
							<div style="width:70%; max-height:80%; background: #fff; transform:translate(-50%,0%);
							border-radius: 10px; padding: 20px; z-index:1; position: absolute; margin-top:3%; left:50%; overflow:auto;">
							<button @click="modalClose()" type="button"
										class="btn btn-dark" style="float: right;">닫기</button><br>
								<table class="dataTable-table" id="modalTable">
								     <thead>
                                        <tr>
                                            <th style="width: 10%; text-align:center;"><a>이미지</a></th>
                                            <th style="width: 27%; text-align:center;"><a>상품명</a></th>
                                            <th style="width: 37%; text-align:center;"><a>상품정보</a></th>
                                            <th style="width: 10%; text-align:center;"><a>가격(원)</a></th>
                                            <th style="width: 6%; text-align:center;"><a>수량</a></th>
                                            <th style="width: 10%; text-align:center;"><a>원산지</a></th>                                          
                                        </tr>
                                    </thead>
									<tbody><!-- OD_PRSPCODE,OD_OSCODE AS "OS_ORIGIN",OD_PRCODE,OD_QUANTITY,PR_NAME,PR_IMAGE,PR_PRICE,PR_TAX,PR_INFO,PR_ORIGIN,OD_STCODE -->
										<tr v-for="(item,index) in modalList">
											<td><img :src="item.pr_image" width="100%" height="100%" alt="no search image"></td>
											<td style="text-align:center; vertical-align:middle;">{{item.pr_name}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.pr_info}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.perPrice}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.od_quantity}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.pr_origin}}</td>
										</tr>
										<tr><td colspan="6" style="text-align:center; vertical-align:middle;"> 총 가격(VAT포함) : {{modalList.ttPrice}} 원</td></tr>
									</tbody>
								</table>
							</div>
						</div>
				     <div id="modalBack" v-if="modalcjh2.show" :style="styleObject">
							<div style="width:70%; max-height:80%; background: #fff; transform:translate(-50%,0%);
							border-radius: 10px; padding: 20px; z-index:1; position: absolute; margin-top:3%; left:50%; overflow:auto;">
							<div style="float: left; width:95%; color:#000; font-weight: 900; font-size:35px">&nbsp&nbsp배송 조회</div>
							<button @click="modalcjh2Close()" type="button" class="btn btn-dark" style="font-weight: 900; font-size:16px;">X</button>
										<hr style="display:block;">
								<table class="dataTable-table">
									<tr>
										<td style="text-align:center; vertical-align:middle;">운송장 번호</td>
										<td style="text-align:center; vertical-align:middle;">{{modalList.dl_code}}</td>
										<td style="text-align:center; vertical-align:middle;">주문서 번호</td>
										<td style="text-align:center; vertical-align:middle;">{{modalList.dl_oscode}}</td>
									</tr>
									<tr>
										<td style="text-align:center; vertical-align:middle;">배송 기사</td>
										<td style="text-align:center; vertical-align:middle;">{{modalList.dv_name}}</td>
										<td style="text-align:center; vertical-align:middle;">연락처</td>
										<td style="text-align:center; vertical-align:middle;">{{modalList.dv_hp}}</td>
									</tr>
									<tr>
										<td style="text-align:center; vertical-align:middle;" colspan="4" v-if="modalList.dl_dscode == 1">상품준비중</td>
										<td style="text-align:center; vertical-align:middle;" colspan="4" v-else-if="modalList.dl_dscode == 2">배송중</td>
										<td style="text-align:center; vertical-align:middle;" colspan="4" v-else>배송완료</td>
									</tr>
								</table>
								<table class="dataTable-table">
								     <thead>
                                        <tr>
                                            <th style="width: 25%; text-align:center;"><a>x좌표</a></th>
                                            <th style="width: 25%; text-align:center;"><a>y좌표</a></th>
                                            <th style="width: 50%; text-align:center;"><a>날짜</a></th>
                                        </tr>
                                    </thead>
									<tbody>
										<tr v-for="item in modalList.lc">
											<td style="text-align:center; vertical-align:middle;">{{item.lc_x}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.lc_y}}</td>
											<td style="text-align:center; vertical-align:middle;">{{item.lc_date}}</td>
										</tr>
									</tbody>
								</table>
							</div>
					 </div>
					<div class="tabs">
					  <ul>
						<li class="litab activeT" @click="changeTab(0)">요청 리스트</li>
						<li class="litab" @click="changeTab(1)">응답 리스트</li>
					  </ul>
					</div>
					<div v-if="display2[0].show">
					<div style="margin:1%; padding:1%; box-shadow: 0px 0px 10px #222;" v-for="ios in list3">
								<p style="color:#000; font-weight:bold;">내부 주문 번호 {{ios}}</p><br>
									<table id="datatablesSimple" class="dataTable-table">
	 										<thead>
												<tr>
													<th style="width: 15%;"><a>외부 주문 번호</a></th>
													<th style="width: 15%;"><a>상태</a></th>
													<th style="width: 50%;"><a>상품명</a></th>
													<th style="width: 20%;"><a>날짜</a></th>
						
												</tr>
												</thead> 

											<tbody>
												<tr v-for="order in list" v-if="order.ios == ios" @click="getOrderDetail(order.os_code)">
													<td>{{order.os_code}}</td>
													<td>{{order.os_stname}}</td>
													<td>{{order.os_summary}}</td>
													<td>{{order.os_date}}</td>
												</tr>
											</tbody>
										</table>		
					</div>
					</div>
					<div v-if="display2[1].show">
					<div style="margin:1%; padding:1%; box-shadow: 0px 0px 10px #222;" v-for="ios in list2">
								<p style="color:#000; font-weight:bold;">내부 주문 번호 {{ios}}</p><br>
									<table id="datatablesSimple" class="dataTable-table">
	 										<thead>
												<tr>
													<th style="width: 15%;"><a>외부 주문 번호</a></th>
													<th style="width: 12%;"><a>상태</a></th>
													<th style="width: 47%;"><a>상품명</a></th>
													<th style="width: 18%;"><a>날짜</a></th>
													<th style="width: 7%;"><a>Click!</a></th>
												</tr>
												</thead> 

											<tbody>
												<tr v-for="order in list1" v-if="order.ios == ios" style="text-align:center; vertical-align:middle;">
													<td  @click="getOrderDetail(order.os_code)">{{order.os_code}}</td>
													<td  @click="getOrderDetail(order.os_code)">{{order.os_stname}}</td>
													<td  @click="getOrderDetail(order.os_code)">{{order.os_summary}}</td>
													<td  @click="getOrderDetail(order.os_code)">{{order.os_date}}</td>
													<td><div v-if="order.os_state==='EA'" @click="getDelivery(order.os_code)">배송 조회</div><div v-else>-</div></td>
												</tr>
											</tbody>
											
											
										</table>		
					</div>

					</div>
					<input id="detectRandering" type="hidden" value="ccc"/>
				</template>


<!-------------------------------------------NSB-------------------------------------------->				


			 <template v-if="display[5].show">

                <div id="id01" class="w3-modal" style="display:none">
                   <div class="w3-modal-content">
                        <div class="w3-container">
                          <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
                     <div style="max-width: 100%; width: 100%; display: table; background: #fff; border-radius: 10px; padding: 20px; z-index: 1;">
                        <table id="datatablesSimple" class="dataTable-table">
                           <thead>
                                 <tr>
                                    <th data-sortable style="width: 33.3333%; background-color: #E0E0E0;"><a>부서명</a></th>
                                    <th data-sortable style="width: 33.3333%; background-color: #E0E0E0;"><a>담당자명</a></th>
                                    <th data-sortable style="width: 33.3333%; background-color: #E0E0E0;"><a>지사명</a></th>   
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr v-for="list in list" @click="inputDP(list.ep_code)">
                                    <td>{{list.dp_name}}</td>
                                    <td>{{list.ep_name}}</td>
                                    <td>{{list.of_name}}</td>                              
                                 </tr>                     
                                                                                                                                                                                                        
                                  </tbody>                                         
                           </table>                     
                          </div>
                     </div>
                     </div>
                     </div>
                     
                   <div id="id02" class="w3-modal">
                   <div class="w3-modal-content">
                        <div class="w3-container">
                          <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-display-topright">&times;</span>    
                     <div style="max-width: 100%; width: 100%; display: table; background: #fff; border-radius: 10px; padding: 20px; z-index: 1;">
                        <table id="datatablesSimple" class="dataTable-table">
                           <thead>
                                 <tr>
                                    <th data-sortable style="width: 14%; background-color: #E0E0E0;"><a>공급사코드</a></th>
                                    <th data-sortable style="width: 30%; background-color: #E0E0E0;"><a>품명</a></th>
                                    <th data-sortable style="width: 14%; background-color: #E0E0E0;"><a>품목코드</a></th>
                                    <th data-sortable style="width: 14%; background-color: #E0E0E0;"><a>개별가격</a></th>
                                    <th data-sortable style="width: 14%; background-color: #E0E0E0;"><a>수량</a></th>
                                    <th data-sortable style="width: 14%; background-color: #E0E0E0;"><a>총가격</a></th>   
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr v-for="(list, index) in cartNSB"  @click="inputCart(list, index)">
                                    <td>{{list.spcode}}</td>
                                    <td>{{list.prname}}</td>
                                    <td>{{list.prcode}}</td>
                                    <td>{{list.price}}</td> 
                                    <td>{{list.count}}</td> 
                                    <td>{{list.ttprice}}</td>                               
                                 </tr>                     
                                                                                                                                                                            
                                  </tbody>                                         
                           </table>                     
                          </div>
                     </div>
                     </div>
                     </div>
                     
      <table id="datatablesSimple" class="dataTable-table">
                        <colgroup>
                           <col width="20%" />
                           <col width="20%" />
                           <col width="20%" />
                           <col width="20%" />
                           <col width="20%" />
                        </colgroup>

                        <tbody>
                           <tr>
                              <th>기안부서</th>
                              <td>{{sendbean.dp_name}}</td>
                              <th>기안자</th>
                              <td colspan="2">{{sendbean.ep_name}}</td>
                           </tr>
                           <tr>
                              <th>결재구분</th>
                              <td colspan="4"><select id="div_apv_sq" class="form-control"
                                 name="div_apv_sq">
                                    <option value="O">주문</option>
                              </select></td>
                           </tr>
                           <tr>
                              <th>수신부서</th>
                              <td v-if="nsbPage[0].show">{{sendbean2.dp_name}}</td>
                              <th>수신자</th>
                              <td v-if="nsbPage[0].show">{{sendbean2.ep_name}}</td>
                              <td><button class="btn btn-dark"  onclick="document.getElementById('id01').style.display='block'" @click="getDP()">부서찾기</button></td>
                              </tr>

                           <table id="datatablesSimple" class="dataTable-table"> 
                              <tr>
                              <th>기안내용</th>
                              </tr>
                              <tr>
                              <td><button class="btn btn-dark" onclick="document.getElementById('id02').style.display='block'" @click="getApprovalCart()">장바구니</button></td>                           
                               </tr>
                              <tr v-if="nsbPage[1].show" >
                              <th>공급사코드</th>
                              <th>품명</th>
                              <th>품목코드</th>
                              <th>개별가격</th>
                              <th>수량</th>
                              <th>총가격</th>
                              </tr>
                              <tr v-if="nsbPage[1].show" v-for="list in inputcart">
                              <td >{{list.spcode}}</td>
                              <td >{{list.prname}}</td>
                              <td >{{list.prcode}}</td>
                              <td >{{list.price}}</td>
                              <td >{{list.count}}</td>
                              <td >{{list.ttprice}}</td>

                              </tr>
                              
                              </table>
                              <tr>                           
                              <td ><button class="btn btn-dark" @click="issueApproval()" style="float:right">기안하기</button></td>
                              </tr>
                              </table>                                    
               </tbody>               
            <tr>
            <td>
            </td>
            </tr>            
            <input id="detectRandering" type="hidden" value="ccc"/>
            </template>
<!-- -------------------------------------------------------------------------------------------- -->            

      <!-- -------------------------------------------------------------------------------------------- -->      
            <template v-if="display[6].show">            
                  
                  <div id="id01" class="w3-modal" style="display:none">
                   <div class="w3-modal-content">
                        <div class="w3-container">
                          <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
                     <div style="max-width: 100%; width: 100%; display: table; background: #fff; border-radius: 10px; padding: 20px; z-index: 1;">
                        <table id="datatablesSimple" class="dataTable-table">
                           <thead>
                                 <tr>
                                    <th data-sortable style="width: 33.3333%; background-color: #E0E0E0;"><a>부서명</a></th>
                                    <th data-sortable style="width: 33.3333%; background-color: #E0E0E0;"><a>담당자명</a></th>
                                    <th data-sortable style="width: 33.3333%; background-color: #E0E0E0;"><a>지사명</a></th>   
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr v-for="list in list" @click="inputDP3(list.ep_code)">
                                    <td>{{list.dp_name}}</td>
                                    <td>{{list.ep_name}}</td>
                                    <td>{{list.of_name}}</td>                              
                                 </tr>                     
                                                                                                                                                                                                     
                                  </tbody>                                         
                           </table>                     
                          </div>
                     </div>
                     </div>
                     </div>
                     
                  <table id="datatablesSimple" class="dataTable-table">
                        <colgroup>
                           <col width="20%" />
                           <col width="20%" />
                           <col width="20%" />
                           <col width="20%" />
                           <col width="20%" />
                        </colgroup>

                        <tbody>
                           <tr>
                              <th>기안부서</th>
                              <td>{{sendbean.dp_name}}</td>
                              <th>기안자</th>
                              <td colspan="2">{{sendbean.ep_name}}</td>
                           </tr>
                           <tr>
                              <th>결재구분</th>
                              <td colspan="4"><select id="div_apv_sq" class="form-control"
                                 name="div_apv_sq">
                                    <option value="N">일반</option>
                              </select></td>
                           </tr>
                           <tr >
                              <th>수신부서</th>
                              <td v-if="nsbPage[2].show">{{sendbean2.dp_name}}</td>
                              <th>수신자</th>
                              <td v-if="nsbPage[2].show">{{sendbean2.ep_name}}</td>
                              <td><button class="btn btn-dark" onclick="document.getElementById('id01').style.display='block'" @click="getDP3()">부서찾기</button></td>
                              </tr>

                           <table id="datatablesSimple" class="dataTable-table"> 
                              <tr>
                              <th colspan="2">기안내용</th>
                              </tr>
                              <tr>
                              <td style= width:80%><textarea id="text" style="text-align:center; width:100%; height:400px;" ></textarea></td>
                              <td style= width:20%><button class="btn btn-dark" @click="issueApproval2()">기안하기</button></td>
                              </tr>
                              </table>                                    
               </tbody>
            </table>   
            <input id="detectRandering" type="hidden" value="ccc"/>            
            </template>
							

<!-------------------------------------------HSM-------------------------------------------->
			<template v-if="display[7].show">
				
					<div id="modalBack" v-if="modal.show" :style="styleObject">
                     <div style="width:70%; max-height:80%; background: #fff; transform:translate(-50%,0%);
                     border-radius: 10px; padding: 20px; z-index:1; position: absolute; margin-top:3%; left:50%; overflow:auto;">
                     <div style="float: left; width:95%; color:#000; font-weight: 900; font-size:35px">&nbsp&nbsp</div>
                     <button @click="modalClose()" type="button" class="btn btn-dark" style="font-weight: 900; font-size:16px;">X</button>
                   		<table id="datatablesSimple" class="dataTable-table">
											<thead>
												<tr>
													<th style="width: 20%;"><a>상품명</a></th>
													<th style="width: 20%;"><a>주문수량</a></th>
													<th style="width: 20%;"><a>상품가격</a></th>													
												</tr>
											</thead>

											<tbody>
												<tr v-for="ALD in detail">
													<td></td>
													<td>{{ALD.od_quantity}}개</td>
													<td>{{ALD.pr_price}}원</td>
												</tr>
											</tbody>
										</table>
                   		<div  style="text-align: center">
                   		<button @click="getDetailInfo(list2.os_code, list2.ap_code, list2.of_code)" type="button" class="btn btn-dark">허가</button>
                   		<button @click="responseAppovalRefuse(list2.ap_code)" type="button" class="btn btn-dark">반려</button>
                   		
                  		</div>
                   		
                  	</div>
                   	</div>				
					
					  <div id="modalBack" v-if="modal2.show" :style="styleObject">
                     <div style="width:70%; max-height:80%; background: #fff; transform:translate(-50%,0%);
                     border-radius: 10px; padding: 20px; z-index:1; position: absolute; margin-top:3%; left:50%; overflow:auto;">
                     <div style="float: left; width:95%; color:#000; font-weight: 900; font-size:35px">&nbsp&nbsp</div>
                     <button @click="modal2.show=false" type="button" class="btn btn-dark" style="font-weight: 900; font-size:16px;">X</button>
                       
                   		<table id="datatablesSimple" class="dataTable-table">
											<thead>
												<tr>
													<th style="width: 100%; text-align: center;"><a>사유</a></th>													
												</tr>
											</thead>
										
											<tbody>
												<tr v-for="ANLD in detail">

													<td>{{ANLD.an_text}}</td>
		
												</tr>
											</tbody>
										</table>
                   		<div  style="text-align: center">
                   		<button @click="responseAnyAppoval(list2.ap_code, 'NA')" type="button" class="btn btn-dark">허가</button>
                   		<button @click="responseAnyAppoval(list2.ap_code, 'NF')" type="button" class="btn btn-dark">반려</button>
                  		</div>
                   		
                  	</div>
                   	</div>				
		
				
					<div class="container-fluid px-4">
						<h6>&nbsp</h6>
							<div
								class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
								<div class="dataTable-top">
									<div>
									<select @change="changeReceiveApproval()" id= "changeList" class="form-control">
  										<option value=0 selected>구매</option>
    									<option value=1>일반</option>
									</select>
									</div>
									<div class="dataTable-search">
										<input class="dataTable-input" type="text"
											placeholder="상품명을 입력해주세요">
									</div>
								</div>
								<div class="card mb-4">
									<div class="card-header">받은결재</div>
									<div class="card-body">
										<table id="datatablesSimple" class="dataTable-table">
											<thead>
												<tr>
													<th style="width: 20%;"><a>결재신청부서</a></th>
													<th style="width: 20%;"><a>결재구분</a></th>													
													<th style="width: 20%;"><a>날짜</a></th>
													<th style="width: 20%;"><a></a></th>
												</tr>
											</thead>

											<tbody v-if="selectPage[0].show">
												<tr v-for="AL in list">
													<td @click="getApprovalDetail(AL.ap_oscode, AL.ap_code, AL.of_code)">{{AL.of_name}} {{AL.dp_name}}</td>
													<td @click="getApprovalDetail(AL.ap_oscode, AL.ap_code, AL.of_code)">{{AL.cg_name}}</td>
													<td @click="getApprovalDetail(AL.ap_oscode, AL.ap_code, AL.of_code)">{{AL.ap_date}}</td>
													<td style="text-align: center">
														<button @click="getDetailInfo(AL.ap_oscode, AL.ap_code, AL.of_code)"
															type="button" class="btn btn-dark">허가</button>
														<button @click="responseAppovalRefuse(AL.ap_code)"
															type="button" class="btn btn-dark">반려</button>
													</td>
												</tr>
										
											</tbody>
											<tbody v-if="selectPage[1].show">
												<tr v-for="ANL in list2">
													<td @click="getAnyApprovalDetail(ANL.ap_code)">{{ANL.of_name}} {{ANL.dp_name}}</td>
													<td @click="getAnyApprovalDetail(ANL.ap_code)">{{ANL.cg_name}}</td>
													<td @click="getAnyApprovalDetail(ANL.ap_code)">{{ANL.ap_date}}</td>
													<td style="text-align: center">
														<button @click="responseAnyAppoval(ANL.ap_code, 'NA')"
															type="button" class="btn btn-dark">허가</button>
														<button @click="responseAnyAppoval(ANL.ap_code, 'NF')"
															type="button" class="btn btn-dark">반려</button>
													</td>
												</tr>
										
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<input id="detectRandering" type="hidden" value="ccc"/>
				</template>
				
				<template v-if="display[8].show">
				
					<div id="modalBack" v-if="modal.show" :style="styleObject">
                     <div style="width:70%; max-height:80%; background: #fff; transform:translate(-50%,0%);
                     border-radius: 10px; padding: 20px; z-index:1; position: absolute; margin-top:3%; left:50%; overflow:auto;">
                     <div style="float: left; width:95%; color:#000; font-weight: 900; font-size:35px">&nbsp&nbsp</div>
                     <button @click="modalClose()" type="button" class="btn btn-dark" style="font-weight: 900; font-size:16px;">X</button>
                   		<table id="datatablesSimple" class="dataTable-table">
											<thead>
												<tr>
													<th style="width: 20%;"><a>상품명</a></th>
													<th style="width: 20%;"><a>주문수량</a></th>
													<th style="width: 20%;"><a>상품가격</a></th>													
												</tr>
											</thead>

											<tbody>
												<tr v-for="SALD in detail">
													<td>{{SALD.pr_name}}</td>
													<td>{{SALD.od_quantity}}개</td>
													<td>{{SALD.pr_price}}원</td>
												</tr>
											</tbody>
										</table>
             
                   		
                  	</div>
                   	</div>
                   	
                   	
                   	<div id="modalBack" v-if="modal2.show" :style="styleObject">
                     <div style="width:70%; max-height:80%; background: #fff; transform:translate(-50%,0%);
                     border-radius: 10px; padding: 20px; z-index:1; position: absolute; margin-top:3%; left:50%; overflow:auto;">
                     <div style="float: left; width:95%; color:#000; font-weight: 900; font-size:35px">&nbsp&nbsp</div>
                     <button @click="modal2.show=false" type="button" class="btn btn-dark" style="font-weight: 900; font-size:16px;">X</button>
                   		<table id="datatablesSimple" class="dataTable-table">
											<thead>
												<tr>
													<th style="width: 100%; text-align: center;"><a>사유</a></th>													
												</tr>
											</thead>
										
											<tbody>
												<tr v-for="SANLD in detail">

													<td>{{SANLD.an_text}}</td>
		
												</tr>
											</tbody>
										</table>
                 
                   		
                  	</div>
                   	</div>
                   	
                   	
				
					<div class="container-fluid px-4">
						<h6>&nbsp</h6>
							<div
								class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
								<div class="dataTable-top">
									<div>
									<select @change="changeSendApprovalList()" id="changeSendApproval" class="form-control">
  										<option value="0">구매</option>
    									<option value="1">일반</option>
									</select>
									</div>
									<div class="dataTable-search">
										<input class="dataTable-input" type="text"
											placeholder="상품명을 입력해주세요">
									</div>
								</div>
								<div class="card mb-4">
									<div class="card-header">보낸결재</div>
									<div class="card-body">
										<table id="datatablesSimple" class="dataTable-table">
											<thead>
												<tr>
													<th style="width: 20%;"><a>결재부서</a></th>
													<th style="width: 20%;"><a>결재구분</a></th>													
													<th style="width: 20%;"><a>날짜</a></th>
													<th style="width: 20%;"><a>결재상태</a></th>													
													
												</tr>
											</thead>

											<tbody v-if="selectPage[2].show">
												<tr v-for="SAL in list">
													<td @click="getApprovalDetail(SAL.ap_oscode, SAL.ap_code)">{{SAL.of_name}} {{SAL.dp_name}}</td>
													<td @click="getApprovalDetail(SAL.ap_oscode, SAL.ap_code)">{{SAL.cg_name}}</td>
													<td @click="getApprovalDetail(SAL.ap_oscode, SAL.ap_code)">{{SAL.ap_date}}</td>
													<td @click="getApprovalDetail(SAL.ap_oscode, SAL.ap_code)">{{SAL.at_name}}</td>
								
												</tr>
			
											</tbody>
											<tbody v-if="selectPage[3].show">
												<tr v-for="SAAL in list2">
													<td @click="getSendAnyApprovalDetail(SAAL.ap_code)">{{SAAL.of_name}} {{SAAL.dp_name}}</td>
													<td @click="getSendAnyApprovalDetail(SAAL.ap_code)">{{SAAL.cg_name}}</td>
													<td @click="getSendAnyApprovalDetail(SAAL.ap_code)">{{SAAL.ap_date}}</td>
													<td @click="getSendAnyApprovalDetail(SAAL.ap_code)">{{SAAL.at_name}}</td>
								
												</tr>
			
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<input id="detectRandering" type="hidden" value="ccc"/>
				</template>

<!-------------------------------------------JES-------------------------------------------->
				   <template v-if="display[9].show" >
            
            
            
            <div id="id01" class="w3-modal">
                   <div class="w3-modal-content">
                        <div class="w3-container">
                          <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
                     <div style="max-width: 100%; width: 100%; display: table; background: #fff; border-radius: 10px; padding: 20px; z-index: 1;">
               <table id="datatablesSimple" class="dataTable-table">
               <table width='700' cellpadding='0' cellspacing='0' align='center' class='border_all'>

                <tr>
                 <td width='100%'>
      <table cellpadding='0' cellspacing='0' height='65' width='100%'><tr>
      <td rowspan='2' align='center' width='360' class='border_tit'><font size='6'><b>세 금 계 산 서</b></font></td>
      <td rowspan='2' width='5' align='center' class='border_tit'><font size='4'><b>[</b></font></td>
      <td rowspan='2' width='70' align='center' class='border_tit'>공급자&nbsp;<br>보 &nbsp;관 &nbsp;용&nbsp;</td>
      <td rowspan='2' width='5' align='center' class='border_tit'><font size='4'><b>]</b></font></td>
     </tr>

    </table>
   </td>
  </tr>
  <tr> 
   <td>
    <table cellpadding='0' cellspacing='0' width='700' >
     <tr>
      <td class='border_up' align='center' width='17' rowspan='5'>공<br><br><br>급<br><br><br>자</td>
      <td class='border_up' align='center' width='55' height='33'>등록번호</td>
      <td class='border_up' align='center' width='278' colspan='5' >{{bean.tb_spcorpnum}}</td>
      <td class='border_up' align='center' width='17' rowspan='5'>공<br>급<br>받<br>는<br>자</td>
      <td class='border_up' align='center' width='55'>등록번호</td>
      <td class='border_top' align='center' width='278' colspan='5' >{{bean.tb_clcorpnum}}</td>
      
     </tr>
     <tr>
      <td class='border_up' align='center' width='55' height='33'>상 호<br>(법인명)</td>
      <td class='border_up' align='center' width='100' colspan='3'>{{bean.tb_spname}}</td>
      <td class='border_up' align='center' width='12' colspan='1'>성<br>명</td>
      <td class='border_up' align='right' width='94' colspan='1'>인</td>
      <td class='border_up' align='center' width='55'>상 호<br>(법인명)</td>
      <td class='border_up' align='center' width='100' colspan='3'  >{{bean.tb_clname}}</td>
      <td class='border_up' align='center' width='12' colspan='1'>성<br>명</td>
      <td class='border_top' align='right' width='94' colspan='2'>인</td>
     </tr>
     <tr>
      <td class='border_up' align='center' width='55' height='33'>사업장<br>주  소</td>
      <td class='border_up' align='center' width='278' colspan='5'>{{bean.tb_spaddress}}</td>
      <td class='border_up' align='center' width='55'>사업장<br>주  소</td>
      <td class='border_top' align='center' width='278' colspan='6' >{{bean.tb_claddress}}</td>
     </tr>
     <tr>
      <td class='border_up' align='center' width='55' height='33'>업  태</td>
      <td class='border_up' align='center' width='148' colspan='1'>{{bean.spbtname}}</td>
      <td class='border_up' align='center' width='12' colspan='1'>종<br>목</td>
      <td class='border_up' align='center' width='106' colspan='3'>{{bean.spbkname}}</td>
      <td class='border_up' align='center' width='55'>업 &nbsp; 태</td>
      <td class='border_up' align='center' width='148' colspan='1' >{{bean.clbtname}}</td>
      <td class='border_up' align='center' width='12' colspan='1'>종<br>목</td>
      <td class='border_up' align='center' width='106' colspan='4'>{{bean.clbkname}}</td>   
     </tr>
     <tr>
      <td class='border_up' align='center' width='55' height='33' >E-mail</td>
      <td class='border_up' align='center' width='148' colspan='5' >{{bean.tb_spemail}}</td>
      <td class='border_up' align='center' width='55' height='33' >E-mail</td>
      <td class='border_up' align='center' width='148' colspan='6' >{{bean.tb_clemail}}</td>
     </tr>
    </table>
   </td>
  </tr>
  
   <tr>
   <td width='100%'>
    <table cellpadding='0' cellspacing='0' width='700' >
      <tr>
      <td class='border_up' align='center' width='195' height='33'>품 &nbsp; &nbsp; &nbsp; 목</td>  
      <td class='border_up' align='center' width='65' height='33'>수 량</td>
      <td class='border_up' align='center' width='150' height='33'>공급가액</td>
      <td class='border_up' align='center' width='83' height='33'>세 액</td>
      <td class='border_up' align='center' width='122' height='33'>합계금액</td>
      </tr>
      
      <tr>
      <td class='border_up' align='center' width='195' height='33'  v-for="od in od">{{od.pr_name}}</td>      
      <td class='border_up' align='center' width='65' height='33'  v-for="od in od">{{od.od_quantity}}</td>      
      <td class='border_up' align='center' width='150' height='33'  v-for="od in od">{{od.pr_price}}</td>      
      <td class='border_up' align='center' width='83' height='33'  v-for="od in od">{{od.pr_tax}}</td>
      <td class='border_up' align='center' width='83'height='33'  v-for="od in od">{{od.od_quantity*(od.pr_tax+od.pr_price)}}</td>            
      </tr>
 
    </table>
   </td>
  </tr>
 

  <tr>
   <td width='100%'>
    <table cellpadding='0' cellspacing='0' width='700' >
     <tr align='justify'>   
     <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td> 
      <td height='33'>{{bean.tb_ttprice}} 이를 영수합니다.</td>
     </tr>

  
    </table>
   </td>
  </tr> 
</table>

<table width='700' cellpadding='0' cellspacing='0' align='center' class='border_all_red'>

 <tr>
  <td width='100%'>
    <table cellpadding='0' cellspacing='0' height='65' width='100%'><tr>
      <td rowspan='2' align='center' width='360' class='border_tit_red'><font size='6'><b>세 금 계 산 서</b></font></td>
      <td rowspan='2' width='5' align='center' class='border_tit_red'><font size='4'><b>[</b></font></td>
      <td rowspan='2' width='70' align='center' class='border_tit_red'>공급받는자&nbsp;<br>보 &nbsp;관 &nbsp;용&nbsp;</td>
      <td rowspan='2' width='5' align='center' class='border_tit_red'><font size='4'><b>]</b></font></td>
     </tr>

    </table>
   </td>
  </tr>
  <tr> 
   <td>
    <table cellpadding='0' cellspacing='0' width='700' >
     <tr>
      <td class='border_up_red' align='center' width='17' rowspan='5'>공<br><br><br>급<br><br><br>자</td>
      <td class='border_up_red' align='center' width='55' height='33'>등록번호</td>
      <td class='border_up_red' align='center' width='278' colspan='5' >{{bean.tb_spcorpnum}}</td>
      <td class='border_up_red' align='center' width='17' rowspan='5'>공<br>급<br>받<br>는<br>자</td>
      <td class='border_up_red' align='center' width='55'>등록번호</td>
      <td class='border_top_red' align='center' width='278' colspan='5' >{{bean.tb_clcorpnum}}</td>
      
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='55' height='33'>상 호<br>(법인명)</td>
      <td class='border_up_red' align='center' width='100' colspan='3'>{{bean.tb_spname}}</td>
      <td class='border_up_red' align='center' width='12' colspan='1'>성<br>명</td>
      <td class='border_up_red' align='right' width='94' colspan='1'>인</td>
      <td class='border_up_red' align='center' width='55'>상 호<br>(법인명)</td>
      <td class='border_up_red' align='center' width='100' colspan='3'  >{{bean.tb_clname}}</td>
      <td class='border_up_red' align='center' width='12' colspan='1'>성<br>명</td>
      <td class='border_top_red' align='right' width='94' colspan='2'>인</td>
     </tr>
     
     
     
     
     <tr>
      <td class='border_up_red' align='center' width='55' height='33'>사업장<br>주  소</td>
      <td class='border_up_red' align='center' width='278' colspan='5'>{{bean.tb_spaddress}}</td>
      <td class='border_up_red' align='center' width='55'>사업장<br>주  소</td>
      <td class='border_top_red' align='center' width='278' colspan='6' >{{bean.tb_claddress}}</td>
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='55' height='33'>업  태</td>
      <td class='border_up_red' align='center' width='148' colspan='1'>{{bean.spbtname}}</td>
      <td class='border_up_red' align='center' width='12' colspan='1'>종<br>목</td>
      <td class='border_up_red' align='center' width='106' colspan='3'>{{bean.spbkname}}</td>
      <td class='border_up_red' align='center' width='55'>업 &nbsp; 태</td>
      <td class='border_up_red' align='center' width='148' colspan='1' >{{bean.clbtname}}</td>
      <td class='border_up_red' align='center' width='12' colspan='1'>종<br>목</td>
      <td class='border_up_red' align='center' width='106' colspan='4'>{{bean.clbkname}}</td>   
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='55' height='33' >E-mail</td>
      <td class='border_up_red' align='center' width='148' colspan='5' >{{bean.tb_spemail}}</td>
      <td class='border_up_red' align='center' width='55' height='33' >E-mail</td>
      <td class='border_up_red' align='center' width='148' colspan='6' >{{bean.tb_clemail}}</td>
     </tr>
    </table>
   </td>
  </tr>
  
   <tr>
   <td width='100%'>
    <table cellpadding='0' cellspacing='0' width='700' >
      <tr>
      <td class='border_up_red' align='center' width='195' height='33'>품 &nbsp; &nbsp; &nbsp; 목</td>  
      <td class='border_up_red' align='center' width='65' height='33'>수 량</td>
      <td class='border_up_red' align='center' width='150' height='33'>공급가액</td>
      <td class='border_up_red' align='center' width='83' height='33'>세 액</td>
      <td class='border_up_red' align='center' width='122' height='33'>합계금액</td>
      </tr>
      
      <tr>
      <td class='border_up_red' align='center' width='195' height='33' v-for="od in od">{{od.pr_name}}</td>      
      <td class='border_up_red' align='center' width='65' height='33' v-for="od in od">{{od.od_quantity}}</td>      
      <td class='border_up_red' align='center' width='150' height='33' v-for="od in od">{{od.pr_price}}</td>      
      <td class='border_up_red' align='center' width='83' height='33' v-for="od in od">{{od.pr_tax}}</td>
      <td class='border_up_red' align='center' width='83'height='33' v-for="od in od">{{od.od_quantity*(od.pr_tax+od.pr_price)}}</td>            
      </tr>
 
    </table>
   </td>
  </tr>

  <tr>
   <td width='100%'>
    <table cellpadding='0' cellspacing='0' width='700' >
     <tr align='justify'>   
     <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td> 
      <td height='33'>{{bean.tb_ttprice}} 이를 영수합니다.</td>
     </tr>

  
    </table>
   </td>
  </tr> 
</table>   
</table>   
               
                                          
                     </div>
                     </div>
                     </div>
                     </div>
            
            
            <table id="datatablesSimple" class="dataTable-table">
                              <thead>
                                 <tr>
                                    <th data-sortable style="width: 25%;"><a>세금계산서코드</a></th>
                                    <th data-sortable style="width: 25%;"><a>주문코드</a></th>
                                    <th data-sortable style="width: 25%;"><a>고객사코드</a></th>
                                    <th data-sortable style="width: 25%;"><a>고객사명</a></th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr v-for="list in list"
                                    onclick="document.getElementById('id01').style.display='block'" @click="taxDetail(list.tb_code)">
                                    <td>{{list.tb_code}}</td>
                                    <td>{{list.tb_oscode}}</td>
                                    <td>{{list.tb_clcode}}</td>
                                    <td>{{list.tb_clname}}</td>
                                 </tr>
                                 </tbody>                                                   
                           </table>
                           <input id="detectRandering" type="hidden" value="ccc"/>
            </template>
            
          
				<template v-if="display[10].show">
                        <div
                           class="d-sm-flex align-items-center justify-content-between mb-4">
                           <h1 class="h3 mb-0 text-gray-800">예산 조회</h1>
                        </div>
                        <div style="margin: 1%; padding: 1%; box-shadow: rgb(34, 34, 34) 0px 0px 10px;">
                           <div >
                              <table id="datatablesSimple" class="dataTable-table">
                                 <thead>
                                    <tr>
                                       <th>회사 이름</th>
                                       <th>오피스 코드</th>
                                       <th>부서 코드</th>
                                       <th>총 예산</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                       <td>{{list.of_name}}</td>
                                       <td>{{list.bg_ofcode}}</td>
                                       <td>{{list.bg_dpcode}}</td>
                                       <td>{{list.bg_budget}}</td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                        <input id="detectRandering" type="hidden" value="ccc"/>
                     </template>
<!------------------------------------------------------------------------------------------>
			</div>
		</main>
		</div>
		</div>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
   <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃해?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃할거야?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary"  onclick="readyAccessIntranet('-1','/AccessOutIntranet')" >Logout</a>
                </div>
            </div>
        </div>
    </div>
  <script >
  function gettingRanking(data){
	  console.log(data);
	  	let myChartOne = document.getElementById('myChartOne').getContext('2d');
	  	let doughnut = new Chart(myChartOne,{
	  		type:'doughnut',
	  		data : {
	  			labels:[data[0].pr_name, data[1].pr_name, data[2].pr_name, data[3].pr_name,data[4].pr_name],
	  			datasets :[{
	  				label:'베스트상품 5',
	  				data : [
	  					data[0].od_quantity,data[1].od_quantity,data[2].od_quantity,data[3].od_quantity,data[4].od_quantity
	  				],
	  				backgroundColor:['rgb(2,117,216)','rgb(255,100,95)','rgb(255,100,132)','rgb(255,205,86)','rgb(255,150,86)'],
	  				hoverBorderWidth : 5
	  			}]
	  		},
	  		option : {
	  			title :{
	  				display:true,
	  				text:'베스트상품 5',
	  				fontSize:20,
	  				fontColor:'red'
	  			}
	  		}
	  	
	  	});
	  	
	  }
  


  </script>
		
	<script src="${pageContext.request.contextPath}/resources/vue/vue.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jsIYJ.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/js.js"></script>
	
	
	<!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/Chart.min.js"></script>



</body>

</html>