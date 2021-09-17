
const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
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
		addCart:function(prcode,index,spcode,price,tax,img){
			let count = document.getElementsByName("quantity")[index].value;
			let pr_price = (price+tax)*count;
			let value = prcode +','+ spcode +':'+ count + '/' +pr_price+ '+' +img; //split(',')는 상품코드와 공급사코드 (':')갯수 ('/')는 가격
			let name = 'addCart-';
			let cart = document.getElementById("space");
			let html ="";
			
			
			//중복된 상품이 있으면, 그 상품의 count만 up해주기
			let cookie=setCookie(name + prcode, value, 7);
				alert('장바구니에 담겼습니다.');

			let item = getCookie(name+prcode)
				if(item!=""){
					html += "<img src='"+item.split('+')[1]+"' style='width:90px;'/>";
					html += "<div>"+item.split(',')[0]+"</div>";
					html += "<div>" + item.split(':')[1].split('/')[0]+"개</div>";
				}
			
																													
				cart.innerHTML += html;		
						
			//if(checkCookie(cookie)){
				//cart.innerHTML += html;
			//}

		}
	}
	
});


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
	
	let val ="";
			
	for(var i in cookies){
		if(i.indexOf(name)){
			val += i;
			console.log(val);
	}			
 }
	return val;			
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




