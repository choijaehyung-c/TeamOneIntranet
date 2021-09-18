const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
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
		}
		
		
		
	}
	
});


function receiveApprovalPage(){
	let sendJsonData = { ap_todpcode: "MT", ap_toofcode: "INC01H" };
	let clientData = JSON.stringify(sendJsonData);
	alert(clientData);
	postAjaxJson('rest/GetApprovalList', 'getApprovalListPush', 'j', clientData);
}

function getApprovalListPush(jsondata){
	alert(JSON.stringify(jsondata));
	main.listPush(jsondata);
}
