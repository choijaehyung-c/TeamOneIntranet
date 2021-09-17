
const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false}],
		list:[],
		detail:[],
		items:[]
	},
	methods:{
		changePage:function(page){
			for(i=0;i<this.display.length; i++){
				this.display[i].show=false;
			}
			this.display[page].show = true;
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
		addCart:function(prcode,index){
			let count = document.getElementsByName("quantity")[index].value;
			let value = prcode + ': '+ count +'개';
			let name = 'addCart';
			
			if(checkCookie('addCart')){
				for (i = 0; i <5; i++) {
					 name += i;
					setCookie(name, value, 7);
					alert("장바구니에 담겼습니다.");
					break;
					
				}				
			}else{
					setCookie(name, value, 7);
				}
		}
	}
	
});
//쿠키 생성
function setCookie(name,value,day){
	var date = new Date();//현재 날짜
	date.setDate(date.getDate()+day); //오늘날짜 형식 + day는 지정해줄 파람값
			
	var mycookie='';
	mycookie += name + '=' + value + ';';
	mycookie += 'Expires=' + date.toUTCString();//언제까지 유지될지
			
	document.cookie = mycookie; // 쿠키생성
}

function makeName(){
	let name = 'addCart';
	for(i=0;i<5; i++){
		name += [i]; 
	}return name;
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
	var contain = false;
			
	for(var i in cookies){
		if(cookies[i].indexOf(name)>-1){
			contain = true;	
	}			
 }return contain;			
}

function mainPage(){
	main.changePage(0);
}

//구매하기 버튼(사이드바)
function getBkinds(){
	main.changePage(1);
	main.getBkindPage();
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
	main.items= data;
}





function postAjaxJson(jobCode, fn, rType, clientData = "") {
	let ajax = new XMLHttpRequest();
	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4 && ajax.status == 200) {
			if (rType == 'j') {
				window[fn](JSON.parse(ajax.responseText));
			} else if (rType == 's') {
				window[fn](ajax.responseText);
			}
		}
	}
	ajax.open("POST", jobCode);
	ajax.setRequestHeader("Content-type", "application/json; charset=utf-8");
	ajax.send(clientData);
	/*
	대부분 이것으로 사용, 제이슨 타입으로 파람 넘김
	백엔드에서 빈으로 받을꺼면 clientData={키:밸류,키:밸류}
	그 빈안에 <>리스트 타입이 있다면 {키:밸류,키:밸류,키:[]밸류}
	백엔드 컨트롤러에서는 @RequestBody로 받으면됨
	*/
}