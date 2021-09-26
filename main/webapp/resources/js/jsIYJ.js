
const main = new Vue({
	el : '#mainVue',
	data : {
		display:[{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false},{show:false}],
		modal:{show:false},
		list:[],
		items:[],
		cart:[],
		detail:[],
		prdetail:{}
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
		detailPush:function(jsondata){
			this.prdetail={};
			this.prdetail = jsondata;
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
		addSideBar:function(prcode,index,spcode,price,tax,img,prname){
			let count = document.getElementsByName("quantity")[index].value;
			let add = document.getElementById("add"); //담기버튼
			let unit_price = price+tax;
			//let pr_price = (price+tax)*count;
			let value = prcode +','+ prname+ '>' + spcode +':'+ count + '&' +unit_price+ '#' +img; //split(',')는 상품코드와 공급사코드 (':')갯수 ('/')는 가격
			let cart = document.getElementById("space");
			let html ="";
				
				html += `<div id="setDiv${index}">`
				html += "<img src='"+img+"' style='width:90px;'/>";
				html += "<div style='font-size:12px;'>"+prname+"</div><span style='font-size:10px;'>("+prcode+")</span>";
				html += "<div style='font-size:12px;'>" + count +"개</div>";
				html += `<div id="delCart" onClick="delCarts(${index})" style='font-size:13px; cursor:pointer;'>[삭제]</div>`;
				html +=	"<input type='hidden' value='"+value+"' name='ckval'/>";
				html += "<input type='hidden' value='"+prcode+"' name='prcode'/></div>";
			
				add.style.display= "block";
				cart.innerHTML +=html;
		},
		addCart:function(){				
				var val =[];
				var pr = [];								
				const values = document.getElementsByName("ckval");
				const prcode = document.getElementsByName("prcode");
				const name = 'addCart-';	
				
				for(r=0; r<prcode.length; r++){
					let prr = prcode[r].value;
					let vall = values[r].value;
					pr.push(prr);
					val.push(vall);
					
					setCookie(name + pr[r], val[r], 7);
						
				}
				alert('장바구니에 담겼습니다.');
				
								
		},
		getCartPage:function(){
			this.cart=[];									
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

				this.cart.push(ckData);
																																				
			}	 
		}
	},
	searchItem:function(){
	let word = document.getElementsByName("word")[0].value;
		if(word!=""){
			postAjaxJson('restIYJ/getSearchItem','cateItemList','j',word);
		}else{
			alert("검색어를 입력하세요.");
		}
		
	
	},
	sendApproval:function(){
		let chkedValue = document.getElementsByName('chkYn').values;
		let chk_val = [];

		$('input:checkbox[name=chkYn]:checked').each(function(){
			chk_val = $(this).val();
			alert(chk_val);
		});

	},
	getPrDetail:function(prcode){//각 상품의 상세정보
		code = {pr_code:prcode};
		clientData = JSON.stringify(code);
		postAjaxJson('restIYJ/getPrDetail','ItemDetail','j',clientData);
	}
}
	
});

//쿠키확인
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
//onLoad
function mainPage(){
	main.changePage(0);
}

//구매하기 버튼(사이드바)
function getBkinds(){
	main.changePage(1);
	main.getBkindPage();

}

//장바구니 버튼 (사이드바)
function myCartView(){
	main.changePage(2);
	main.getCartPage();
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
	if(data!=""){
		main.items= data;
	}else{
		alert("해당검색어의 상품이 없습니다.");
	}
}

//사이드 장바구니 삭제
function delCarts(index){
	//index번호랑 맞춰서 삭제하기..
	let set = document.getElementById("setDiv${index}");
    $(`#setDiv${index}`).remove();
	for(i=0;i<set.length;i++){
		if(set[i]==index){
			set.splice(i);
		}
	}
}

//check박스 전체 선택
function selectAll(selectAll)  {
  const checkboxes = document.getElementsByName('chkYn');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}

//상품별 상세정보 (모달)
function ItemDetail(jsonData){
	main.detailPush(jsonData); //detail의 데이터공간에 밀어넣음	
}

function chartMain(of,dp){
	let data = {of_name:of,dp_name:dp};
	let client = JSON.stringify(data);
	postAjaxJson('restIYJ/getRanking', 'gettingRanking','j',client);
	
}
