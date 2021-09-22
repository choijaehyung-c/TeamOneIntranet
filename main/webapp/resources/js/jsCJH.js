const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
		display2:[{show:true},{show:false}],
		modal:{show:false},
		list:[],
		list1:[],
		list2:[],
		list3:[],
		modalList:[],
		detail:[],//모달정보들여기에 담기
		styleObject:{
			height:'',
			width: 'calc( 100% - 224px )',
			background: 'rgba(0, 0, 0, 0.5)',
			position: 'absolute',
			padding: '20px',
			"z-index": '2'
		}
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
		list1Push:function(jsondata){
			this.list1 = jsondata;
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
		modalListPush:function(jsondata){
			this.modalList = jsondata;
		},
		changeTab:function(tabNum){
			let count = this.display2.length;
			for(i=0; i<count; i++){
				this.display2[i].show=false;
			}
			this.display2[tabNum].show = true;
			
			$('.litab').attr('class','litab');
			document.getElementsByClassName("litab")[tabNum].className = "litab activeT";
		},
		getOrderDetail:function(code){
			postAjaxJson('rest/getOrderDetail','getOrderDetail','j',code);
		}
	}
	
});


function orderList(){
	postAjaxForm('rest/getOrderList','getList','j');
	postAjaxForm('rest/getOrderCompleteList','getCompleteList','j');
	main.changePage(3);
}

function refundList(){
	postAjaxForm('rest/getRefundList','getList','j');
	postAjaxForm('rest/getRefundCompleteList','getCompleteList','j');	
	main.changePage(4);
}

function exchangeList(){
	postAjaxForm('rest/getExchangeList','getList','j');
	postAjaxForm('rest/getExchangeCompleteList','getCompleteList','j');	
	main.changePage(11);
}

function getList(jsondata){
	console.log(jsondata);
	main.listPush(jsondata);
	main.list3Push(setList(jsondata));		
}

function getCompleteList(jsondata){
	console.log(jsondata);
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
	main.styleObject.height = document.getElementById("content").offsetHeight+"px";
	console.log(main.styleObject.height);
	main.modalOpen();
}

function testasdasd(){
	alert("test1");
}

function testasdasd2(){
	alert("test2");
}

