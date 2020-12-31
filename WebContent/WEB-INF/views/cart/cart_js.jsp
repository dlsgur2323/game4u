<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
window.onload = function(){
   
   //var chk = document.getElementsByClassName('checkcart');
   var chk_flag = true; //전체선택시. false=선택해제

   $('.checkcart').change(function(){
      chkchange($(this));
   });
   
   var tot_price = 0;
   
    var chk = $.makeArray($(".checkcart").map(function(){          
       return $(this);
    }));
    //var checkedgnos = new Array(); // 결제시 넘어갈 체크된 gno들 > cartno로 대체
    var chkcartnos = new Array(); // 결제시 넘어갈 체크된 cartno들
    
    $('#selectAllBtn').on('click',function(){
       var chk_count = 0;
      for(var i =0; i<chk.length; i++){      
         if(chk[i].prop("checked")){
            console.log("전체선택 test : " + chk[i].val());
            chk_count ++; // 개수 세기
         }
      }
      console.log("count : " + chk_count);
      for(var i =0; i<chk.length; i++){
         if(chk_count == chk.length){ // 다 체크 됐을때
            chk[i].prop("checked",false);//다 지워버리기
         }else{
            if(chk[i].prop("checked")){
               continue;
            }else{
               chk[i].prop("checked",true);               
            }
         }
         chkchange(chk[i]);
      }
   }); // 체크박스 전체선택
   
   
function chkchange(obj){
   
   if(obj.prop("checked")){ //체크해제할때
      obj.next().val("0");
   }else{//체크될때
      obj.next().val("1");
   }
   console.log("hi");
   var finprice = parseInt(obj.parents('.cart-list').find('.finprice').val());      
   var ischecked = obj.next();
   console.log("flag : " + ischecked.val());
   
   if(ischecked.val()==0){
      tot_price += finprice;
      ischecked.val("1");
      console.log(tot_price);
      $('#totalprice').text(tot_price);
   }else{
      tot_price -= finprice;
      ischecked.val("0");
      console.log(tot_price);
   }
   $('#totalprice').val(tot_price);   
   $('#bfinprice').val("최종 결제 금액 : " + tot_price);
   
   if(tot_price > 0 ){
      $('#purchaseBtn').attr('disabled',false);
   }else if( ischecked.val()==1 && tot_price == 0){
      $('#purchaseBtn').attr('disabled',false);      
   }else{
      $('#purchaseBtn').attr('disabled',true);      
   }
   console.log("check : " + ischecked.val());
}
   

$('.removeBtn').on('click',function(){
   console.log("hi");
   var thisobj = $(this);
   var cartNo = $(thisobj).parents('.cart-list').find('.checkcart').val();
   if(confirm('이 상품을 카트에서 제거하시겠습니까?')){   
      $.ajax({
         url : "cartRemove.do",
         data : {"cartNo" : cartNo},
         success : function(data){
            /* $(thisobj).parents('.cart-list').remove(); */
            location.reload(true);
         }
      });
   }else{
      return false;
   }
   
});
$('#cardselect').on('change',function(){
   var value = $(this).val(); //카드번호
   var finprice = tot_price;
   //console.log("test : " + value);
   if(value == null || value === undefined || value == 0){
      $('.cardcontrol').val("");   
      $('.cardcontrol').attr("readonly",false);
      $('#cardcompanies').css("display","inline-block");
      $('#card_flag').val("none");
      return false;   
   }
   $.ajax({
      url : "getCard.do",
      data : {"cardNo" : value},
      dataType : "json",
      success : function(data){
         $('#usercardno').val(data.cardNum);
         $('#valiyrmonth').val(data.valDate);
         $('#usercvc').val(data.cvc);
         $('#bname').val(data.name);
         $('#baddress1').val(data.addr1);
         $('#baddress2').val(data.addr2);
         $('#bzipcode').val(data.zip);
         $('#bphone').val(data.phone);
         $('#card_flag').val('${loginUser.email}');
         $('.cardcontrol').attr("readonly",true);
         $('#cardcompanies').css("display","none");
      }
   }); 
   
});
//유효성 검사 추가하기 
//카드
$('input#usercardno').on('input', function(){
   var str = $('input#usercardno').val();
   str = str.replace(/[^0-9]/g, '');
   var tmp = '';
   if(str.length < 5){
      tmp += str;
   }else if(str.length < 9){
        tmp += str.substr(0, 4);
        tmp += '-';
        tmp += str.substr(4);
    }else if(str.length < 13){
        tmp += str.substr(0, 4);
        tmp += '-';
        tmp += str.substr(4, 4);
        tmp += '-';
        tmp += str.substr(8);
    }else{              
       tmp += str.substr(0, 4);
        tmp += '-';
        tmp += str.substr(4, 4);
        tmp += '-';
        tmp += str.substr(8, 4);
        tmp += '-';
        tmp += str.substr(12, 4);
    }
   $('input#usercardno').val(tmp);
});
$('input#usercvc').on('input', function(){
   var str = $('input#usercvc').val();
   str = str.replace(/[^0-9]/g, '');
   var tmp = '';
   if(str.length < 4){
      tmp += str;
   }
   $('input#usercvc').val(tmp);
});
//핸드폰
$('input#bphone').on('input', function(){
   var str = $('input#bphone').val();
   str = str.replace(/[^0-9]/g, '');
   var tmp = '';
   if(str.length < 4){
      tmp += str;
   }else if(str.length < 9){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
    }else{
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7, 4);
    }
   $('input#bphone').val(tmp);
});
$('input#valiyrmonth').on('change',function(){
   var valdate = $('input#valiyrmonth').val();
   let today = new Date();
   let isval = new Date(valdate);
   console.log("valdate:"+isval);
   if(isval < today){
      alert('만료된 카드입니다. 다른 카드를 이용해주세요.');
      $('input#valiyrmonth').val('');
      return false;
   }
});



$('#purchaseBtn').on('click',function(){
   //체크된 게임 넘버 가져오기!!
   //checkedgnos = new Array();
   chkcartnos = new Array(); 
   for(var i =0; i<chk.length; i++){      
      if(chk[i].prop("checked")){
         console.log("전체선택 test : " + chk[i].val());
         //checkedgnos.push(chk[i].siblings(".gnos").val());
         chkcartnos.push(chk[i].val());
      }
   }   
   $('#usercardno').val("");
   $('#valiyrmonth').val("");
   $('#usercvc').val("");
   $('#bname').val("");
   $('#baddress1').val("");
   $('#bzipcode').val("");
   $('#baddress2').val("");
   $('#bphone').val("");
   $('#bemail').val("");
   $('#comselect').val('1');
   $('#paymodal').modal('show');
});

$('#mpaybtn').on('click',function(){
   let valemail = $('#bemail').val();      
   let cardNo = $('#usercardno').val();
   let coname = $('#comselect').val();
   let cvc = $('#usercvc').val();
   let yrmonth = $('#valiyrmonth').val();

   if(!cardnumVali(cardNo)){
      alert("카드 번호를 확인해 주세요.");
      return false;
   };

   if(!cvcVali(cvc)){
      alert("cvc 번호를 확인해 주세요.");
      return false;
   }
   if(!yrmonth){
      alert("유효년월을 선택해주세요.");
      return false;
   };
   let bname =  $('#bname').val();
   let phone =  $('#bphone').val();
   let bzipcode =  $('#bzipcode').val();
   let baddress1 =  $('#baddress1').val();
   let baddress2 = $('#baddress2').val();
   
   if($('#cardselect').val()==0){
      if(coname == 1){
         alert("카드 회사를 선택해 주세요.");
         return false;
      };      
      if(!bname || !phone || !bzipcode || !baddress1) {
         alert("이름,전화번호,우편번호,주소1은 필수 입력값입니다.");
         return false;
      }
      if(!baddress2){
         $('#baddress2').val("none");
      }
   }
   
   
   
      var dataForSending = new Object();
      
      dataForSending["cartNo"] = chkcartnos;
      dataForSending["cardNo"] = cardNo;

        var cardinfo = new Object();
         var noregicardinfo = $('form[id=cardforms]').serializeArray();
         console.log(noregicardinfo);
        
        $.each(noregicardinfo, function(i, eachObj){
         var eachKey = eachObj.name;
         var eachValue = eachObj.value;
         
         cardinfo[eachKey] = eachValue;
        });
      dataForSending["cardinfo"] = JSON.stringify(cardinfo);

      console.log(dataForSending);

   
   $.ajax({
      url : "pay.do",
      type : "post",
      traditional : true,
      data : dataForSending,
      success : function(data){
         alert("결제가 완료되었습니다! 라이브러리에 추가되었습니다.");
         window.parent.location.href = '<%=request.getContextPath()%>/member/library.do';
      }
   }); 
});

function cardnumVali(cardnumber){
   let result = false;  
   //빈칸과 대시 제거
    cardnumber = cardnumber.replace(/[ -]/g,'');

    //카드 번호가 유효한지 검사
    //정규식이 캡처 그룹들 중 하나에 들어있는 숫자를 캡처
    //var match = /^(?:(94[0-9]{14})|(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/.exec(cardnumber);
    var match = /^[0-9]{16}$/.exec(cardnumber);
    if(match){
       result = true;
    }
    return result;
}

function cvcVali(cvc){
   let result = false;  
   var match = /^[0-9]{3}$/.exec(cvc);
    if(match){
       result = true;
    }
    return result;
}


}
</script>