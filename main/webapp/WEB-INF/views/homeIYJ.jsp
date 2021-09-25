<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ICIA Technology</title>

    <!-- Custom fonts for this template-->
   <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    
    <link href="${pageContext.request.contextPath}/resources/css/IYJ.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script> 
  
 

<script>

$(window).scroll(function(){
	var scrollTop = $(document).scrollTop()+100;
	if (scrollTop < 150) {
	 scrollTop = 150;
	}
	$("#sidebarLayer").stop();
	$("#sidebarLayer").animate( { "top" : scrollTop });
	});

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
                <a class="nav-link" onClick="mainPage()">
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
                        <h6 class="collapse-header" onClick="orderManage()">주문관리</h6>
                        <div class="collapse-item"  onClick="orderList()">주문함</div>
                        <div class="collapse-item"  onClick="shipList()">배송조회</div>
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
                        <div class="collapse-item" onClick="orderApprovalPage()">주문결재 신청</div>
                        <div class="collapse-item" onClick="anyApprovalPage()">일반결재 신청</div>
                        <div class="collapse-item" onClick="receiveApprovalPage()">받은결재함</div>
                        <div class="collapse-item" onClick="sendApprovalPage()">보낸결재함</div>

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
                        <div class="collapse-item" onClick="budgetPage()">예산조회</div>
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
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
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
                    <!-- Content Row -->
                    <div class="row">
                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> Direct
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> Social
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> Referral
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                        </div>

                        <div class="col-lg-6 mb-4">

                        </div>
                    </div>

                </div>
				</template>
<!-------------------------------------------IYJ-------------------------------------------->			
							
				<template v-if="display[1].show">
								<div id="id01" class="w3-modal w3-animate-opacity" >
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
							</template>
							
				<template v-if="display[2].show">
						<div id="modal01" class="w3-modal" onclick="this.style.display='none'">
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
												aria-sort="ascending" aria-label="Image: activate to sort column descending" style="width: 100px;">
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
										</tr>
									</thead>
                                    
                                    <tbody id="table">        
                                  		<tr class="odd" v-for="li in cart">
                                  			<td id="img" ><input type='checkbox'name='chkYn' :value=li.spcode+li.prname+li.prcode+li.price+li.count+li.price*li.count /><img :src="li.img" style='width:150px; cursor:zoom-in' @click="getPrDetail(li.prcode)" onclick="document.getElementById('modal01').style.display='block'"/></td>
                                  			<td id="spcode">{{li.spcode}}</td>
                                  			<td id="prname">{{li.prname}}</td>
                                  			<td id="prcode">{{li.prcode}}</td>
                                  			<td id="price">{{li.price}}</td>
                                  			<td id="count"><input type="number"  :value=li.count v-model="li.count" style="width:45%;"></td>
                                  			<td id="tt_price"><input type='text' readonly name='tt_price' :value=li.price*li.count>원</td>
                                  			
                                  		</tr>
                                     </tbody>
                                </table></div></div>
                            </div>
                        </div>
                    </div>

                </div>
										
					</div>
				
				</template>
<!-------------------------------------------CJH-------------------------------------------->				
				<template v-if="display[3].show"></template>
				<template v-if="display[4].show"></template>
<!-------------------------------------------NSB-------------------------------------------->				
				<template v-if="display[5].show"></template>
				<template v-if="display[6].show"></template>
<!-------------------------------------------HSM-------------------------------------------->
				<template v-if="display[7].show"></template>
				<template v-if="display[8].show"></template>
<!-------------------------------------------JES-------------------------------------------->
				<template v-if="display[9].show"></template>
				<template v-if="display[10].show"></template>
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

	
	<script src="${pageContext.request.contextPath}/resources/vue/vue.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/js.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jsIYJ.js"></script>
	<!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>



</body>

</html>