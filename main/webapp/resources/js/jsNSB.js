const main = new Vue({
   el : '#mainVue',
   data : {
      display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
      displayNSB:[{show:false}/*주문결재세션기입*/,{show:false}/*수신부서기입*/,{show:false}/*반품세션기입*/,{show:false}/*반품부서기입*/,{show:false}/*거래내역기입*/,{show:false}/*일반부서기입*/,{show:false}/*장바구니기입*/],
      modal:{show:false},
      modal2:{show:false},
      bean:{},
      bean2:{},
      bean3:{},
      list:[],
      list2:[],
      list3:[],
      detail:[],
	  cartNSB:[],
	  inputcart:[],//모달정보들여기에 담기
	  od:[]
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
      modalOpen2:function(){
         this.modal2.show = true;
      },
      modalClose:function(){
         this.modal.show = false;
         this.modal2.show = false;
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
      listPush:function(jsondata){
         this.list = jsondata;
      },
      list2Push:function(jsondata){
         this.list2 = jsondata;
      },
      list3Push:function(jsondata){
         this.list3 = jsondata;
      },
      detailPush:function(jsondata){
         this.detail = jsondata;
      },
      
      //주문결재 세션기입
      orderApprovalPage:function(){      
        postAjaxJson('/getDrafter','oDrafterVue','j');
        },
      //부서찾기
      getDP:function(){
      postAjaxJson('/getDP','DPVue','j');   
      },
      //부서기입
      inputDP:function(epcode){
	  document.getElementById('id01').style.display='none'
      postAjaxJson('/inputDP','inputDPVue','j',epcode);      
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
      postAjaxJson('/getDrafter','rDrafterVue','j');
      },
      getDP2:function(){
      postAjaxJson('/getDP','DPVue2','j');   
      },
      inputDP2:function(epcode){
      document.getElementById('id01').style.display='none'
      postAjaxJson('/inputDP','inputDPVue2','j',epcode);      
      },
      getApprovalOrderList:function(ofcode){
      postAjaxJson('/getApprovalOrderList','getAOList','j',ofcode);
      },   
      inputOrder:function(oscode){
	  document.getElementById('id02').style.display='none'
      postAjaxJson('/inputOrder','inputAOList','j',oscode);
      },
      
      //일반결재
      anyApprovalPage:function(){   
      postAjaxJson('/getDrafter','aDrafterVue','j');   
      },
      getDP3:function(){
      postAjaxJson('/getDP','DPVue3','j');   
      },
      inputDP3:function(epcode){
	  document.getElementById('id01').style.display='none'
      postAjaxJson('/inputDP','inputDPVue3','j',epcode);      
      },
	  taxbillPage:function(){
		postAjaxJson('/getIssuedTax','IssuedTaxVue','j');
	  },
	  taxDetail:function(tbcode){
		postAjaxJson('/getIssuedTaxDetail','IssuedTaxDetailVue','j',tbcode);
	  }

   }
   
});

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

