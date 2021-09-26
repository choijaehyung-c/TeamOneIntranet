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


    <title>Dashboard</title>

    <!-- Custom fonts for this template-->
   <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    
    <link href="${pageContext.request.contextPath}/resources/css/IYJ.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
  
 

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
                <div class="sidebar-brand-text mx-3" href="home.jsp">ICIA Technology <sup>2</sup></div>
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
                    <i class="fas fa-fw fa-cog"></i>
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
                    <i class="fas fa-fw fa-wrench"></i>
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
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>전자결재</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">전자결재</h6>
                        <div class="collapse-item" onClick="ApprovalPage()">주문결재 신청</div>
                        <div class="collapse-item" onClick="anyApprovalPage()">일반결재 신청</div>
                        <div class="collapse-item" onClick="receiveApprovalPage()">받은결재함</div>
                        <div class="collapse-item" onClick="sendApprovalPage()">보낸결재함</div>

                    </div>
                </div>
            </li>
         
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities3"
                    aria-expanded="true" aria-controls="collapseUtilities3">
                    <i class="fas fa-fw fa-wrench"></i>
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
                    <i class="fas fa-fw fa-folder"></i>
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
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">My page</span>
                                
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
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
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
            <div  style="height: 100%; width: 95%; margin-left:5%">

                                                            
                           <div id="sidebarLayer"
                              style="position: absolute; right:0.4%; top: 50px; width: 100px; height: 100px; border: 1px solid #ddd; text-align: center; background-color: #FFFFFF; z-index: 1000;">
                           <div>My Cart</div>                                                               
                           </div>
                     <span style="margin-right:10px;" v-for="li in list" @click="getCateName(li.bk_code)">{{li.bk_name}}</span>
                        
                        <div style="margin-top:50px;">
                        <div v-for="ll in detail" @click="getCateItem(ll.cate)">{{ll.cate_name}}</div>
                        </div>

                        <div class="row" v-for="(item,index) in items" style="margin-bottom:10px;">
                           <img class="img-fluid fit-cover w-sm-100 h-sm-100 rounded-1 absolute-sm-centered"
                              :src="item.pr_image" alt="" style="width:200px; height:180px; border-radius:20px;">
                        <div class="col-sm-7 col-md-8">
                              <div class="row">
                                 <div class="col-lg-8">
                                    <h5 class="mt-3 mt-sm-0">
                                       <a class="text-dark fs-0 fs-lg-1">
                                          {{item.pr_name}}</a>
                                    </h5>
                                    <p class="fs--1 mb-2 mb-md-3">
                                       <a class="text-500" >{{item.cate_name}}</a>
                                    </p>

                                 </div>
                                 <div
                                    class="col-lg-4 d-flex justify-content-between flex-column">
                                    <div>
                                       <h4 class="fs-1 fs-md-2 text-warning mb-0">{{item.pr_price}}</h4>


                                       <div class="d-none d-lg-block">
                                          <p class="fs--1 mb-1">
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
                                             type="number" min="0" max="10" value="0" style="max-width: 50px">
                                       </div>
                                       <div class="mt-2">
                                       <div class="btn btn-sm btn-primary d-lg-block mt-lg-2" @click="addCart(item.pr_code,index)">
                                          <svg
                                             class="svg-inline--fa fa-cart-plus fa-w-18"
                                             aria-hidden="true" focusable="false" data-prefix="fas"
                                             data-icon="cart-plus" role="img"
                                             xmlns="http://www.w3.org/2000/svg" viewBox="0 0 3000 550"
                                             data-fa-i2svg="">
                                             <path fill="currentColor"
                                                d="M504.717 320H211.572l6.545 32h268.418c15.401 0 26.816 14.301 23.403 29.319l-5.517 24.276C523.112 414.668 536 433.828 536 456c0 31.202-25.519 56.444-56.824 55.994-29.823-.429-54.35-24.631-55.155-54.447-.44-16.287 6.085-31.049 16.803-41.548H231.176C241.553 426.165 248 440.326 248 456c0 31.813-26.528 57.431-58.67 55.938-28.54-1.325-51.751-24.385-53.251-52.917-1.158-22.034 10.436-41.455 28.051-51.586L93.883 64H24C10.745 64 0 53.255 0 40V24C0 10.745 10.745 0 24 0h102.529c11.401 0 21.228 8.021 23.513 19.19L159.208 64H551.99c15.401 0 26.816 14.301 23.403 29.319l-47.273 208C525.637 312.246 515.923 320 504.717 320zM408 168h-48v-40c0-8.837-7.163-16-16-16h-16c-8.837 0-16 7.163-16 16v40h-48c-8.837 0-16 7.163-16 16v16c0 8.837 7.163 16 16 16h48v40c0 8.837 7.163 16 16 16h16c8.837 0 16-7.163 16-16v-40h48c8.837 0 16-7.163 16-16v-16c0-8.837-7.163-16-16-16z"></path></svg>
                                          <!-- <span class="fas fa-cart-plus"> </span> Font Awesome fontawesome.com -->
                                          <span class="ms-2 d-none d-md-inline-block">장바구니 담기</span></div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>

                     </div>
            </template>
            <template v-if="display[2].show"></template>
<!-------------------------------------------CJH-------------------------------------------->            
            <template v-if="display[3].show"></template>
            <template v-if="display[4].show"></template>
<!-------------------------------------------NSB-------------------------------------------->            
            <template v-if="display[5].show">
            <button class="btn btn-dark"  v-on:click="orderApprovalPage()">주문 결재 작성</button>
             <button class="btn btn-dark"  v-on:click="refundApprovalPage()">반품 결재 작성</button>
            </template>
<!-- -------------------------------------------------------------------------------------------- -->      
            <template v-if="displayNSB[0].show">
            <button class="btn btn-dark"  v-on:click="orderApprovalPage()">주문 결재 작성</button>
             <button class="btn btn-dark"  v-on:click="refundApprovalPage()">반품 결재 작성</button>
                <div id="id01" class="w3-modal">
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
                                 <tr v-for="list in cartNSB"  @click="inputCart(list)">
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
                              <td>{{bean.dp_name}}</td>
                              <th>기안자</th>
                              <td colspan="2">{{bean.ep_name}}</td>
                           </tr>
                           <tr>
                              <th>결재구분</th>
                              <td colspan="4"><select id="div_apv_sq" class="form-control"
                                 name="div_apv_sq">
                                    <option value="O">주문</option>
                              </select></td>
                           </tr>
                           <tr >
                              <th>수신부서</th>
                              <td v-if="displayNSB[1].show">{{bean2.dp_name}}</td>
                              <th>수신자</th>
                              <td v-if="displayNSB[1].show">{{bean2.ep_name}}</td>
                              <td><button class="btn btn-dark"  onclick="document.getElementById('id01').style.display='block'" @click="getDP()">부서찾기</button></td>
                              </tr>

                           <table id="datatablesSimple" class="dataTable-table"> 
                              <tr>
                              <th>기안내용</th>
                              </tr>
                              <tr>
                              <td><button class="btn btn-dark" onclick="document.getElementById('id02').style.display='block'" @click="getApprovalCart()">장바구니</button></td>                           
                          	  </tr>
                              <tr v-if="displayNSB[6].show" >
                              <th>공급사코드</th>
                              <th>품명</th>
                              <th>품목코드</th>
                              <th>개별가격</th>
                              <th>수량</th>
                              <th>총가격</th>
                              </tr>
                              <tr v-if="displayNSB[6].show" v-for="list in inputcart">
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
            </template>
<!-- -------------------------------------------------------------------------------------------- -->            
            <template v-if="displayNSB[2].show">
            <button class="btn btn-dark"  v-on:click="orderApprovalPage()">주문 결재 작성</button>
             <button class="btn btn-dark"  v-on:click="refundApprovalPage()">반품 결재 작성</button>
              
                <div id="id01" class="w3-modal">
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
                                 <tr v-for="list in list" @click="inputDP2(list.ep_code)">
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
                                    <th data-sortable style="width: 14.2857%; background-color: #E0E0E0;"><a>주문코드</a></th>
                                    <th data-sortable style="width: 14.2857%; background-color: #E0E0E0;"><a>주문날짜</a></th>
                                    <th data-sortable style="width: 14.2857%; background-color: #E0E0E0;"><a>주문상태</a></th>
                                    <th data-sortable style="width: 14.2857%; background-color: #E0E0E0;"><a>상품코드</a></th>
                                    <th data-sortable style="width: 14.2857%; background-color: #E0E0E0;"><a>상품명</a></th>
                                    <th data-sortable style="width: 14.2857%; background-color: #E0E0E0;"><a>수량</a></th>
                                    <th data-sortable style="width: 14.2857%; background-color: #E0E0E0;"><a>가격</a></th>            
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr v-for="list in list" @click="inputOrder(list.os_code)">
                                    <td>{{list.os_code}}</td>
                                    <td>{{list.os_date}}</td>
                                    <td>{{list.os_state}}</td>   
                                    <td>{{list.od_prcode}}</td>   
                                    <td>{{list.pr_name}}</td>   
                                    <td>{{list.od_quantity}}</td>   
                                    <td>{{list.pr_price + list.pr_tax}}</td>                              
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
                              <td>{{bean.dp_name}}</td>
                              <th>기안자</th>
                              <td colspan="2">{{bean.ep_name}}</td>
                           </tr>
                           <tr>
                              <th>결재구분</th>
                              <td colspan="4"><select id="div_apv_sq" class="form-control"
                                 name="div_apv_sq">
                                    <option value="R">반품</option>
                                    <option value="E">교환</option>
                              </select></td>
                           </tr>
                           <tr >
                              <th>수신부서</th>
                              <td v-if="displayNSB[3].show">{{bean2.dp_name}}</td>
                              <th>수신자</th>
                              <td v-if="displayNSB[3].show">{{bean2.ep_name}}</td>
                              <td><button class="btn btn-dark" onclick="document.getElementById('id01').style.display='block'" @click="getDP2()">부서찾기</button></td>
                              </tr>

                           <table id="datatablesSimple" class="dataTable-table" v-if="displayNSB[3].show" > 
                              <tr >
                              <th>기안내용</th>
                              <td><button class="btn btn-dark" onclick="document.getElementById('id02').style.display='block'" @click="getApprovalOrderList(bean.ep_ofcode)">거래내역</button></td>
                              </tr>

                              <tr >
                              <th>주문코드</th>
                              <th>주문날짜</th>
                              <th>주문상태</th>
                              <th>상품코드</th>
                              <th>상품명</th>
                              <th>주문수량</th>
                              <th>가격</th>
                              </tr>
                              <tr v-if="displayNSB[4].show">
                              <td >{{bean3.os_code}}</td>
                              <td >{{bean3.os_date}}</td>
                              <td >{{bean3.os_state}}</td>
                              <td >{{bean3.od_prcode}}</td>
                              <td >{{bean3.pr_name}}</td>
                              <td >{{bean3.od_quantity}}</td>
                              <td >{{bean3.pr_price + bean3.pr_tax}}</td>
                              </tr>
                              
                              </table>
                              <tr>                           
                              <td ><button class="btn btn-dark" @click="issueApproval()" style="float:right">기안하기</button></td>
                              </tr>                                    
                           </tbody>
                        </table>                  
               </template>
      <!-- -------------------------------------------------------------------------------------------- -->      
            <template v-if="display[6].show">            
                  
                  <div id="id01" class="w3-modal">
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
                              <td>{{bean.dp_name}}</td>
                              <th>기안자</th>
                              <td colspan="2">{{bean.ep_name}}</td>
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
                              <td v-if="displayNSB[5].show">{{bean2.dp_name}}</td>
                              <th>수신자</th>
                              <td v-if="displayNSB[5].show">{{bean2.ep_name}}</td>
                              <td><button class="btn btn-dark" onclick="document.getElementById('id01').style.display='block'" @click="getDP3()">부서찾기</button></td>
                              </tr>

                           <table id="datatablesSimple" class="dataTable-table"> 
                              <tr>
                              <th>기안내용</th>
                              </tr>
                              <tr>
                              <td><input type="text" style="text-align:center; width:80%; height:400px;"></td>
                              <td><button class="btn btn-dark" @click="issueApproval2()">기안하기</button></td>
                              </tr>
                              </table>                                    
               </tbody>
            </table>               
            </template>
            

<!-------------------------------------------HSM--------------------------------------------
            <template v-if="display[7].show"></template>
            <template v-if="display[8].show"></template>
-------------------------------------------------------------------------------------------->
           
           
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
            </template>
            
<!-------------------------------------------HSM--------------------------------------------
            <template v-if="display[10].show"></template>
-------------------------------------------------------------------------------------------->
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
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃해?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃할거야?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary"  onclick = "readyAccessIntranet('-1','/AccessOutIntranet')" >Logout</a>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript"> 

   function scroll_follow(id) {
      $(window).scroll(function() //스크롤이 움직일때마다 이벤트 발생
      {
         var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
         $(id).stop().animate({
            top : position + "px"
         }, 1); //해당 오브젝트 위치값 재설정
      });
   }
   scroll_follow("#scroll");
   //스크롤이 생기도록 <br> 을 여러게 넣은 부분..
   $(document).ready(function() {
      for (var i = 0; i < 200; i++) {
         $('#brr').html($('#brr').html() + "<br>" + i);
      }
   });
</script> 
   
   <script src="${pageContext.request.contextPath}/resources/vue/vue.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/jsNSB.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/accessNSB.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/js.js"></script>
   <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

</body>

</html>