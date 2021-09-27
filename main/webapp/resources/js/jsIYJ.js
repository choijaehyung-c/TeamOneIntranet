
const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
		selectPage:[{show:false},{show:false},{show:false},{show:false}],
		displayNSB:[{show:false}/*주문결재세션기입*/,{show:false}/*수신부서기입*/,{show:false}/*반품세션기입*/,{show:false}/*반품부서기입*/,{show:false}/*거래내역기입*/,{show:false}/*일반부서기입*/,{show:false}/*장바구니기입*/],
		modal:{show:false},
		modal2:{show:false},
		list:[],
		list2:[],
		list3:[],
		items:[],
		cart:[],
		detail:[],
		cartNSB:[],
	  	inputcart:[],//모달정보들여기에 담기
	  	od:[],
		prdetail:{},
		bean:{},
      	bean2:{},
      	bean3:{}
	},
	methods:{
		changePage:function(page){
			for(i=0;i<this.display.length; i++){
				this.display[i].show=false;
			}
			this.display[page].show = true;
		},
		 changePageNSB:function(page){
         for(i=0;i<this.displayNSB.length; i++){
            this.displayNSB[i].show=false;
         }
         this.displayNSB[page].show = true;
      },
		modalOpen:function(){
			this.modal.show = true;
		},
		modalClose:function(){
			this.modal.show = false;
		}, 
		detailPush:function(jsondata){
			this.prdetail={};
			this.prdetail = jsondata;
		},
		detailPush2:function(jsondata){
			this.detail = jsondata;
		},
		listPush:function(jsondata){
			this.list = jsondata;
		},
		list2Push:function(jsondata){
			this.list2 = jsondata;
		},
		list3Push:function(jsondata){
			this.list3 = jsondata;
		},
		beanPush:function(jsondata){
         this.bean = jsondata;
      	},
     	 bean2Push:function(jsondata){
         this.bean2 = jsondata;
     	 },
      	bean3Push:function(jsondata){
         this.bean3 = jsondata;
      	},
		getBkindPage:function(){			
				postAjaxJson('rest/getBkind', 'getBkindList','j',clientData='');
		},
		getCateName:function(bkcode){
			postAjaxJson('rest/GetCateName', 'getCateDetail','j',bkcode);
		},
		getCateItem:function(cate){
			postAjaxJson('rest/GetCateItem','cateItemList','j',cate);
		},
      	changeWon:function(){//가격 콤마찍기
            for(i=0; i<this.items.length;i++){
            this.items[i].pr_price = this.items[i].pr_price.toLocaleString();
            this.items[i].pr_tax = this.items[i].pr_tax.toLocaleString();
         }			
      },		
		addSideBar:function(prcode,index,spcode,price,tax,img,prname){
			let count = document.getElementsByName("quantity")[index].value;
			let add = document.getElementById("add"); //담기버튼
			let unit_price = price+tax;
			//let pr_price = (price+tax)*count;
			let value = prcode +','+ prname+ '>' + spcode +':'+ count + '&' +unit_price+ '#' +img; //split(',')는 상품코드와 공급사코드 (':')갯수 ('/')는 가격
			let cart = document.getElementById("space");
			let html ="";
				
				html += `<div id="setDiv${index}">`
				html += "<img src='"+img+"' style='width:90px;'/>";
				html += "<div style='font-size:12px;'>"+prname+"</div><span style='font-size:10px;'>("+prcode+")</span>";
				html += "<div style='font-size:12px;'>" + count +"개</div>";
				html += `<div id="delCart" onClick="delCarts(${index})" style='font-size:13px; cursor:pointer;'>[삭제]</div>`;
				html +=	"<input type='hidden' value='"+value+"' name='ckval'/>";
				html += "<input type='hidden' value='"+prcode+"' name='prcode'/></div>";
			
				add.style.display= "block";
				cart.innerHTML +=html;
		},
		addCart:function(){				
				var val =[];
				var pr = [];								
				const values = document.getElementsByName("ckval");
				const prcode = document.getElementsByName("prcode");
				const name = 'addCart-';	
				
				for(r=0; r<prcode.length; r++){
					let prr = prcode[r].value;
					let vall = values[r].value;
					pr.push(prr);
					val.push(vall);
					
					setCookie(name + pr[r], val[r], 7);
						
				}
				alert('장바구니에 담겼습니다.');
				
								
		},
		getCartPage:function(){
			this.cart=[];									
			let ck = document.cookie.split(';');
			let cookie='';
					
		//이름찾는 
		for(var i in ck) {
            if(ck[i].search('addCart-')!=-1) {
				//alert(ck[i].search('addCart-')); //모든 쿠키를 확인해서 쿠키당 addCart가 들어가면 1을반환 없으면 0을반환  
                cookie = ck[i]								
           	   	let img = cookie.split('#')[1];
				let spcode = cookie.split('>')[1].split(':')[0];
				let prname=cookie.split(',')[1].split('>')[0];
				let prcode=cookie.split('-')[1].split('=')[0];
				let price = cookie.split('&')[1].split('#')[0];
				let count = cookie.split(':')[1].split('&')[0];
				let tt_price = price * count;
				
				let ckData = {img:img, spcode:spcode, prname:prname, prcode:prcode,price:price,count:count,ttprice:tt_price};

				this.cart.push(ckData);
																																				
			}	 
		}
	},
	searchItem:function(){
	let word = document.getElementsByName("word")[0].value;
		if(word!=""){
			postAjaxJson('rest/getSearchItem','cateItemList','j',word);
		}else{
			alert("검색어를 입력하세요.");
		}
		
	
	},
	sendApproval:function(){
		let chkedValue = document.getElementsByName('chkYn').values;
		let chk_val = [];

		$('input:checkbox[name=chkYn]:checked').each(function(){
			chk_val = $(this).val();
			alert(chk_val);
		});

	},
	getPrDetail:function(prcode){//각 상품의 상세정보
		code = {pr_code:prcode};
		clientData = JSON.stringify(code);
		postAjaxJson('rest/getPrDetail','ItemDetail','j',clientData);
	},
	////////////////////////////////hsm///////////////////////
	getApprovalDetail:function(oscode, apcode='', ofcode=''){
			if(ofcode !=''){				
			this.list2 = {ap_code:apcode, os_code:oscode, of_code:ofcode};
			}	
			let sendJsonData = { ap_oscode: oscode};
			let clientData = JSON.stringify(sendJsonData);
			postAjaxJson('rest/GetApprovalDetail', 'getApprovalDetailPush', 'j', clientData);
		},
		responseAppovalRefuse:function(apcode){
			let sendJsonData = { ap_code:apcode, at_code: "OF"};
			let clientData = JSON.stringify(sendJsonData);
			postAjaxJson('rest/ResponseAppovalRefuse', 'receiveApprovalPage', 's', clientData);
			this.modalClose();
		},
		getDetailInfo:function(oscode, apcode, ofcode){
			this.modalClose();
			this.list2 = {os_code:oscode, ap_code:apcode, of_code:ofcode};
			let sendJsonData = {ap_oscode: oscode};
			let clientData = JSON.stringify(sendJsonData);
			postAjaxJson('rest/GetApprovalDetail', 'sendToMro', 'j', clientData);
		},
		changeReceiveApproval:function(){
			let num = document.getElementById("changeList").value;
			if(num == 0){
				let sendJsonData = { ap_todpcode: "MT", ap_toofcode: "INC01H" };
				let clientData = JSON.stringify(sendJsonData);
				postAjaxJson('rest/GetApprovalList', 'getApprovalListPush', 'j', clientData);
			}else{
				let sendJsonData = { ap_todpcode: "MT", ap_toofcode: "INC01H" };
				let clientData = JSON.stringify(sendJsonData);
				postAjaxJson('rest/GetAnyApprovalList', 'getAnyApprovalListPush', 'j', clientData);
			}
		},
		getAnyApprovalDetail:function(apcode){
			this.list2 = {ap_code: apcode};
			let sendJsonData = { ap_code: apcode};
			let clientData = JSON.stringify(sendJsonData);
			postAjaxJson('rest/GetAnyApprovalDetail', 'getAnyApprovalDetailPush', 'j', clientData);
		},
		responseAnyAppoval:function(apcode, atcode){
			let sendJsonData = { ap_code: apcode, at_code:atcode};
			let clientData = JSON.stringify(sendJsonData);
			alert(clientData);
			postAjaxJson('rest/ResponseAnyAppoval', 'getAnyApprovalList', 's', clientData);	
		},
		changeSendApprovalList:function(){
			let num = document.getElementById("changeSendApproval").value;
			if(num == 0){
				let sendJsonData = { ap_fromdpcode: "MK", ap_fromofcode: "SEO01B" };
				let clientData = JSON.stringify(sendJsonData);
				postAjaxJson('rest/GetSendApprovalList', 'getSendApprovalListPush', 'j', clientData);
			}else{
				let sendJsonData = { ap_fromdpcode: "MK", ap_fromofcode: "SEO01B" };
				let clientData = JSON.stringify(sendJsonData);
				postAjaxJson('rest/GetSendAnyApprovalList', 'getSendAnyApprovalListPush', 'j', clientData);
			}
		},
		getSendAnyApprovalDetail:function(apcode){
			let sendJsonData = { ap_code: apcode};
			let clientData = JSON.stringify(sendJsonData);
			postAjaxJson('rest/GetAnyApprovalDetail', 'getSendAnyApprovalDetailPush', 'j', clientData);
		},
		////////////////////////////////////////////////////////////////////////////
		
		//주문결재 세션기입
      orderApprovalPage:function(){      
        postAjaxJson('rest/getDrafter','oDrafterVue','j');
        },
      //부서찾기
      getDP:function(){
      postAjaxJson('rest/getDP','DPVue','j');   
      },
      //부서기입
      inputDP:function(epcode){
	  document.getElementById('id01').style.display='none'
      postAjaxJson('rest/inputDP','inputDPVue','j',epcode);      
      },
      //주문결재 장바구니   
      getApprovalCart:function(){
         this.cartNSB=[];                           
         let ck = document.cookie.split(';');
         let cookie='';
               
      //이름찾는 
      for(var i in ck) {
            if(ck[i].search('addCart-')!=-1) {
            //alert(ck[i].search('addCart-')); //모든 쿠키를 확인해서 쿠키당 addCart가 들어가면 1을반환 없으면 0을반환  
                cookie = ck[i]                        
                    let img = cookie.split('#')[1];
            let spcode = cookie.split('>')[1].split(':')[0];
            let prname=cookie.split(',')[1].split('>')[0];
            let prcode=cookie.split('-')[1].split('=')[0];
            let price = cookie.split('&')[1].split('#')[0];
            let count = cookie.split(':')[1].split('&')[0];
            let tt_price = price * count;
            
            let ckData = {img:img, spcode:spcode, prname:prname, prcode:prcode,price:price,count:count,ttprice:tt_price};

            this.cartNSB.push(ckData);                                                                                                         
         }    
      }
      },
	  //장바구니 기입
	  inputCart:function(list){	
		document.getElementById('id02').style.display='none'
		this.inputcart.push(list);
		this.displayNSB[6].show=true;
		
	  },	
      //반품결재
      refundApprovalPage:function(){
      postAjaxJson('rest/getDrafter','rDrafterVue','j');
      },
      getDP2:function(){
      postAjaxJson('rest/getDP','DPVue2','j');   
      },
      inputDP2:function(epcode){
      document.getElementById('id01').style.display='none'
      postAjaxJson('rest/inputDP','inputDPVue2','j',epcode);      
      },
      getApprovalOrderList:function(ofcode){
      postAjaxJson('rest/getApprovalOrderList','getAOList','j',ofcode);
      },   
      inputOrder:function(oscode){
	  document.getElementById('id02').style.display='none'
      postAjaxJson('rest/inputOrder','inputAOList','j',oscode);
      },
      
      //일반결재
      anyApprovalPage:function(){   
      postAjaxJson('rest/getDrafter','aDrafterVue','j');   
      },
      getDP3:function(){
      postAjaxJson('rest/getDP','DPVue3','j');   
      },
      inputDP3:function(epcode){
	  document.getElementById('id01').style.display='none'
      postAjaxJson('rest/inputDP','inputDPVue3','j',epcode);      
      },
	  taxbillPage:function(){
		postAjaxJson('rest/getIssuedTax','IssuedTaxVue','j');
	  },
	  taxDetail:function(tbcode){
		postAjaxJson('rest/getIssuedTaxDetail','IssuedTaxDetailVue','j',tbcode);
	  },
		
      getBudgetPage:function(){
         postAjaxJson('rest/getBudgetList','getBudgetList','j');
         
      }

				
		
}
	
});

//쿠키확인
function getCookie(cname) {
	var name = cname + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var ca = decodedCookie.split(';');

	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}

		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
} 
//쿠키 생성
function setCookie(name,value,day){
	var date = new Date();//현재 날짜
	date.setDate(date.getDate()+day); //오늘날짜 형식 + day는 지정해줄 파람값
			
	var mycookie='';
	mycookie += name + '=' + value + ';';
	mycookie += 'Expires=' + date.toUTCString();//언제까지 유지될지
			
	document.cookie = mycookie; // 쿠키생성
}

//쿠키삭제
function delCookie(name,value){
	var date = new Date();
			
	date.setDate(date.getDate()-1);
			
	//쿠키삭제 
	var setCookie = '';
	setCookie += name +'='+ value+';';
	setCookie += 'Expires=' + date.toUTCString();
				
	document.cookie = setCookie;
}


//쿠키유무 확인
function checkCookie(name){
	var cookies = document.cookie.split(';');
	//console.log(cookies);
	
	let val ="";
			
	for(var i in cookies){
		if(i.indexOf(name)){
			val += i;
			console.log(val);
	}			
 }
	return val;			
}
//onLoad
function mainPage(){
	main.changePage(0);
}

//구매하기 버튼(사이드바)
function getBkinds(){
	main.changePage(1);
	main.getBkindPage();
}

//장바구니 버튼 (사이드바)
function myCartView(){
	main.changePage(2);
	main.getCartPage();
}


//상위 카테고리 목록 불러오기
function getBkindList(data){
	main.list = data;
}

//하위 카테고리 목록
function getCateDetail(data){
	main.detail = data;
}

//카테고리별 아이템목록
function cateItemList(data){
	main.changeWon(data);	
	if(data!=""){
		main.items= data;
	}else{
		alert("해당검색어의 상품이 없습니다.");
	}
}

//사이드 장바구니 삭제
function delCarts(index){
	//index번호랑 맞춰서 삭제하기..
	let set = document.getElementById("setDiv${index}");
    $(`#setDiv${index}`).remove();
	for(i=0;i<set.length;i++){
		if(set[i]==index){
			set.splice(i);
		}
	}
}

//check박스 전체 선택
function selectAll(selectAll)  {
  const checkboxes = document.getElementsByName('chkYn');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}

//상품별 상세정보 (모달)
function ItemDetail(jsonData){
	main.detailPush(jsonData); //detail의 데이터공간에 밀어넣음	
}

function chartMain(of,dp){
	let data = {of_name:of,dp_name:dp};
	let client = JSON.stringify(data);
	postAjaxJson('rest/getRanking', 'gettingRanking','j',client);
	
}


/////////////////////////////////hsm////////////////////////////////////////

function receiveApprovalPage(msg){
	if(msg !=''){
		alert(msg);
	}
	let sendJsonData = { ap_todpcode: "MT", ap_toofcode: "INC01H" };
	let clientData = JSON.stringify(sendJsonData);
	postAjaxJson('rest/GetApprovalList', 'getApprovalListPush', 'j', clientData);
}

function getAnyApprovalList(msg){
	if(msg !=''){
		alert(msg);
	}
	let sendJsonData = { ap_todpcode: "MT", ap_toofcode: "INC01H" };
	let clientData = JSON.stringify(sendJsonData);
	postAjaxJson('rest/GetAnyApprovalList', 'getAnyApprovalListPush', 'j', clientData);
}

function getApprovalListPush(jsondata){
	main.listPush(jsondata);
	main.changePage(7);
	main.selectPage[0].show=true;
	main.selectPage[1].show=false;
}

function getAnyApprovalListPush(jsondata){
	main.list2Push(jsondata);
	main.selectPage[0].show=false;
	main.selectPage[1].show=true;
}


function getApprovalDetailPush(jsondata){
	main.detailPush2(jsondata);
	main.modalOpen();
}
function getAnyApprovalDetailPush(jsondata){
	main.detailPush2(jsondata);
	main.modal2.show = true;
}

function sendApprovalPage(){
	let sendJsonData = { ap_fromdpcode: "MK", ap_fromofcode: "SEO01B" };
	let clientData = JSON.stringify(sendJsonData);
	postAjaxJson('rest/GetSendApprovalList', 'getSendApprovalListPush', 'j', clientData);
}

function getSendApprovalListPush(jsondata){
	main.listPush(jsondata);
	main.changePage(8);
	main.selectPage[3].show = false;
	main.selectPage[2].show = true;
}

function getSendAnyApprovalListPush(jsondata){
	main.list2Push(jsondata);
	main.changePage(8);
	main.selectPage[2].show = false;
	main.selectPage[3].show = true;
}

function getSendAnyApprovalDetailPush(jsondata){
	main.detailPush2(jsondata);
	main.modal2.show = true;
}

function sendToMro(jsondata){
	let jsondataLength = jsondata.length;
	let OD = [];
	for(i=0; i<jsondataLength; i++){
		OD.push({od_prspcode:jsondata[i].od_prspcode, od_quantity:jsondata[i].od_quantity, od_prcode:jsondata[i].od_prcode})
	}
	let sendJsonData = { os_clcode: "INC10H", os_region:"KOR001SEO01BMK",od:OD };
	let clientData = JSON.stringify(sendJsonData);
	postAjaxJson("http://cleverc.online/vue/clientOrder", 'returnStringData', 'j', clientData);
}

function returnStringData(jsondata){
	let jsondataLength = jsondata.length;
	let MOS = [];
	 for(i=0; i<jsondataLength; i++){
		MOS.push({os_code:jsondata[i], os_region:"KOR001SEO01BMK"})
	}
	let sendJsonData = { rl_ioscode: main.list2.os_code,
						 aa_apcode: main.list2.ap_code, 
						 of_code: main.list2.of_code,
						 mos: MOS};
	let clientData = JSON.stringify(sendJsonData);
	alert(clientData);
	postAjaxJson('rest/ResponseAppovalAccept', 'receiveApprovalPage', 's', clientData);
}



////////////////////////////////////NSB///////////////////////

//주문결재 반품결재 분기
function ApprovalPage(){
   main.changePage(5);
   main.changePageNSB(6);
   document.getElementById('id01').style.display='none'
   document.getElementById('id02').style.display='none'
}

//기안자세션기입
function oDrafterVue(jsondata){
   main.changePageNSB(0);
   main.display[5].show=false;
   main.beanPush(jsondata);
}

//부서찾기모달
function DPVue(jsondata){
   main.listPush(jsondata);
   main.displayNSB(0);
}

//선택한 부서정보 기입
function inputDPVue(jsondata){
   main.bean2Push(jsondata);
   main.displayNSB[0].show=true;
   main.displayNSB[1].show=true;
}

//반품 기안자세션기입
function rDrafterVue(jsondata){
   main.changePageNSB(2);
   main.display[5].show=false;
   main.beanPush(jsondata);   
}

//부서찾기모달
function DPVue2(jsondata){
   main.listPush(jsondata);
}
//선택한 부서정보 기입
function inputDPVue2(jsondata){
   main.bean2Push(jsondata);
   main.displayNSB[2].show=true;
   main.displayNSB[3].show=true;
}
//반품 거래내역 모달
function getAOList(jsondata){
   main.listPush(jsondata);
}
//거래내역 기입
function inputAOList(jsondata){
   main.bean3Push(jsondata);
   main.displayNSB[2].show=true;
   main.displayNSB[3].show=true;
   main.displayNSB[4].show=true;
}

function anyApprovalPage(){
   main.anyApprovalPage();
}
//일반결재 기안자 세션 기입
function aDrafterVue(jsondata){
   main.changePage(6);
   main.changePageNSB(6);
   main.beanPush(jsondata);
}
//일반결재 부서찾기 모달
function DPVue3(jsondata){
   main.listPush(jsondata);
}
//일반결재 부서 기입
function inputDPVue3(jsondata){
   main.bean2Push(jsondata);
   main.display[6].show=true;
   main.displayNSB[5].show=true;
}

//세금계산서 페이지 이동
function taxbillPage(){
	main.taxbillPage();
}
//세금계산서 리스트 출력
function IssuedTaxVue(jsondata){
	main.changePage(9);
	main.changePageNSB(6);
	main.listPush(jsondata);
}

function IssuedTaxDetailVue(jsondata){
	main.beanPush(jsondata);
	main.od = jsondata.od;	
}


/////////////////JES///////////////

function getBudgetList(jsonData){ 
   console.log(jsonData); //alert로도 모르겠다면 console.log로 찍어볼것
   main.list = jsonData;
   
}


function getBudget(){
   main.changePage(10);
   main.getBudgetPage();
}

