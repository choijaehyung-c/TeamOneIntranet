const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
		display2:[{show:true},{show:false}],
		modal:{show:false},
		modalcjh:{show:false},
		modalcjh2:{show:false},
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
			"z-index": '2',
			"box-shadow":'0 0 8px 8px white inset'
		},
		dupCheck:[],
		loading:false,
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
		getOrderDetail2:function(code){
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
		insReason:function(index,code){
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
			newCell1.innerHTML = `<input type="text" name="od_note" style="width:100%;" placeholder="사유 입력"/>`;
			newCell2.innerHTML = `<div id="del${index}" onclick="delReason(${index})">삭제</div>`;
			this.dupCheck.push(index);
		},getDelivery:function(code){
			postAjaxJson('rest/getDelivery','getDeliveryInfo','j',code);
		}
		
	}
	
});

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
    main.changePage(3);
}

function refundList(){
	loadingOpen();
	postAjaxForm('rest/getRefundList','getList','j');
	postAjaxForm('rest/getRefundCompleteList','getCompleteList','j');
	main.changePage(4);
}

function exchangeList(){
	loadingOpen();
	postAjaxForm('rest/getExchangeList','getList','j');
	postAjaxForm('rest/getExchangeCompleteList','getCompleteList','j');
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
	},100);
}

function loadingCloseCallback(){
	setTimeout(function(){
		try{if(document.getElementById("detectRandering").value=="ccc"){
			 $('#loadingBack').hide();
			 main.loading = false;}
		}catch(error){}
		if(main.loading){loadingClose();}
	},100);
}


