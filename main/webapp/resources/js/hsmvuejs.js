const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
		selectPage:[{show:false},{show:false}],
		modal:{show:false},
		list:[],
		list2:[],
		list3:[],
		detail:[],//모달정보들여기에 담기
	},
	methods:{
		changePage:function(page){
			for(i=0;i<this.display.length; i++){
				this.display[i].show=false;
			}
			this.display[page].show = true;
		},
		modalOpen:function(){
			this.modal.show = true;
		},
		modalClose:function(){
			this.modal.show = false;
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
		getApprovalDetail:function(oscode, cgtype, apcode){
			this.list2 = {ap_code:apcode, cg_type: cgtype};
			let sendJsonData = { ap_oscode: oscode};
			let clientData = JSON.stringify(sendJsonData);
			postAjaxJson('rest/GetApprovalDetail', 'getApprovalDetailPush', 'j', clientData);
		},
		changSelect:function(num){
			if(num == '0'){
				receiveApprovalPage();
			}else{
				
			}
		},
		responseAppovalRefuse:function(apcode, cgtype){
			if(cgtype =="O"){
				let sendJsonData = { ap_code:apcode, at_code: "OF"};
				let clientData = JSON.stringify(sendJsonData);
				alert(clientData);
				postAjaxJson('rest/ResponseAppoval', 'receiveApprovalPage', 's', clientData);
			}else{
				let sendJsonData = { ap_code:apcode, at_code: "RF"};
				let clientData = JSON.stringify(sendJsonData);
				postAjaxJson('rest/ResponseAppovalRefuse', 'receiveApprovalPage', 's', clientData);
			}
			this.modalClose();
		},
		responseAppovalAccept:function(){
			
		}
		
		
		
		
	}
	
});


function receiveApprovalPage(msg){
	if(msg !=''){
		alert(msg);
	}
	let sendJsonData = { ap_todpcode: "MT", ap_toofcode: "INC01H" };
	let clientData = JSON.stringify(sendJsonData);
	postAjaxJson('rest/GetApprovalList', 'getApprovalListPush', 'j', clientData);
}

function getApprovalListPush(jsondata){
	main.listPush(jsondata);
	main.changePage(7);
	main.selectPage[0].show=true;
	main.selectPage[1].show=false;
}


function getApprovalDetailPush(jsondata){
	main.detailPush(jsondata);
	main.modalOpen();
}

function sendApprovalPage(){
	let sendJsonData = { ap_fromdpcode: "MK", ap_fromofcode: "SEO01B" };
	let clientData = JSON.stringify(sendJsonData);
	postAjaxJson('rest/GetSendApprovalList', 'getSendApprovalListPush', 'j', clientData);
}

function getSendApprovalListPush(jsondata){
	main.listPush(jsondata);
	main.changePage(8);
}

