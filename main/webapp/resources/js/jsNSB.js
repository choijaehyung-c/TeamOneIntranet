const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
		displayNSB:[{show:false}/*주문결재세션기입*/,{show:false}/*수신부서기입*/,{show:false}/*반품세션기입*/,{show:false}/*반품부서기입*/,{show:false}/*거래내역기입*/,{show:false}/*일반부서기입*/],
		modal:{show:false},
		modal2:{show:false},
		bean:{},
		bean2:{},
		bean3:{},
		list:[],
		list2:[],
		list3:[],
		detail:[]//모달정보들여기에 담기
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
		postAjaxJson('/inputDP','inputDPVue','j',epcode);		
		},
		//주문결재 장바구니	
		getApprovalCart:function(){
			
		},
		//반품결재
		refundApprovalPage:function(){
		postAjaxJson('/getDrafter','rDrafterVue','j');
		},
		getDP2:function(){
		postAjaxJson('/getDP','DPVue2','j');	
		},
		inputDP2:function(epcode){
		this.modalClose();
		postAjaxJson('/inputDP','inputDPVue2','j',epcode);		
		},
		getApprovalOrderList:function(ofcode){
		postAjaxJson('/getApprovalOrderList','getAOList','j',ofcode);
		},	
		inputOrder:function(oscode){
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
		postAjaxJson('/inputDP','inputDPVue3','j',epcode);		
		}

	}
	
});

//주문결재 반품결재 분기
function ApprovalPage(){
	main.changePage(5);
	main.changePageNSB(6);

}

//기안자세션기입
function oDrafterVue(jsondata){
	main.changePageNSB(0);
	main.display[5].show=false;
	main.beanPush(jsondata);
}

//부서찾기모달
function DPVue(jsondata){
	main.modalOpen();
	main.listPush(jsondata);
	main.displayNSB[0].show=true;
}

//선택한 부서정보 기입
function inputDPVue(jsondata){
	main.modalClose();
	main.bean2Push(jsondata);
	main.displayNSB[0].show=true;
	main.displayNSB[1].show=true;
}

//반품 기안자세션기입
function rDrafterVue(jsondata){
	main.changePageNSB(2);
	main.beanPush(jsondata);	
}

//부서찾기모달
function DPVue2(jsondata){
	main.modalOpen();
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
	main.modalOpen2();
	main.listPush(jsondata);
}
//거래내역 기입
function inputAOList(jsondata){
	main.modalClose();
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
	main.modalOpen();
	main.listPush(jsondata);
}
//일반결재 부서 기입
function inputDPVue3(jsondata){
	main.modalClose();
	main.bean2Push(jsondata);
	main.display[6].show=true;
	main.displayNSB[5].show=true;
}


