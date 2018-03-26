function number_format(input){ 
	var input = String(input); 
	var reg = /(\-?\d+)(\d{3})($|\.\d+)/; 
	if(reg.test(input)){ 
		return input.replace(reg, function(str, p1,p2,p3){ 
				return number_format(p1) + "," + p2 + "" + p3; 
			}     
		); 
	}else{ 
		return input; 
	} 
}

function serviceMoney()
{
	var cnt = document.getElementById('cnt');
	var total_money = document.getElementById('total_money');
	var total_service = document.getElementById('total_service');
	var totalM = document.getElementById('totalM');
	var totalV = 0;
	var serviecSum = 0;
	var sMoneySum = 0;

	
	
		for(var i=1;i<=cnt.value;i++){
			
			var obj = document.getElementById('service_cnt'+ i);
			var price = document.getElementById('price' + i);
			var sMoney = document.getElementById('sMoney' + i);
			var service_price = document.getElementById('service_price' + i);
			

			sMoneySum = eval(price.value) * eval(obj.value);
			service_price.value = sMoneySum;
			sMoney.innerHTML = '￦' + number_format(sMoneySum);
			serviecSum += sMoneySum;
			
	}

	totalV = Number(total_money.value) + serviecSum;
	total_service.value = serviecSum;
	
	totalM.innerHTML = '￦' + number_format(totalV);

}

function period()
{           
  f = document.frm;
  f.step.value = 'reserV';
	f.method = "POST";
	f.action = "/pension/index.html";

	f.submit();
}

function reser_submit()
{
	var frm = document.frm;
	var val = document.getElementsByName('chk[]');
	var va2 = document.getElementsByName('inwon[]');
	//var va3 = document.getElementsByName('chk[]');
	
	var checking = 0;
	for (var i=0; i < val.length ; i++)
	{
		if (val[i].checked == true)
		{
			checking = 1;	
		}
	}
	if (checking == 0)
	{
		alert('객실을 하나이상 선택하셔야 합니다.');
		return false;
	}
	
	frm.step.value = 'reserV2';
	frm.method = "POST";
	frm.action = "/pension/index.html";
	frm.submit();
	
}

function reser_mobile_submit()
{
	var frm = document.frm;
	var val = document.getElementsByName('chk[]');
	
	var checking = 0;
	for (var i=0; i < val.length ; i++)
	{
		if (val[i].checked == true)
		{
			checking = 1;	
		}
	}
	if (checking == 0)
	{
		alert('객실을 하나이상 선택하셔야 합니다.');
		return false;
	}
	
	frm.step.value = 'reserV';
	frm.method = "POST";
	frm.action = "/pension/mobile/index.html";
	//frm.submit();
	
}

function reser_send()
{
var	frm = document.frm;
	
	if (frm.name.value == '') {
		alert('성명을 입력하셔야 합니다.');
		frm.name.focus();
		return false;
	}		
	if (frm.hp1.value == '') {
		alert('휴대폰 번호를 입력하셔야 합니다.');
		frm.hp1.focus();
		return false;
	}
	if (frm.hp2.value == '') {
		alert('휴대폰 번호를 입력하셔야 합니다.');
		frm.hp2.focus();
		return false;
	}
	if (frm.hp3.value == '') {
		alert('휴대폰 번호를 입력하셔야 합니다.');
		frm.hp3.focus();
		return false;
	}
	if (frm.inName.value == '') {
		alert('입금자명을 입력하셔야 합니다..');
		frm.inName.focus();
		return false;
	}
	
	if (frm.cla.checked == false) {
		alert('개인정보 취급정책 및 예약규정에 동의하셔야 합니다.');
		return false;
	}

	if (!confirm('예약하시겠습니까?')) {
		return false;
	}

}

function backPage()
{
	frm = document.frm;
	
	frm.step.value = "reserV";
	frm.action = "/pension/index.html";
	frm.submit();
}

function cancleBank()
{
	var frm = document.frm;

	if (frm.rbank.value == '') {
		alert('은행명을 입력하셔야 합니다.');
		return false;
	}
	if (frm.rbank_no.value == '') {
		alert('계좌번호를 입력하셔야 합니다.');
		return false;
	}
	if (frm.rname.value == '') {
		alert('예금주를 입력하셔야 합니다.');
		return false;
	}
	if (!confirm('예약을 취소 하시겠습니까?')) {
		return false;
	}
}
function reser_info()
{
	var frm = document.frm;
	if (frm.name.value == '') {
		alert('이름을 입력하셔야 합니다.');
		return false;
	}
	if (frm.hp1.value == '') {
		alert('휴대폰번호를 입력하셔야 합니다.');
		return false;
	}
	if (frm.hp2.value == '') {
		alert('휴대폰번호를 입력하셔야 합니다.');
		return false;
	}
	if (frm.hp3.value == '') {
		alert('휴대폰번호를 입력하셔야 합니다.');
		return false;
	}
}
