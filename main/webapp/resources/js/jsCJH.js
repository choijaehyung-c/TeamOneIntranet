const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
		display2:[{show:true},{show:false}],
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
		changeTab:function(tabNum){
			let count = this.display2.length;
			for(i=0; i<count; i++){
				this.display2[i].show=false;
			}
			this.display2[tabNum].show = true;
			
			$('.litab').attr('class','litab');
			document.getElementsByClassName("litab")[tabNum].className = "litab activeT";
		}	
	}
	
});


function orderList(){
	main.changePage(3);
}

function asList(){
	main.changePage(4);
}
