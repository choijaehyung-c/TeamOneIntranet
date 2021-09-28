function getAjax(jobCode, fn, rType, clientData = "") {
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
   ajax.open("GET", jobCode);
   ajax.send(clientData);
   /*거의 안씀 보안성 요구가 0 노출되도 상관없는 잡일때 사용*/
}

function postAjaxForm(jobCode, fn, rType, clientData = "") {
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
   ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded;");
   ajax.send(clientData);
   /*
   보안성이 필요한 요청을 할때 form으로 전송!! ex)pwd를 파람으로 받는 잡일때 사용
   clientData=`변수명=${변수값}&변수명=${변수값}`;
   백엔드 컨트롤러에서는 @ModelAttribute으로 받으면됨(빈도 받을 수 있음)
   */
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

/*function typeChange(){
   
   if($("input[name='ah_table']:checked").val()=="AHS"){
      $('#insertPoint').html(
         `<div class="form-group">
             <input type="text" name="ah_sdspcode" class="form-control form-control-user" placeholder="Office Code"></div>`);
   }else{
      $('#insertPoint').html('');
   }
   
   
}*/