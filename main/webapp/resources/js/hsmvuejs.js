const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
		selectPage:[{show:false},{show:false},{show:false},{show:false}],
		modal:{show:false},
		modal2:{show:false},
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
	main.detailPush(jsondata);
	main.modalOpen();
}
function getAnyApprovalDetailPush(jsondata){
	main.detailPush(jsondata);
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
	main.detailPush(jsondata);
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



