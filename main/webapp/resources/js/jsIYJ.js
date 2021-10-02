
const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
		selectPage:[{show:false},{show:false},{show:false},{show:false}],
		display2:[{show:true},{show:false}],
		nsbPage:[{show:false}/*주문결재부서기입*/, {show:false}/*거래내역기입*/, {show:false}/*일반결재부서기입*/],
		modal:{show:false},
		modal2:{show:false},
		modalcjh:{show:false},
		modalcjh2:{show:false},
		list:[],
		list1:[],
		list2:[],
		list3:[],
		items:[],
		cart:[],
		detail:[],
		modalList:[],
		cartNSB:[],
	  	inputcart:[],//모달정보들여기에 담기
	  	od:[],
		prdetail:{},
		bean:{},
      	bean2:{},
      	bean3:{},
		sendbean:{},
     	sendbean2:{},
		styleObject:{
			height:'',
			width: 'calc( 100% - 224px )',
			background: 'rgba(0, 0, 0, 0.5)',
			position: 'absolute',
			padding: '20px',
			"z-index": '2',
			"box-shadow":'0 0 8px 8px white inset'
		},
		dupCheck:[],
		loading:false,
		relOs:'',
		RlRegion:''
	},
	methods:{
		changePage:function(page){
			for(i=0;i<this.display.length; i++){
				this.display[i].show=false;
			}
			this.display[page].show = true;
		},
		nsbchangePage:function(){
			for(i=0;i<this.nsbPage.length; i++){
				this.nsbPage[i].show=false;
			}

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
				modalcjhOpen:function(){
			this.modalcjh.show = true;
		},
		modalcjhClose:function(){
			this.dupCheck = [];
			this.modalcjh.show = false;
		},
		modalcjh2Open:function(){
			this.modalcjh2.show = true;
		},
		modalcjh2Close:function(){
			this.modalcjh2.show = false;
		},
		detailPush2:function(jsondata){
			this.detail = jsondata;
		},
		listPush:function(jsondata){
			this.list = jsondata;
		},
		list1Push:function(jsondata){
			this.list1 = jsondata;
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
     	sendbeanPush:function(jsondata){
         this.sendbean = jsondata;
      },
     sendbean2Push:function(jsondata){
         this.sendbean2 = jsondata;
      },
		modalListPush:function(jsondata){
			this.modalList = jsondata;
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
			let value = prcode +','+ prname+ '>' + spcode +'@@'+ count + '^^' +unit_price+ '#' +img ; //split(',')는 상품코드와 공급사코드 (':')갯수 ('/')는 가격
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
				let val =[];
				let pr = [];								
				let values = document.getElementsByName("ckval");
				let prcode = document.getElementsByName("prcode");
				const name = 'addCart-';	
				let cart = document.cookie.split(';');
				let ct = '';
				let ogCount='';
				
				for(r=0; r<prcode.length; r++){
					let prr = prcode[r].value;
					let vall = values[r].value;
					pr.push(prr);
					val.push(vall);
					
					for(var i in cart){
						if(cart[i].search(name+prr)!=-1){
							ct = cart[i];
								ogCount = parseInt(ct.split('@@')[1].split('^^')[0]) + parseInt(vall.split('@@')[1].split('^^')[0]);
								alert(ogCount);
								
								vall=vall.substring(0,vall.indexOf("@@"))+"@@"+ ogCount +"^^"+ vall.substring(vall.indexOf("^^")+2,vall.length);
								console.log(vall);
								setCookie(name + prr, vall, 7);	
						
						}else{
							setCookie(name + prr, vall, 7);												
						}
					}								
				}	if(confirm('장바구니에 담겼습니다.장바구니로 이동하시겠습니까?')){
						this.changePage(2);
						this.getCartPage();
						
				}else{
					$("#space").empty();
				};			
		},
		getCartPage:function(){
			loadingClose();
			this.cart=[];								
			let ck = document.cookie.split(';');
			let cookie='';
					
		//이름찾는 
		for(var i in ck) {
            if(ck[i].search('addCart-')!=-1) {
				//alert(ck[i].search('addCart-')); //모든 쿠키를 확인해서 쿠키당 addCart가 들어가면 1을반환 없으면 0을반환  
                cookie = ck[i]								
           	   	let img = cookie.split('#')[1];
				let spcode = cookie.split('>')[1].split('@@')[0];
				let prname=cookie.split(',')[1].split('>')[0];
				let prcode=cookie.split('-')[1].split('=')[0];
				let price = cookie.split('^^')[1].split('#')[0];
				let count = cookie.split('@@')[1].split('^^')[0];
				let tt_price = price * count;
				
				let ckData = {img:img, spcode:spcode, prname:prname, prcode:prcode,price:price,count:count,ttprice:tt_price};

				this.cart.push(ckData);
																																				
			}	 
		}
	},
	delItem:function(prcode){
		delCookie(prcode);
		alert("장바구니에서 삭제되었습니다.");
		this.getCartPage();
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
			
			main.nsbchangePage();
  			 main.changePage(5);
   			postAjaxJson('rest/getDrafter','oDrafterVue2','j');

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
		changeReceiveApproval:function(){//*//
			let num = document.getElementById("changeList").value;
			if(num == 0){
				postAjaxJson('rest/GetApprovalList', 'getApprovalListPush', 'j');
			}else{
				postAjaxJson('rest/GetAnyApprovalList', 'getAnyApprovalListPush', 'j');
			}
		},
		getAnyApprovalDetail:function(apcode){
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
		changeSendApprovalList:function(){//*//
			let num = document.getElementById("changeSendApproval").value;
			if(num == 0){
				postAjaxJson('rest/GetSendApprovalList', 'getSendApprovalListPush', 'j');
			}else{
				postAjaxJson('rest/GetSendAnyApprovalList', 'getSendAnyApprovalListPush', 'j');
			}
		},
		getSendAnyApprovalDetail:function(apcode){
			let sendJsonData = { ap_code: apcode};
			let clientData = JSON.stringify(sendJsonData);
			postAjaxJson('rest/GetAnyApprovalDetail', 'getSendAnyApprovalDetailPush', 'j', clientData);
		},
		////////////////////////////////////////////////////////////////////////////
		
	
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
				let spcode = cookie.split('>')[1].split('@@')[0];
				let prname=cookie.split(',')[1].split('>')[0];
				let prcode=cookie.split('-')[1].split('=')[0];
				let price = cookie.split('^^')[1].split('#')[0];
				let count = cookie.split('@@')[1].split('^^')[0];
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
		this.nsbPage[0].show=true;
		this.nsbPage[1].show=true;	
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
         
      },
	
issueApproval:function(){

      let sendJsonData = {ap_fromdpcode:this.sendbean.ep_dpcode, ap_fromofcode:this.sendbean.ep_ofcode, cp_code:this.sendbean.ep_cpcode, ap_todpcode:this.sendbean2.ep_dpcode, ap_toofcode:this.sendbean2.ep_ofcode, cg_type:document.getElementById("div_apv_sq").value, cart:this.inputcart};
		
		if(this.sendbean2.ep_dpcode==null){
			alert("수신자는 필수선택사항입니다.");			
			return;
		}else if(this.sendbean2.ep_ofcode==null){
			alert("수신자는 필수 선택사항입니다.");
			return;
		}
		
		if(this.sendbean2.ep_dpcode==this.sendbean.ep_dpcode){
			alert("기안자와 수신자의 부서가 같습니다. 다시 선택해주세요.");
			document.getElementById('id01').style.display='block';
			return;
		}
	

      if(this.inputcart==""){
			alert("상품이 선택되지않았습니다.");
			return;
	}

      let clientData = JSON.stringify(sendJsonData);      
      postAjaxJson('rest/issueApproval','ApprovalPage2','s', clientData);
     },
	issueApproval2:function(){
		const text = document.getElementsByName("text")[0];
		let sender = this.sendbean.ep_name;
		let receiver = this.sendbean2.ep_name;

	  let sendJsonData = {ap_fromdpcode:this.sendbean.ep_dpcode, ap_fromofcode:this.sendbean.ep_ofcode, cp_code:this.sendbean.ep_cpcode, ap_todpcode:this.sendbean2.ep_dpcode, ap_toofcode:this.sendbean2.ep_ofcode, cg_type:document.getElementById("div_apv_sq").value, an_text:text.value};
		
		if(this.sendbean2.ep_dpcode==null){
			alert("수신자는 필수선택사항입니다.");
			return;
		}else if(this.sendbean2.ep_ofcode==null){
			alert("수신자는 필수 선택사항입니다.");
			return;
		}
		
		if(sender==receiver){
			alert("기안자와 수신자가 같습니다. 다시 선택해주세요.");
			document.getElementById('id01').style.display='block';
			return;
		}
		
		if(text.value==""){
			alert("내용은 필수입력사항입니다.");
			text.focus();
			return;
		}
		
      let clientData = JSON.stringify(sendJsonData);      
      postAjaxJson('rest/issueApproval2','ApprovalPage3','s', clientData);
	},

		////////////////////////////////////////////////////////////////
		tabSet:function(tabNum){
			let count = this.display2.length;
			for(i=0; i<count; i++){
				this.display2[i].show=false;
			}
			this.display2[tabNum].show = true;
		},
		changeTab:function(tabNum){
			this.tabSet(tabNum);
			$('.litab').attr('class','litab');
			document.getElementsByClassName("litab")[tabNum].className = "litab activeT";
		},
		getOrderDetail:function(code){
			postAjaxJson('rest/getOrderDetail','getOrderDetail','j',code);
		},
		getOrderDetail2:function(code,ios){
			this.relOs = ios;
			postAjaxJson('rest/getOrderDetail','getOrderDetail2','j',code);
		},
		getTTprice:function(tt){
			let count = tt.length;
			let ttprice = 0;
			for(i=0;i<count;i++){
				ttprice += (this.modalList[i].pr_price+this.modalList[i].pr_tax)*this.modalList[i].od_quantity;
				this.modalList[i].perPrice=(this.modalList[i].pr_price+this.modalList[i].pr_tax).toLocaleString();
			}
			this.modalList.ttPrice = ttprice.toLocaleString();
		},
		insReason:function(index,item){
			if(this.dupCheck.includes(index))return;
			let updown = 0;
			let dCount = this.dupCheck.length;
			for(i=0;i<dCount;i++){
				if(this.dupCheck[i] > index){
					updown -= 1;
				}
			}
			let modal = document.getElementById('modalTable');
			let newRow = modal.insertRow(this.dupCheck.length+2+index+updown);
			newRow.id=`del${index}`;
			let newCell1 = newRow.insertCell(0);
			let newCell2 = newRow.insertCell(1);
			newCell1.colSpan = "5";
			if(document.getElementById(`note${item.od_prcode}`) == null){
			newCell1.innerHTML = `<input type="text" id="note${item.od_prcode}" style="width:100%;" placeholder="사유 입력"/>`;
			newCell2.innerHTML = `<div id="del${index}" onclick="delReason(${index})">삭제</div>`;}
			this.dupCheck.push(index);			
		},getDelivery:function(code){
			postAjaxJson('rest/getDelivery','getDeliveryInfo','j',code);
		},sendOrderDecide:function(code){
			let data = getcl();
			let cData = {os_code:code,clcode:data.cld,clpwd:data.clp};
			console.log(cData);
			postAjaxJson('http://172.30.1.13/vue/clientOrderDecide','getReload','s',JSON.stringify(cData));
		},
		exchangeCheckbox:function(){
			let check = document.getElementsByName("As_Checkbox");
			let checkCount = check.length;
			let odData = [];
			for(i=0;i<checkCount;i++){
				if(check[i].checked){
					odData.push({
					od_prcode:check[i].value,
					od_quantity:this.modalList[i].od_quantity,
					od_prspcode:this.modalList[i].od_prspcode,
					od_note:$('#note'+check[i].value).val()
					});
				}
			}
			let data = getcl();
			let cData = {os_clcode:data.cld,cl_pwd:data.clp,os_origin:this.modalList[0].os_origin,os_region:data.region,od:odData};
			console.log(cData);
			postAjaxJson('http://172.30.1.13/vue/clientExchange','getResultAs','j',JSON.stringify(cData));
			this.modalcjh.show = false;
			orderList();
		},
		refundCheckbox:function(){
			let check = document.getElementsByName("As_Checkbox");
			let checkCount = check.length;
			let odData = [];
			for(i=0;i<checkCount;i++){
				if(check[i].checked){
					odData.push({
					od_prcode:check[i].value,
					od_quantity:this.modalList[i].od_quantity,
					od_prspcode:this.modalList[i].od_prspcode,
					od_note:$('#note'+check[i].value).val(),
					});
				}else{
					odData.push({
					od_prcode:check[i].value,
					od_quantity:this.modalList[i].od_quantity,
					od_prspcode:this.modalList[i].od_prspcode,
					od_stcode:"OA"
					});
				}
			}
			let data = getcl();
			let cData = {os_clcode:data.cld,cl_pwd:data.clp,os_origin:this.modalList[0].os_origin,os_region:data.region,od:odData};
			console.log(cData);
			postAjaxJson('http://172.30.1.13/vue/clientRefund','getResultAs','j',JSON.stringify(cData));
			this.modalcjh.show = false;
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
function delCookie(prcode){
   var date = new Date();
   let name ='addCart-'+ prcode;
   date.setDate(date.getDate()-1);
            
   document.cookie = `${name}=; expires= ${date}`;
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
	chartMain();
	main.changePage(0);
}

//구매하기 버튼(사이드바)
function getBkinds(){
	loadingOpen();
	main.nsbchangePage();
	main.changePage(1);
	main.getBkindPage();
}

//장바구니 버튼 (사이드바)
function myCartView(){
	loadingOpen();
	main.nsbchangePage();
	main.changePage(2);
	main.getCartPage();
}


//상위 카테고리 목록 불러오기
function getBkindList(data){
	main.list = data;
	loadingClose();
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

function chartMain(){
console.log("in?");
	postAjaxJson('rest/getRanking', 'gettingRanking','j');
	
}


/////////////////////////////////HSM////////////////////////////////////////

function receiveApprovalPage(msg){//*//
	if(msg !=''){
		alert(msg);
	}
	postAjaxJson('rest/GetApprovalList', 'getApprovalListPush', 'j');
}

function getAnyApprovalList(msg){//*//
	if(msg !=''){
		alert(msg);
	}
	postAjaxJson('rest/GetAnyApprovalList', 'getAnyApprovalListPush', 'j');
}

function getApprovalListPush(jsondata){
	main.listPush(jsondata);
	main.nsbchangePage();
	main.changePage(7);
	main.selectPage[0].show=true;
	main.selectPage[1].show=false;
	loadingClose();
}

function getAnyApprovalListPush(jsondata){
	main.selectPage[0].show=false;
	main.selectPage[1].show=true;
	main.list2Push(jsondata);
}


function getApprovalDetailPush(jsondata){
	modalStyle();
	main.detailPush2(jsondata);
	main.modalOpen();
}
function getAnyApprovalDetailPush(jsondata){
	modalStyle();
	main.detailPush2(jsondata);
	main.modal2.show = true;
}

function sendApprovalPage(){
	loadingOpen();
	postAjaxJson('rest/GetSendApprovalList', 'getSendApprovalListPush', 'j');
}

function getSendApprovalListPush(jsondata){
	main.listPush(jsondata);
	main.nsbchangePage();
	main.changePage(8);
	main.selectPage[3].show = false;
	main.selectPage[2].show = true;
	loadingClose();
}

function getSendAnyApprovalListPush(jsondata){
	main.list2Push(jsondata);
	main.nsbchangePage();
	main.changePage(8);
	main.selectPage[2].show = false;
	main.selectPage[3].show = true;
}

function getSendAnyApprovalDetailPush(jsondata){
	modalStyle();
	main.detailPush2(jsondata);
	main.modal2.show = true;
}

function sendToMro(jsondata){
	let jsondataLength = jsondata.length;
	let OD = [];
	for(i=0; i<jsondataLength; i++){
		OD.push({od_prspcode:jsondata[i].od_prspcode, od_quantity:jsondata[i].od_quantity, od_prcode:jsondata[i].od_prcode})
	}
	let CL = getcl();
	let sendJsonData = { os_clcode: CL.cld, cl_pwd:CL.clp, os_region:jsondata[0].region, od:OD };
	let clientData = JSON.stringify(sendJsonData);
	main.RlRegion = sendJsonData.os_region;
	console.log(CL);
	postAjaxJson("http://172.30.1.13/vue/clientOrder", 'returnStringData', 'j', clientData);
}

function returnStringData(jsondata){
	let jsondataLength = jsondata.length;
	let MOS = [];
	 for(i=0; i<jsondataLength; i++){
		MOS.push({os_code:jsondata[i], os_region:main.RlRegion})
	}
	let sendJsonData = { rl_ioscode: main.list2.os_code,
						 aa_apcode: main.list2.ap_code, 
						 of_code: main.list2.of_code,
						 mos: MOS};
	let clientData = JSON.stringify(sendJsonData);
	alert(clientData);
	postAjaxJson('rest/ResponseAppovalAccept', 'receiveApprovalPage', 's', clientData);
}



////////////////////////NSB///////////////////////

//주문결재 탭
function ApprovalPage(){
	loadingOpen();
	main.nsbchangePage();
   main.changePage(5);
   postAjaxJson('rest/getDrafter','oDrafterVue','j');
}

function ApprovalPage2(message){
	//here
	if(message != "failed"){
		alert("전송성공");
		console.log(message);
		sendWebSocketMessage(message+"주문");
	}else{
		alert("전송실패");
	}
	main.nsbchangePage();
	main.changePage(5);
	document.getElementById('id01').style.display = 'none';
	document.getElementById('id02').style.display = 'none';

	for (i = 0; i < main.inputcart.length; i++) {
		this.delCookie(main.inputcart[i].prcode);
	}  
}

function ApprovalPage3(message){
   alert(message);
   main.nsbchangePage();
   main.changePage(6);
   document.getElementById('id01').style.display='none';
   document.getElementById('id02').style.display='none';
}

//기안자세션기입
function oDrafterVue(jsondata){
   main.sendbeanPush(jsondata);
	loadingClose();
}

function oDrafterVue2(jsondata){
   main.sendbeanPush(jsondata);
   main.nsbPage[1].show =true;
}


//부서찾기모달
function DPVue(jsondata){
   main.listPush(jsondata);
   main.display[5].show=true;
}

//선택한 부서정보 기입
function inputDPVue(jsondata){
   main.sendbean2Push(jsondata);
   main.nsbPage[0].show = true;
}



function anyApprovalPage(){
	 loadingOpen();
   main.anyApprovalPage();
}
//일반결재 기안자 세션 기입
function aDrafterVue(jsondata){
	main.nsbchangePage();
   main.changePage(6);
   main.sendbeanPush(jsondata);
	loadingClose();
}
//일반결재 부서찾기 모달
function DPVue3(jsondata){
   main.listPush(jsondata);
}
//일반결재 부서 기입
function inputDPVue3(jsondata){
   main.sendbean2Push(jsondata);
   main.nsbPage[2].show=true;

}

//세금계산서 페이지 이동
function taxbillPage(){
	loadingOpen();
	main.taxbillPage();
}
//세금계산서 리스트 출력
function IssuedTaxVue(jsondata){
	main.nsbchangePage();
	main.changePage(9);
	main.listPush(jsondata);
	loadingClose();
}

function IssuedTaxDetailVue(jsondata){
	main.beanPush(jsondata);
	main.od = jsondata.od;	
}


/////////////////JES///////////////

function getBudgetList(jsonData){ 
   console.log(jsonData); //alert로도 모르겠다면 console.log로 찍어볼것
   main.list = jsonData;
	loadingClose();
   
}


function getBudget(){
	loadingOpen();
	main.nsbchangePage();   
	main.changePage(10);
    main.getBudgetPage();
}

/////////////////////cjh/////////////////////////
	//here
	
 	let socket = null;

 	function connectWs(){
 		
	 	let ws = new WebSocket("ws://172.30.1.43/cEcho");
	 	
	 	socket = ws;
	 	
	 	ws.onopen = function(){
	 		console.log('connection opened');
	 	}
	 	
	 	ws.onmessage = function(event){
	 		console.log(event.data+'\n');
	 		//$('#result').append(event.data); 토스트
			let Length = event.data.length;
			toastr.options.extendedTimeOut = 14000;
			toastr.options.onclick = function() { console.log('clicked'); }
			toastr.info(event.data.substring(5,Length-2)+" "+event.data.substring(0,5),event.data.substring(Length-2,Length) + "결재 요청", {timeOut: 7000});
	 	}
	 	ws.onclose = function(event){
	 		console.log('connection close');
			setTimeout(function(){connectWs();},5000);
	 	}
	 	ws.onerror = function(err){console.log('Error : '+err);}
	 	
 	}

 	function sendWebSocketMessage(data1){
		if(socket){
			socket.send(data1); 
		}
 	}



function getResultAs(data){
	if(main.relOs==null){
		return alert("에라");
	}
	let cData = {ios:main.relOs,mos:data[0]};
	postAjaxJson('/rest/osConnect','getReload','s',JSON.stringify(cData));
}

function getReload(data){
	alert(data);
	orderList();
}

function getDeliveryInfo(jsondata){
	modalStyle();
	console.log(jsondata);
	main.modalList = jsondata;
	console.log(main.modalList);
	main.modalcjh2Open();
}

function delReason(index){
    $(`#del${index}`).remove();
	for(i=0;i<main.dupCheck.length;i++){
		if(main.dupCheck[i]==index){
			main.dupCheck.splice(i);
		}
	}
}

function orderList(){
    loadingOpen();
    postAjaxForm('rest/getOrderList','getList','j');
    postAjaxForm('rest/getOrderCompleteList','getCompleteList','j');
	main.nsbchangePage();    
	main.changePage(3);

}

function refundList(){
	loadingOpen();
	postAjaxForm('rest/getRefundList','getList','j');
	postAjaxForm('rest/getRefundCompleteList','getCompleteList','j');
	main.nsbchangePage();
	main.changePage(4);

}

function exchangeList(){
	loadingOpen();
	postAjaxForm('rest/getExchangeList','getList','j');
	postAjaxForm('rest/getExchangeCompleteList','getCompleteList','j');
	main.nsbchangePage();
	main.changePage(11);   
}

function getList(jsondata){
	main.changeTab(0);
	main.listPush(jsondata);
	main.list3Push(setList(jsondata));
	loadingClose();
}

function getCompleteList(jsondata){
	main.list1Push(jsondata);
	main.list2Push(setList(jsondata));	
}

function setList(jsondata){
	let count = jsondata.length;
	let set = [];
	for(i=0;i<count;i++){
		if(!set.includes(jsondata[i].ios)){
			set.push(jsondata[i].ios);
		}
	}
	return set;
}

function getOrderDetail(jsondata){
	main.modalListPush(jsondata);
	main.getTTprice(jsondata);
	modalStyle();
	main.modalOpen();
}

function getOrderDetail2(jsondata){
	main.modalListPush(jsondata);
	main.getTTprice(jsondata);
	modalStyle();
	main.modalcjhOpen();
}

function modalStyle(){
	main.styleObject.height = (document.getElementById("content").offsetHeight-86)+"px";
	$("html, body").animate({ scrollTop: 0 }, 100);
}

function loadingOpen() {
	main.loading = true;
	let back = $('#loadingBack');
	let cat = $("#loadingCat");
	back.css({ 'width': $(window).width(), 'height': $(document).height() }); 
	cat.css("position", "absolute");
	cat.css("top", Math.max(0, ( ($(window).height() - cat.outerHeight()) / 2) + $(window).scrollTop() - 100) + "px");
	cat.css("left", Math.max(0, ( ($(window).width() - cat.outerWidth()) / 2 ) + $(window).scrollLeft() ) + "px");
	back.show();
} 

function loadingClose(){
	setTimeout(function(){
		try{if(document.getElementById("detectRandering").value=="ccc"){
			$('#loadingBack').hide();
			main.loading = false;}
		}catch(error){}
		if(main.loading){loadingCloseCallback();}
	},300);
}

function loadingCloseCallback(){
	setTimeout(function(){
		try{if(document.getElementById("detectRandering").value=="ccc"){
			 $('#loadingBack').hide();
			 main.loading = false;}
		}catch(error){}
		if(main.loading){loadingClose();}
	},300);
}



