function actShopPrintFnc(flag){
	var frm = document.writeF;
	for(i = 1; i <= 10; i++){
		var obj = document.getElementsByName("aitem" + i);
		if(obj[0] != null){
			var chkYN = obj[0].getAttribute("incMode");
			if(chkYN == 'y'){
				if(obj[0].value == ""){
					alert('필수 옵션을 선택하세요.');
					obj[0].focus();
					return;
				}
			}
		}
	}
	if(frm.option1 != null){
		if(frm.option1.value == ''){
			alert('재질을 선택하세요.');
			frm.option1.focus();
			return;
		}
	}
	if(frm.option2 != null){
		if(frm.option2.value == '' && frm.option2.disabled == false){
			alert('사이즈를 선택하세요.');
			frm.option2.focus();
			return;
		}
	}
	if(frm.option3 != null){
		if(frm.option3.value == ''){
			alert('형태를 선택하세요.');
			frm.option3.focus();
			return;
		}
	}
	if(frm.option4 != null){
		if(frm.option2.value == '02'){
			if(frm.option4.value == ''){
				alert('폭을 선택하세요.');
				frm.option4.focus();
				return;
			}
		}
	}
	if(frm.option5 != null){
		if(frm.option2.value == '02'){
			if(frm.option5.value == ''){
				alert('길이를 선택하세요.');
				frm.option5.focus();
				return;
			}
		}
	}

	if(frm.option6 != null){
		if(frm.option6.value == ''){
			alert('마감방법을 선택하세요.');
			frm.option6.focus();
			return;
		}
	}
	
	frm.action = "/zzAppModule/process/shop/shop_process_print.php";
	frm.buymode.value = flag;
	frm.direct.value = 'y';
	frm.submit();
}
function actShopFnc1(flag){
	var frm = document.writeF;
/*
	if(frm.option1 != null){
		if(frm.option1.value == ""){
			alert('받는일자를 선택하세요.');
			frm.option1.focus();
			return;
		}
	}

	if(frm.option2 != null){
		if(frm.option2.value == ""){
			alert('배송시간을 선택하세요.');
			frm.option2.focus();
			return;
		}
	}	
*/
	//if(!chkPeriod()) return;
	frm.buymode.value = flag;
	frm.direct.value = 'y';
	frm.submit();
}

function actShopFnc(flag){
	var frm = document.writeF;
	var objFrm = document.cartFrm;
	var obj = document.getElementById('opt');
	var objOptionsCnt = document.getElementsByName("optionsCnt");
	if(flag == 'out'){
		alert('판매완료된 상품입니다');
		return;
	}
	
	if(frm.sell_out != null){
		if(frm.sell_out.value == 'y'){
			alert("품절상품입니다.");
			return;
		}
	}


	for(i = 1; i <= 10; i++){
		var obj = document.getElementsByName("aitem" + i);
		if(obj[0] != null){
			var chkYN = obj[0].getAttribute("incMode");
			if(chkYN == 'y'){
				if(obj[0].value == ""){
					alert('필수 옵션을 선택하세요.');
					obj[0].focus();
					return;
				}
				var str = obj[0].value;
				var cutStr = str.split('-');
				if(cutStr[1] == '품절'){
					alert('품절상품입니다.');
					return;
				}
			}
		}
	}


	if(frm.option1 != null){
		if(frm.option1.value == ''){
			alert('옵션을 선택하세요.');
			frm.option1.focus();
			return;
		}
	}
	if(frm.option2 != null){
		if(frm.option2.value == ''){
			alert('옵션을 선택하세요.');
			frm.option2.focus();
			return;
		}
	}
	if(frm.option3 != null){
		if(frm.option3.value == ''){
			alert('옵션을 선택하세요.');
			frm.option3.focus();
			return;
		}
	}
	if(frm.option4 != null){
		if(frm.option4.value == ''){
			alert('옵션을 선택하세요.');
			frm.option4.focus();
			return;
		}
	}
	if(frm.option5 != null){
		if(frm.option5.value == ''){
			alert('옵션을 선택하세요.');
			frm.option5.focus();
			return;
		}
	}
	if(frm.add_sel_price != null){
		if(frm.add_sel_price.value == ""){
			alert('필수 옵션을 선택하세요.');
			frm.add_sel_price.focus();
			return;
		}
	}
	
	/*
	var group_cnt = frm.group_cnt.value;
	if(group_cnt != undefined){
		var chkCnt = 0;
		group_cnt = parseInt(group_cnt,10);
		if(objOptionsCnt.length > 0){
			for(i = 0; i < objOptionsCnt.length; i++){
				if(objOptionsCnt[i].value != ""){
					chkCnt = chkCnt + parseInt(objOptionsCnt[i].value,10);
				}
			}
		}
		if(chkCnt == 0){
			alert('옵션별 수량을 입력하세요.');
			return;
		}
		if(group_cnt != chkCnt){
			alert('입력하신 수량이 전체수량과 일치하지 않습니다\r\n확인후 다시 입력하여 주시기 바랍니다.\r\n- 묶음 수량 [' + group_cnt + ']개');
			return;
			return;
		}
	}
	*/

	if(objFrm != undefined && objFrm != null && flag == 'cart'){
		frm.target = "cartFrm";
		frm.framemode.value = "y";
	}

	frm.buymode.value = flag;
	frm.direct.value = 'y';
	frm.submit();
}





function changeShopCount(flag,nums){
	var frm = document.writeF;
	var obj = document.getElementsByName("cnt");
	var cnt = obj[nums].value;
	var result = shopBuyCnt(cnt,'',nums);
	if(result == true){
		var frm = document.writeF;
		frm.buymode.value = 'chgCnt';
		frm.chg_no.value = nums;
		frm.direct.value = 'y';
		frm.submit();
		}
	return;
}
function viewShopZoom(code){
	var win = window.open('/zzAppModule/common/zoomImg.php?code=' + code,'photo','left=200,top=150,width=500,height=500,scrollbars=yes');
	win.focus();
}
function shopBuyCnt(value,flag,nums){
	var frm = document.writeF;
	//var sell_chk = frm.sell_cnt.value;
	var remain_use_frm = document.getElementById("remain_use_cnt" + nums);
	var limit_cnt_frm = document.getElementById("limit_cnt" + nums);
	var max_cnt_frm = document.getElementById("max_cnt" + nums);
	var cnt_frm = document.getElementsByName("cnt[]");
	var remain_use = document.getElementsByName("remain_use");
	var remain_cnt = document.getElementsByName("remain_cnt");
	var cnt = value;
	if(cnt == '') cnt = 1;
	cnt = parseInt(cnt);
	sell_chk = remain_use_frm.value;
	limit_cnt = limit_cnt_frm.value;
	max_cnt = max_cnt_frm.value;

//	remain_use = remain_use[0].value;
//	remain_cnt = remain_cnt[0].value;

	if(flag == 'up'){
		cnt = cnt  + 1;
	}else if(flag == 'down'){
		cnt = cnt - 1;
	}
	if(cnt == 0){
				objInput.value = 1;
				return false;
	}
	if(remain_use == 'y'){
		if(cnt > parseInt(remain_cnt,10)){
			alert('최대 구매수량은 ' + remain_cnt + "개 입니다.");
			cnt_frm[nums].value = remain_cnt;
			return false;
		}
	}
	if(sell_chk == 'y'){
			if(cnt < parseInt(limit_cnt)){
					alert('최소 구매수량은 ' + limit_cnt + "개 입니다.\r\n수량을 다시 입력하여 주세요");
					cnt_frm[nums].value = limit_cnt;
					return false;
			}

			if(cnt > parseInt(max_cnt)){
					alert('최대 구매수량은 ' + max_cnt + "개 입니다.\r\n수량을 다시 입력하여 주세요");
					cnt_frm[nums].value = max_cnt;
					return false;
			}
	}

	cnt_frm[nums].value = cnt;
	return true;
}
function setSameInfo(checked){
	var frm = document.writeF;

	if(checked){
		
		if(frm.rname != null && frm.sname != null) frm.rname.value = frm.sname.value;
		
		if(frm.rtel1 != null && frm.stel1 != null) frm.rtel1.value = frm.stel1.value;
		if(frm.rtel2 != null && frm.stel2 != null) frm.rtel2.value = frm.stel2.value;
		if(frm.rtel3 != null && frm.stel3 != null) frm.rtel3.value = frm.stel3.value;

		if(frm.rhp1 != null && frm.shp1 != null) frm.rhp1.value = frm.shp1.value;
		if(frm.rhp2 != null && frm.shp2 != null) frm.rhp2.value = frm.shp2.value;
		if(frm.rhp3 != null && frm.shp3 != null) frm.rhp3.value = frm.shp3.value;

		if(frm.rzip1 != null && frm.szip1 != null) frm.rzip1.value = frm.szip1.value;
		if(frm.rzip2 != null && frm.szip2 != null) frm.rzip2.value = frm.szip2.value;
		if(frm.rzip_address1 != null && frm.szip_address1 != null) frm.rzip_address1.value = frm.szip_address1.value;
		if(frm.rzip_address2 != null && frm.szip_address2 != null) frm.rzip_address2.value = frm.szip_address2.value;
	}else{
		if(frm.rname != null) frm.rname.value = '';
		if(frm.rtel1 != null) frm.rtel1.value = '';
		if(frm.rtel2 != null) frm.rtel2.value = '';
		if(frm.rtel3 != null) frm.rtel3.value = '';

		if(frm.rhp1 != null) frm.rhp1.value = '';
		if(frm.rhp2 != null) frm.rhp2.value = '';
		if(frm.rhp3 != null) frm.rhp3.value = '';

		if(frm.rzip1 != null) frm.rzip1.value = '';
		if(frm.rzip2 != null) frm.rzip2.value = '';
		if(frm.rzip_address1 != null) frm.rzip_address1.value = '';
		if(frm.rzip_address2 != null) frm.rzip_address2.value = '';
	}
	
}

function chkShopEstiFrm(){
	var frm = document.writeF;
	if(!chkInputType(frm,'title','제목을',0,'')) return false;
	if(!chkInputType(frm,'content','내용을',1,'')) return false;
	if(!chkInputType(frm,'total_point','평점을',1,'rdo')) return false;
	if(!confirm('등록 하시겠습니까?')){
		return false;
	}
}
function goJumunProcess(){
	var frm = document.writeF;
	if(frm.total_money.value == 0 || frm.total_money.value < 0){
		 alert('구매하실 상품이 없습니다.');
		 return;
	}
	if(!chkInputType(frm,'sname','구매자명을',0,'')) return;	
	//if(!chkInputType(frm,'stel1','전화번호(구매자)를',1,'')) return;
	//if(!chkInputType(frm,'stel2','전화번호(구매자)를',0,'')) return;
	//if(!chkInputType(frm,'stel3','전화번호(구매자)를',0,'')) return;
	if(!chkInputType(frm,'shp1','휴대전화(구매자)를',1,'')) return;
	if(!chkInputType(frm,'shp2','휴대전화(구매자)를',0,'')) return;
	if(!chkInputType(frm,'shp3','휴대전화(구매자)를',0,'')) return;
	if(!chkInputType(frm,'szip1','우편번호(구매자)를',1,'')) return;
	if(!chkInputType(frm,'szip_address1','주소(구매자)를',0,'')) return;
	if(!chkInputType(frm,'szip_address2','상세 주소(구매자)를',0,'')) return;

	if(!chkInputType(frm,'rname','수취인명을',0,'')) return;
	//if(!chkInputType(frm,'rtel1','전화번호(수취인)를',1,'')) return;
	//if(!chkInputType(frm,'rtel2','전화번호(수취인)를',0,'')) return;
	//if(!chkInputType(frm,'rtel3','전화번호(수취인)를',0,'')) return;
	if(!chkInputType(frm,'rhp1','휴대전화(수취인)를',1,'')) return;
	if(!chkInputType(frm,'rhp2','휴대전화(수취인)를',0,'')) return;
	if(!chkInputType(frm,'rhp3','휴대전화(수취인)를',0,'')) return;
	if(!chkInputType(frm,'rzip1','우편번호(수취인)를',1,'')) return;
	if(!chkInputType(frm,'rzip_address1','주소(수취인)를',0,'')) return;
	if(!chkInputType(frm,'rzip_address2','상세 주소(수취인)를',0,'')) return;
	

	if(confirm('주문 하시겠습니까?')){
		frm.action = "/zzAppModule/process/shop/jumun_register.php";
		frm.submit();
	}
	return;
}
function checkedAll(checked){
	var obj = document.getElementsByName("chk_code[]");
	if(obj.length > 0){
		if(checked){
			for(i = 0; i < obj.length; i++){
				obj[i].checked = true;
			}
		}else{
			for(i = 0; i < obj.length; i++){
				obj[i].checked = false;
			}
		}
	}
}

function checkedShopItem(){
	var obj = document.getElementsByName("chk_code[]");
	chking  = 0;
	if(obj.length > 0){
		for(i = 0; i < obj.length; i++){
			if(obj[i].checked == true){
				chking = 1;
				break;
			}
		}
	}

	return chking;
}
function cartCheckedProcessPrint(flag,code){
	var frm = document.writeF;
	var obj = document.getElementsByName("cnt");
	var chkCnt = checkedShopItem();
	frm.action = "/zzAppModule/process/shop/shop_process_print.php";
	if(flag == 'del'){	
		if(chkCnt == 0){
			alert('선택된 아이템이 없거나 데이터가 없습니다.');
			return ;
		}
		frm.buymode.value = 'cartdelete';
		frm.submit();
		return;
	}else if(flag == 'all'){
		checkedAll(true);
		frm.buymode.value = 'cartbuyall';
		frm.submit();
		return;
	}else if(flag == 'chked'){
		if(chkCnt == 0){
			alert('선택된 아이템이 없거나 데이터가 없습니다.');
			return ;
		}
		frm.buymode.value = 'checkedItem';
		frm.submit();
		return;
	}else if(flag == 'goShop'){
		this.document.location.href="/HOME/index.php?_zidx=" + code;
	}
}


function cartCheckedProcess(flag,code){
	
	var frm = document.writeF;
	var obj = document.getElementsByName("cnt");
	var chkCnt = checkedShopItem();
	if(flag == 'del'){	
		if(chkCnt == 0){
			alert('선택된 상품이 없습니다.\n상품을 체크하여주세요.');
			return ;
		}
		frm.buymode.value = 'cartdelete';
		frm.submit();
		return;
	}else if(flag == 'all'){
		checkedAll(true);
		
		frm.buymode.value = 'cartbuyall';
		frm.submit();
		return;
	}else if(flag == 'chked'){
		if(chkCnt == 0){
			alert('선택된 상품이 없습니다.\n상품을 체크하여주세요.');
			return ;
		}
		frm.buymode.value = 'checkedItem';
		frm.submit();
		return;
	}else if(flag == 'goShop'){
		this.document.location.href="/HOME/index.php?_zidx=" + code;
	}
}
function confirmLoginForm(){
	if(confirm('로그인후 이용가능합니다. 로그인페이지로 이동하시겠습니까?')){
		this.document.location.href=loginGo + "&rurl=" + escape(reurl);
	}
}
function toCart(){
	var frm = document.writeF;
	var chkCnt = checkedShopItem();
	if(chkCnt == 0){
		alert('선택된 아이템이 없거나 데이터가 없습니다.');
		return ;
	}
	frm.buymode.value = 'movecart';
	frm.submit();
}


function toCartDiv(code){
	var frm = document.writeF;
	var chk = document.createElement("input");
	chk.name = "chk_code[]";
	chk.value = code;
	chk.type = "hidden";

	frm.appendChild(chk);
	frm.buymode.value = 'movecart';
	frm.submit();
}

function toOrderDiv(code){
	var frm = document.writeF;
	var chk = document.createElement("input");
	chk.name = "chk_code[]";
	chk.value = code;
	chk.type = "hidden";

	frm.appendChild(chk);
	frm.buymode.value = 'buy';
	frm.submit();
}

function toCartNew(code){
	var frm = document.writeF;
	var chk = document.createElement("input");
	chk.name = "chk_code[]";
	chk.value = code;
	chk.type = "hidden";

	frm.appendChild(chk);
	frm.action = "/zzAppModule/process/shop/shop_process_print.php";
	frm.buymode.value = 'movecart';
	frm.submit();
}

function deleteWishNew(code){
	if(confirm('해당 상품을 관심품목에서 삭제 하시겠습니까?')){
		var frm = document.writeF;
		var chk = document.createElement("input");
		chk.name = "chk_code[]";
		chk.value = code;
		chk.type = "hidden";

		frm.appendChild(chk);
		frm.action = "/zzAppModule/process/shop/shop_process_print.php";
		frm.buymode.value = 'deletewish';
		frm.submit();
	}
}
function viewShopDetail(flag){
	
	for(i = 1; i <= 4; i++){
		var obj = document.getElementById("shopDetailTbl0" + i);
		var objTD = document.getElementById("viewDetailTD0" + i);
		obj.style.display = 'none';
		objTD.background="/zzAppModule/bimg/shop/view_tabOut.gif";
		objTD.style.fontWeight = "normal";
	}
	var obj = document.getElementById("shopDetailTbl" + flag);
	var objTD = document.getElementById("viewDetailTD" + flag);
	obj.style.display = 'inline';
	objTD.background="/zzAppModule/bimg/shop/view_tabOver.gif";
	objTD.style.fontWeight = "bold";
}
function writeShopEsti(flag){
	var win = window.open('/zzAppModule/common/common_shop.php?' + flag,'shop','width=700,height=600,scrollbars=no');
	win.focus();
}
function viewEstiContent(flag){
	var obj = document.getElementById("estiContent" + flag);
	if(obj != null){
		if(obj.style.display == 'inline'){
			obj.style.display = 'none';
		}else{
			obj.style.display = 'inline';
		}
	}
}
function modShopEsti(flag,code){
	var win = window.open('/zzAppModule/common/common_shop.php?' + flag + '&mcode=' + code,'shop','width=700,height=600,scrollbars=no');
	win.focus();
}
function delEstiData(flag,code){
	if(confirm('해당 데이터를 삭제 하시겠습니까?')){
		var win = window.open('/zzAppModule/common/common_shop.php?' + flag + '&mcode=' + code,'shop','width=700,height=600,scrollbars=no');
		win.focus();
	}
}
function changeShopSearchCondition(flag){
	var obj = null;
	obj = document.getElementById("schShopKey_name");
	obj.style.display = 'none';
	obj = document.getElementById("schShopKey_maker");
	obj.style.display = 'none';
	obj = document.getElementById("schShopKey_made");
	obj.style.display = 'none';
	obj = document.getElementById("schShopKey_brand");
	obj.style.display = 'none';
	obj = document.getElementById("schShopKey_price");
	obj.style.display = 'none';
	obj = document.getElementById("schShopKey_" + flag);
	obj.style.display = 'inline';
}

/* 쇼핑몰 상세 페이지에서 추가 금액 선택 옵션 */
function selUserAddPriceProduct(value,skinMode,oprice){
	// value 형식 : 자체코드^|^상품코드^|^옵션명^|^금액^|^포인트^|^재고량
	if(value == '') return;
	var parentTable = document.getElementById("userAddPriceTable");
	var totalImsi = document.getElementById("imsiTotal");
	var totalMoney = totalImsi.value == '' ? 0 : parseInt(totalImsi.value);
	
	var callValue = value.split("^|^");
    var nums = parentTable.rows.length;
	
	
	var code = callValue[0] == undefined ? '' : callValue[0];
	var product_code = callValue[1] == undefined ? '' : callValue[1];
	var option_name = callValue[2] == undefined ? '' : callValue[2];
	var price = callValue[3] == undefined ? '' : parseInt(callValue[3]);
	var point = callValue[4] == undefined ? '' : parseInt(callValue[4]);
	var remain = callValue[5] == undefined ? '' : parseInt(callValue[5]);
	if(oprice == '') oprice = 0;
	else oprice = parseInt(oprice,10);
	/* 중복 선택 체크 */
	for(i = 0; i < nums; i++){
		if("uSelP_" + code == parentTable.rows[i].id){
			alert('동일한 항목이 추가되어 있습니다.');
			return;
		}
	}

	/* 중복 선택 체크 */
	if(price != '' && price > 0){
	//	totalMoney = (totalMoney + price + oprice);
	}
	totalMoney = (totalMoney + price + oprice);
	totalImsi.value = totalMoney;
	
	if(skinMode == ''){
		var TR = parentTable.insertRow(parentTable);
		var TD1 = TR.insertCell(0);
		var TD2 = TR.insertCell(1);
		var TD3 = TR.insertCell(2);
		var TD4 = TR.insertCell(3);
		
		HTML = "<table border='0' width='90' cellspacing='0' cellpadding='0' style='padding:0px 0px 0px 0px'><tr>";

		HTML = HTML + "<td style='padding-right:4px;height:18px;' width='30'>";
		/* HIDDEN 값 */
		HTML = HTML + "<input type='hidden' name='pCode[]' value='" +  code + "'>";
		HTML = HTML + "<input type='hidden' name='price" + code + "' value='" + (price + oprice) + "'>";
		/* HIDDEN 값 */
		HTML = HTML + "<input type='text'  name='cnt" + code + "' id='cnt" + code + "' value='1' onKeyUp='javascript:NumCheck(this,this.value)' style='width:25px;height:18px;border:solid 1px #dee0cc;background:#ffffff'>";
		HTML = HTML + "</td><td width='30'>";
		HTML = HTML + "<img src='/zzAppModule/design/module/shop/skin001/image/btn_up.gif' width='11' height='9'  onClick=\"javascript:shopCntChange(document.getElementById('cnt" + code + "').value,'up','" + code + "')\" style='cursor:pointer;margin-bottom:3px;'><BR>";
		HTML = HTML + "<img src='/zzAppModule/design/module/shop/skin001/image/btn_down.gif' width='11' height='9' onClick=\"javascript:shopCntChange(document.getElementById('cnt" + code + "').value,'down','" + code + "')\" style='cursor:pointer'>";
		HTML = HTML + "</td><td style='padding-left:5px;'>&nbsp;</td>";
		HTML = HTML + "</tr>";
		HTML = HTML + "</table>";
		TR.id = "uSelP_" + code;
		TD1.height = "20";
		TD1.style.width="180px";
		TD1.style.borderBottom = "1px dashed #cccccc";
		TD1.innerHTML = "<B>" + option_name + "</B>";

		TD2.style.borderBottom = "1px dashed #cccccc";
		TD2.width = 70;
		TD2.innerHTML = HTML;

		TD3.id = "uMoneyP_" + code;
		TD3.style.borderBottom = "1px dashed #cccccc";
		TD3.innerHTML = number_format(price + oprice) + "원";

		TD4.style.borderBottom = "1px dashed #cccccc";
		TD4.innerHTML = "<a href=\"javascript:setUserDeletePrice('" + code + "','" + oprice + "');\">x</a>";
	}

	var objDispMoney = document.getElementById("userTotalDispMoney");
	objDispMoney.innerHTML = number_format(totalMoney) + "원";
}
function setUserDeletePrice(code,price){
	var parentTable = document.getElementById("userAddPriceTable");
	var totalImsi = document.getElementById("imsiTotal");
	var totalMoney = totalImsi.value == '' ? 0 : parseInt(totalImsi.value);
  var cntObj = document.getElementById("cnt" + code);
	
	cnt = cntObj.value == '' ? 1 : parseInt(cntObj.value,10);

	/* 2012. 11. 06 수정 */
	if(price != '' && price > 0){
		//price = parseInt(price,10);
		//totalMoney = (totalMoney - (price * cnt));
	}
	/* 2012. 11. 06 수정 */

	price = parseInt(price,10);
	totalMoney = (totalMoney - (price * cnt));

	totalImsi.value = totalMoney;

	var objDispMoney = document.getElementById("userTotalDispMoney");
	objDispMoney.innerHTML = number_format(totalMoney) + "원";
	var idx = 0;
	for(i = 0; i < parentTable.rows.length; i++){
		var objID = parentTable.rows[i].id;
		if(objID == "uSelP_" + code){
			idx = i;
			parentTable.deleteRow(idx);
		}
	}
	var obj = document.getElementById("add_sel_price");
	obj[0].selected = true;
}
/* 쇼핑몰 상세 페이지에서 추가 금액 선택 옵션 */

function shopCntChange(value,flag,objName){
	var objCnt = document.getElementById("cnt" + objName);
	var objPrice = document.getElementsByName("price" + objName);
	var dispTD = document.getElementById("uMoneyP_" + objName);
	if(objCnt == '') return;
	var limit_cnt = 1;
	var max_cnt = 1000;

	var cnt = value;
	if(cnt == '') cnt = 1;
	cnt = parseInt(cnt);

	if(objPrice != null) objPrice = objPrice[0];
	if(flag == 'up'){
		cnt = cnt  + 1;
	}else if(flag == 'down'){
		cnt = cnt - 1;
	}
	if(cnt == 0){
				objCnt.value = 1;
				return false;
	}
	if(cnt < parseInt(limit_cnt)){
		alert('최소 구매수량은 ' + limit_cnt + "개 입니다.\r\n수량을 다시 입력하여 주세요");
		objCnt.value = limit_cnt;
		return false;
	}

	if(cnt > parseInt(max_cnt)){
		alert('최대 구매수량은 ' + max_cnt + "개 입니다.\r\n수량을 다시 입력하여 주세요");
		objCnt.value = max_cnt;
		return false;
	}

	objCnt.value = cnt;
	var perPrice = parseInt(objPrice.value);
	var tMoney = perPrice * cnt;
	dispTD.innerHTML = number_format(tMoney) + "원";
 
	var totalImsi = document.getElementById("imsiTotal");
	var totalMoney = totalImsi.value == '' ? 0 : parseInt(totalImsi.value);
	var dispTotal = 0;
	if(flag == 'up'){
		dispTotal = (totalMoney - (perPrice * (cnt -1)) + tMoney);
		totalImsi.value = dispTotal;
	}else if(flag == 'down'){
		dispTotal = (totalMoney - (perPrice * (cnt + 1)) + tMoney);
		totalImsi.value = dispTotal;
	}

	var objDispMoney = document.getElementById("userTotalDispMoney");
	objDispMoney.innerHTML = number_format(dispTotal) + "원";

	return true;
}
function cartCntChange(value,flag,objName){
	var objCnt = document.getElementsByName("cnt" + objName);
	var objPrice = document.getElementsByName("price" + objName);
	var dispTD = document.getElementById("dispPrice" + objName);
	if(objCnt == '') return;
	var limitObj = document.getElementsByName("limit_cnt" + objName);
	var maxObj = document.getElementsByName("max_cnt" + objName);
	
	if(limitObj != null) limitObj = limitObj[0];
	if(maxObj != null) maxObj = maxObj[0];
	if(objCnt != null) objCnt = objCnt[0];

	var limit_cnt = limitObj.value == '' ? 1 : limitObj.value;	
	var max_cnt = maxObj.value == '' ? 1000 : maxObj.value;

	var cnt = value;
	if(cnt == '') cnt = 1;
	cnt = parseInt(cnt);

	if(objPrice != null) objPrice = objPrice[0];
	if(flag == 'up'){
		cnt = cnt  + 1;
	}else if(flag == 'down'){
		cnt = cnt - 1;
	}
	if(cnt == 0){
				objCnt.value = 1;
				return false;
	}
	if(cnt < parseInt(limit_cnt)){
		alert('최소 구매수량은 ' + limit_cnt + "개 입니다.\r\n수량을 다시 입력하여 주세요");
		objCnt.value = limit_cnt;
		return false;
	}

	if(cnt > parseInt(max_cnt)){
		alert('최대 구매수량은 ' + max_cnt + "개 입니다.\r\n수량을 다시 입력하여 주세요");
		objCnt.value = max_cnt;
		return false;
	}

	objCnt.value = cnt;
	var perPrice = parseInt(objPrice.value);
	var tMoney = perPrice * cnt;
	if(dispTD != null)	dispTD.innerHTML = number_format(tMoney) + "원";
 
	return true;
}


function changeApplyCartVale(value,code){
	var frm = document.writeF;	
	frm.chg_no.value = code;
	
	cnt = value;
	ajaxRequest = new ajax.HttpRequest();
	request = ajaxRequest.getHttpRequest();
	request.onreadystatechange = chkProCntVal;
	request.open("POST", '/chk_cnt_value.php', true);
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	request.send("chg_no=" + code + '&cnt_frm='+cnt);  
}


function chkProCntVal(){	
	result = request.responseText;
	if (request.readyState == 4) {
		if (request.status == 200) {
			var str_s = request.responseText.split('|'); 
			var obj = document.getElementById('dispPrice'+str_s[1]);
			var tot = document.getElementById('totalP');
			var sum = document.getElementById('sumP');

			result = request.responseText;
			obj.innerHTML = str_s[0] + "원";
			tot.innerHTML = str_s[2] + "원";
			sum.innerHTML = str_s[2] + "원";
			request = null;
			ajaxRequest = null;
		}
	}	
}


function changeApplyCart(code){
	var frm = document.writeF;
	
	frm.chg_no.value = code;
	frm.buymode.value = "chgCnt";
	frm.submit();
}

function confirmCartDelete(code){
	var frm = document.writeF;
	if(confirm('해당 상품을 삭제 하시겠습니까?')){
		frm.chg_no.value = code;
		frm.buymode.value = "cartdelete";
		frm.submit();
	}
}

function chkProductViewPwd(code,rurl,obj){
	rurl = encodeURIComponent(rurl);
	var objText = "<div style='background:#eee; padding-left:0px; width:180px; position:absolute;border:1px solid #999; color:#000;margin-top:100px;'>";
	objText = objText + "<table border='0' cellspacing='0' cellpadding='0'><tr>";
	objText = objText + "<td style='padding-left:3px;'><strong>비밀번호</strong>  ";
	objText = objText + "<input name='pwd" + code + "' type='password' id='pwd" + code + "' style='width:50px; height:19px; border:1px solid #d5d5d5;' />";
	objText = objText + "<img src='/shop/img/ok.gif' width='55' height='23' align='absmiddle' onClick=\"javascript:chkShopPwd('" +code  + "','" + rurl + "');\" style='cursor:pointer'/> </td></tr>";
	objText = objText + "</table></div>";


	var obj = document.getElementById("containDiv" + code);
	obj.innerHTML = objText;
}

function chkShopPwd(code,rurl){
	var objPwd = document.getElementById("pwd" + code);
	if(objPwd.value == ""){
		alert('비밀번호를 입력하세요.');
		objPwd.focus();
		return;
	}
	var process = '/zzAppModule/process/shop/view_pwd.php';
		var param = "code=" + code + "&pwd=" + objPwd.value + "&rurl=" + rurl;
		new XML_CLASS(process,param,resultShopPwdAuth,'POST','',"");
}
function resultShopPwdAuth(request){
	if (request.readyState == 4) {
     if (request.status == 200) {
			result  = request.responseText;
			if(result == 'empty'){
				alert('잘못된 접근입니다.');
				return;
			}else if(result == 'not'){
				alert('비밀번호가 일치하지 않습니다');
				return;
			}else{
				window.document.location.href=result;
			}
     } else {
       alert('처리중 오류가 발생했습니다');
     }	
   }
}
function sendShopTrace(company,number){
	if(number == '') return;
	if(company == '01'){		// 옐로우캡
		var win = window.open('http://www.yellowcap.co.kr/custom/inquiry_result.asp?invoice_no=' + number,'sendInfo','');
		win.focus();
	}else if(company == '02'){	// 우체국
		var win = window.open('http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=' + number,'sendInfo','');
	}else	if(company == '03'){		// 로젠
		var win = window.open('http://www.ilogen.com/iLOGEN.Web.New/TRACE/TraceNoView.aspx?slipno=' + number + '&gubun=slipno','sendInfo','');
		win.focus();
	}else	if(company == '04'){		// 한진택배
		var win = window.open('http://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num=' + number,'sendInfo','');
		win.focus();
	}else	if(company == '05'){		// CJ CLS
		var win = window.open('http://nexs.cjgls.com/web/service02_01.jsp?slipno=' + number,'sendInfo','');
		win.focus();
	}else if(company == '06'){
		var win = window.open('http://www.hlc.co.kr/customerService/join/02/login_proc.jsp?InvNo=' + number,'sendInfo','');
		win.focus();
	}else if(!company){ // 미지정
		var win = window.open('http://www.yellowcap.co.kr/custom/inquiry_result.asp?invoice_no=' + number,'sendInfo','');
		win.focus();
		}
}
function sendShopTraceAdm(company,number){
	if(number == '') return;
	if(company == '01'){		// 엘로우캡
		var win = window.open('http://www.yellowcap.co.kr/custom/inquiry_result.asp?invoice_no=' + number,'sendInfo','');
		win.focus();
	}else if(company == '02'){
		var win = window.open('http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=' + number,'sendInfo','');
	}else	if(company == '03'){		// 로젠
		var win = window.open('http://www.ilogen.com/iLOGEN.Web.New/TRACE/TraceNoView.aspx?slipno=' + number + '&gubun=slipno','sendInfo','');
		win.focus();
	}else	if(company == '04'){		// 한진택배
		var win = window.open('http://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num=' + number,'sendInfo','');
		win.focus();
	}else	if(company == '05'){		// CJ CLS
		var win = window.open('http://nexs.cjgls.com/web/service02_01.jsp?slipno=' + number,'sendInfo','');
		win.focus();
	}else if(company == '06'){
		var win = window.open('http://www.hlc.co.kr/customerService/join/02/login_proc.jsp?InvNo=' + number,'sendInfo','');
		win.focus();
	}
}

function chkUsePoint(value,obj){
	 var objMPoint = document.getElementById("authAbailablePoint");
	 var objLPoint = document.getElementById("limitAbailablePoint");
	 var total_money = document.getElementsByName("total_money");
	 var totPoint = 0;
	 total_money = total_money[0].value;
	 
	 if(objMPoint == null){
		 totPoint = 0;
	 }else{
		 if(objMPoint.value == '') totPoint = 0 ;
		 else totPoint = parseInt(objMPoint.value,10);
	 }

	 if(value == "") return;
	 if(parseInt(value,10) > totPoint){
			alert(number_format(totPoint) + ' 이상 사용 불가능합니다');
			obj.value = "";
			return;
	 }

	 if(parseInt(value,10) > parseInt(total_money,10)){
		 alert('결제 금액 ' + number_format(total_money) + "원 이상 사용 불가능합니다");
		 obj.value = "";
		 return;
	 }

	 if(parseInt(objMPoint.value,10) < parseInt(objLPoint.value,10)){
		 alert('최소 포인트 ' + number_format(objLPoint.value) + "원 이상부터 사용 가능합니다");
		 obj.value = "";
		 return;
	 }

}
function viewBank(flag){
	var obj1 = document.getElementById('bank01');
	var obj2 = document.getElementById('bank02');

	if(flag == 01){
		obj1.style.display = 'inline';
		obj2.style.display = 'inline';
	}else{
		obj1.style.display = 'none';
		obj2.style.display = 'none';
	}
}
function changeSendMethod(money,smoney,flag){
	var obj = document.getElementById("realInMoneyTD");
	var imoney = 0;
	if(flag == '01'){
		imoney = parseInt(money,10) + parseInt(smoney,10);
	}else if(flag == '02'){
		imoney = parseInt(money,10);
	}

	obj.innerHTML = number_format(imoney) + "원";
}
function chkAllShopItem(chked){
	var obj = document.getElementsByName("chk_code[]");

	for(i = 0; i < obj.length; i++){
		obj[i].checked = chked;
	}
}
function calSendUserMoney(money){
	var frm = document.writeF;
	var obj = document.getElementById('totalDispMoney');
	var totalObj = frm.total_money;
	var sendObj = frm.send_money;
  total = parseInt(totalObj.value,10);
	send_money = parseInt(sendObj.value,10);

	if(money == 0){
		obj.innerHTML = number_format(total - parseInt(send_money,10)) + "원";
		sendObj.value = 0;
		totalObj.value = (total - parseInt(send_money,10));
	}else{
		obj.innerHTML = number_format(total + parseInt(money,10)) + "원";
		sendObj.value = money;
		totalObj.value = total + parseInt(money,10);
	}
	
}

function wishCheckedProcess(flag,reCode){
	
	var frm = document.writeF;
	
	if(flag == 'wish'){	
	
		frm.code.value = reCode;
		//frm.proFlag.value = 'div';
		frm.buymode.value = 'wishdelete';
		frm.submit();
		return;
	}
		
}