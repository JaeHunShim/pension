// 예약할때 주민번호와  실명인증 해주는 JQuery 부분 
var imsiText = '';
var imsiContent = '';
var modData = 0;
var delData = 0;

function NonLogin(){
	var frm = document.writeF;
	if(!chkInputType(frm,'name','이름을',0,'')) return;
	if(!chkInputType(frm,'tel','휴대폰번호를',0,'')) return;
	frm.action = "/sub4/s11.htm";
	frm.submit();
}
function chkNonLogin(frm){
	if(!chkInputType(frm,'name','이름을',0,'')) return false;
	if(!chkInputType(frm,'tel','휴대폰번호를',0,'')) return false;
}
function chkRealName(){
	var frm = document.writeF;

	if(!chkInputType(frm,'name','이름을',0,'')) return;
	if(!chkInputType(frm,'jumin1','주민등록번호를',0,'')) return;
	if(!chkInputType(frm,'jumin2','주민등록번호를',0,'')) return;

	name = frm.name.value;
	jumin = frm.jumin1.value + "-" + frm.jumin2.value;
	ajaxRequest = new ajax.HttpRequest();
	request = ajaxRequest.getHttpRequest();
	request.onreadystatechange = chkReJoinMember;
    request.open("POST", '/zzAppModule/process/chk_member_join.php', true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
    request.send("name=" + name + "&jumin=" + jumin);   
}

function chkReJoinMember(){
	var frm = document.writeF;
	if (request.readyState == 4) {
     if (request.status == 200) {
			result  = request.responseText;
			request = null;
			ajaxRequest = null;
			if(result == 0){
				alert('실명인증에 성공하였습니다.');
				frm.chk_auth_name.value = "chkOk";
				return true;
			}else{
				alert('입력하신 주민등록번호가 이미 사용중입니다.');
				return false;
			}
        } else {
            alert('처리중 오류가 발생했습니다');
			request = null;
			ajaxRequest = null;
        }	
    }
}

function chkSfrmForm(frm){
	try{
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	}catch(e){
		oEditors = null;
	}
  var objDiv = createDebugWindow('debugDiv');
	var success = false;
	for(i = 0; i < frm.elements.length; i++){
		var tObj = frm.elements[i];
		in_mode = tObj.getAttribute("in_mode");
		if(in_mode != undefined){	
			if(in_mode == 'y'){	
				success = false;			
				in_type = tObj.getAttribute("in_type");
				id = tObj.getAttribute("id");
				in_ttl = tObj.getAttribute("in_ttl");
				if(in_type == '02'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'rdo')) break;
						else success = true;
				}else if(in_type == '03' || in_type == '13'){			
					if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
					else success = true;
				}else if(in_type == '04' || in_type == '05'){
					flag = id.substring(id.length -1);
					if(flag == '1'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
					}else{
						if(!chkInputType(frm,id,in_ttl + '을(를)',0,'')) break;
						else success = true;
					}
				}else if(in_type == '06'){
					if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
					else success = true;
				}else if(in_type == '07'){
					if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
					else success = true;
					if(frm.id_chk.value == ''){
						alert('아이디 중복 확인을 하지 않았습니다.');
						break;
					}else success = true;
				}else if(in_type == '08'){
					if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
					else success = true;
				}else if(in_type == '11'){

					if (oEditor){
						var editContents = oEditor.EditorDocument.body.innerText; 
						if(editContents.split(" ").join("") == ""){ 
							alert("내용을 입력하세요."); 
							oEditor.EditorDocument.body.focus(); 
							break;
						 }else success = true;
					}
				}else if(in_type == '12'){
					//if(frm.elements[i].in_lng == '1'){
						if(!chkInputType(frm,id, in_ttl+ '을(를)',1,'chk')) break;
						else success = true;
					//}
				}else{		
					if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
					else success = true;
				}
			}
		}
	}
	
	if(success){
		if(confirm('처리 하시겠습니까?')){
			createProcessDIv();
		}else{
			return false;
		}
	}
	return success;
    
}


function chkMemberForm(frm){
	var chkMode = frm.mem_mode.value;
	
	if(chkMode == 'mem_agree'){
		var agreeObj = frm.agreement;
		var privacyObj = frm.privacy;

		if(agreeObj != ''){
			if(agreeObj.checked == false){
				alert('회원 약관에 동의하셔야 합니다.');
				agreeObj.focus();
				return false;
			}
		}
		if(privacyObj != ''){
			if(privacyObj.checked == false){
				alert('개인보호 정책에 동의하셔야 합니다.');
				privacyObj.focus();
				return false;
			}
		}
	if(frm.chk_auth_name == ''){
		if(frm.chk_auth_name.value == ""){
			alert('실명인증을 하지 않았습니다. 실명 인증후 이용하여 주시기 바랍니다.');
			frm.name.focus();
			return false;
		}
	}else{
		if(frm.name.value == ""){
			alert('이름을 입력하셔야 합니다.');
			frm.name.focus();
			return false;
		}
	}

		frm.mem_mode.value = 'mem_reg';
	}else{		
		try{
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		}catch(e){
			oEditors = null;
		}
		var objDiv = createDebugWindow('debugDiv');
		var success = false;
		for(i = 0; i < frm.elements.length; i++){
			var tObj = frm.elements[i];
			var in_mode = tObj.getAttribute("in_mode");
			if(in_mode != undefined){	
				
				if(in_mode == 'y'){	
					success = false;			
					var in_type = tObj.getAttribute("in_type");
					var id = tObj.getAttribute("id");
					var in_ttl = tObj.getAttribute("in_ttl");

					if(in_type == '02'){
							if(!chkInputType(frm,id, in_ttl + '을(를)',1,'rdo')) break;
							else success = true;
					}else if(in_type == '03' || in_type == '13'){			
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
					}else if(in_type == '04' || in_type == '05'){
						flag = id.substring(id.length -1);
						if(flag == '1'){
							if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
							else success = true;
						}else{
							if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
							else success = true;
						}
					}else if(in_type == '06'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
					}else if(in_type == '07'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
						if(frm.id_chk.value == ''){
							alert('아이디 중복 확인을 하지 않았습니다.');
							success = false;
							break;
						}else{
							success = true;
						}
					}else if(in_type == '08'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
						else success = true;
					}else if(in_type == '11'){

						if (oEditor){
							var editContents = oEditor.EditorDocument.body.innerText; 
							if(editContents.split(" ").join("") == ""){ 
								alert("내용을 입력하세요."); 
								oEditor.EditorDocument.body.focus(); 
								break;
							 }else success = true;
						}
					}else if(in_type == '12'){
						//if(frm.elements[i].in_lng == '1'){
							if(!chkInputType(frm,id, in_ttl + '을(를)',1,'chk')) break;
							else success = true;
						//}
					}else{		
						if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
						else success = true;
					}
				}
			}
		}
		if(success){
			if(!compareValue(frm.pwd,frm.pwd_ok,'비밀번호가 일치하지 않습니다')){
				return false;
			}
			if(frm.mem_mode.value == 'mem_mod'){
				mess = '수정 하시겠습니까?';
			}else{
				mess = '가입 하시겠습니까?';
			}
			if(confirm(mess)){
				if(frm.mem_mode.value != 'mem_mod'){
					frm.mem_mode.value = "mem_reg";
				}
				frm.action = "/zzAppModule/process/member_ok.php";
				createProcessDIv();
				return true;
			}else{
				return false;
			}
		}
		return success;
		}

}
function chkMemberDrawForm(frm){
	if(!chkInputType(frm,"id",'아이디를',0,'')) return false;
	if(!chkInputType(frm,"pwd",'비밀번호를',0,''))  return false;
	if(!regConfirm('회원을 탈퇴 하시겠습니까?')){
		return false;
	}
}
function chkBoardForm(frm){
	try{
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	}catch(e){
		oEditors = null;
	}
  var objDiv = createDebugWindow('debugDiv');
	var success = false;
	for(i = 0; i < frm.elements.length; i++){
		var tObj = frm.elements[i];
		in_mode = tObj.getAttribute("in_mode");
		if(in_mode != undefined){	
			if(in_mode == 'y'){	
				success = false;			
				in_type = tObj.getAttribute("in_type");
				id = tObj.getAttribute("id");
				in_ttl = tObj.getAttribute("in_ttl");
				if(in_type == '02'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'rdo')) break;
						else success = true;
				}else if(in_type == '03' || in_type == '13'){			
					if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
					else success = true;
				}else if(in_type == '04' || in_type == '05'){
					flag = id.substring(id.length -1);
					if(flag == '1'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
					}else{
						if(!chkInputType(frm,id,in_ttl + '을(를)',0,'')) break;
						else success = true;
					}
				}else if(in_type == '06'){
					if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
					else success = true;
				}else if(in_type == '07'){
					if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
					else success = true;
					if(frm.id_chk.value == ''){
						alert('아이디 중복 확인을 하지 않았습니다.');
						break;
					}else success = true;
				}else if(in_type == '08'){
					if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
					else success = true;
				}else if(in_type == '11'){

					if (oEditor){
						var editContents = oEditor.EditorDocument.body.innerText; 
						if(editContents.split(" ").join("") == ""){ 
							alert("내용을 입력하세요."); 
							oEditor.EditorDocument.body.focus(); 
							break;
						 }else success = true;
					}
				}else if(in_type == '12'){
					//if(frm.elements[i].in_lng == '1'){
						if(!chkInputType(frm,id, in_ttl+ '을(를)',1,'chk')) break;
						else success = true;
					//}
				}else{		
					if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
					else success = true;
				}
			}
		}
	}
	
	if(success){
		if(confirm('처리 하시겠습니까?')){
			//createProcessDIv();
			frm.submit();
			return;
		}else{
			return;
		}
	}

	return;
    
}

function chkCounselForm(frm){
	var bmode = frm.bmode.value;
	if(bmode == 'delete'){
		if(!chkInputType(frm,'pwd','비밀번호를',0,'')) return false;
		return true;
	}else{
		try{
		oEditors.getById["content1"].exec("UPDATE_CONTENTS_FIELD", []);
		}catch(e){
			oEditors = null;
		}

		var objDiv = createDebugWindow('debugDiv');
		var success = false;
		for(i = 0; i < frm.elements.length; i++){
			var tObj = frm.elements[i];
			var in_mode = tObj.getAttribute("in_mode");

			if(in_mode != undefined){	
				if(in_mode == 'y'){	
					success = false;			
					var in_type = tObj.getAttribute("in_type");
					var id = tObj.getAttribute("id");
					var in_ttl = tObj.getAttribute("in_ttl");

					if(in_type == '02'){
							if(!chkInputType(frm,id, in_ttl + '을(를)',1,'rdo')) break;
							else success = true;
					}else if(in_type == '03' || in_type == '13'){			
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
					}else if(in_type == '04' || in_type == '05'){
						flag = id.substring(id.length -1);
						if(flag == '1'){
							if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
							else success = true;
						}else{
							if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
							else success = true;
						}
					}else if(in_type == '06'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
					}else if(in_type == '07'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
						if(frm.id_chk.value == ''){
							alert('아이디 중복 확인을 하지 않았습니다.');
							break;
						}else success = true;
					}else if(in_type == '08'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
						else success = true;
					}else if(in_type == '11'){

						if (oEditor){
							var editContents = oEditor.EditorDocument.body.innerText; 
							if(editContents.split(" ").join("") == ""){ 
								alert("내용을 입력하세요."); 
								oEditor.EditorDocument.body.focus(); 
								break;
							 }else success = true;
						}
					}else if(in_type == '12'){
						//if(frm.elements[i].in_lng == '1'){
							if(!chkInputType(frm,id,in_ttl + '을(를)',1,'chk')) break;
							else success = true;
						//}
					}else{		
						if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
						else success = true;
					}
				}
			}
		}
		
		if(success){
			if(confirm('처리 하시겠습니까?')){
				createProcessDIv();
			}else{
				return false;
			}
		}
	return success;
	}
	
}
function setEmail(objName,value){
	var objEmail2 = document.getElementById(objName + "2");
	objEmail2.value = value;
}
function chkLoginTopForm(frm){
	if(!chkInputType(frm,'mid','아이디를',0,'')) return false;
	if(!chkInputType(frm,'mpwd','비밀번호를',0,'')) return false;
}
function chkLoginForm(frm){
	if(!chkInputType(frm,'id','아이디를',0,'')) return false;
	if(!chkInputType(frm,'pwd','비밀번호를',0,'')) return false;
}

function chkBoardDeleteForm(frm){
	if(!chkInputType(frm,'pwd','비밀번호를',0,'')) return false;
}
function chkBoardDeleteFormNew(frm){
	if (frm.pwd.value == '') {
		alert('비밀번호를 입력하세요');
		return;
	}
}
function createDebugWindow(id){
	var divObj = document.createElement("div");
	divObj.id = id;
	divObj.style.width = "100%";
	divObj.style.height = "100%";
	divObj.style.left = 0;
	divObj.style.top = 0;
	divObj.style.background = "#DEDEDE";
	divObj.style.position = "absolute";
	divObj.style.filter = "alpha(opacity=100)";
	divObj.style.zindex = "9999999";

	return divObj;
}
function boardDeleteConfirm(bid,bno,rurl){
	if(!confirm('해당 데이터를 삭제 하시겠습니까?')){
		return;
	}
	var frmObj = document.createElement("form");
	var frmBmode = document.createElement("input");
	var frmBid = document.createElement("input");
	var frmBno = document.createElement("input");
	var frmBurl = document.createElement("input");
	
	frmObj.method = "POST";
	frmObj.action = "/zzAppModule/process/board_ok.php";

	frmBmode.type = "hidden";
	frmBmode.name = "bmode";
	frmBmode.value = "delete";	
	frmObj.appendChild(frmBmode);

	frmBurl.type = "hidden";
	frmBurl.name = "rurl";
	frmBurl.value = "_zidx=" + rurl;	
	frmObj.appendChild(frmBurl);

	frmBid.type = "hidden";
	frmBid.name = "board_id";
	frmBid.value = bid;	
	frmObj.appendChild(frmBid);

	frmBno.type = "hidden";
	frmBno.name = "bnum";
	frmBno.value = bno;	
	frmObj.appendChild(frmBno);


	this.document.body.appendChild(frmObj);
	
	frmObj.submit();
}
function boardDeleteAdminConfirm(bid,bno,rurl){
	if(!confirm('해당 데이터를 삭제 하시겠습니까?')){
		return;
	}

	var frmObj = document.createElement("form");
	var frmBmode = document.createElement("input");
	var frmBid = document.createElement("input");
	var frmBno = document.createElement("input");
	var frmBurl = document.createElement("input");
	
	frmObj.method = "POST";
	frmObj.action = "/zzAppModule/process/board_ok.php";

	frmBmode.type = "hidden";
	frmBmode.name = "bmode";
	frmBmode.value = "delete";	
	frmObj.appendChild(frmBmode);

	frmBurl.type = "hidden";
	frmBurl.name = "adminurl";
	frmBurl.value = rurl;	
	frmObj.appendChild(frmBurl);

	frmBid.type = "hidden";
	frmBid.name = "board_id";
	frmBid.value = bid;	
	frmObj.appendChild(frmBid);

	frmBno.type = "hidden";
	frmBno.name = "bnum";
	frmBno.value = bno;	
	frmObj.appendChild(frmBno);


	this.document.body.appendChild(frmObj);
	
	frmObj.submit();
}

function callProductAllList(){
	//var obj = document.getElementById("getCommentFrm");
	//obj.src = "/zzAppModule/design/common/comment.html?board_id=" + bid +  "&bnum=" + bno;
	/* utf-8 환경에서*/	
	var cate1 = document.getElementById("cate1");
	var cate2 = document.getElementById("cate2");
	var cate3 = document.getElementById("cate3");
	var cate4 = document.getElementById("cate4");
	var sname = document.getElementById("sname");

	if(cate1 != null) cate1 = cate1.value;
	if(cate2 != null) cate2 = cate2.value;
	if(cate3 != null) cate3 = cate3.value;
	if(cate4 != null) cate4 = cate4.value;
	if(sname != null) sname = sname.value;

	ajaxRequest = new ajax.HttpRequest();
	request = ajaxRequest.getHttpRequest();
	request.onreadystatechange = displayProductList;
    request.open("POST", '/zzAppModule/admin/process/shop/getProductList.php', true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
    request.send("cate1=" + cate1 + "&cate2=" + cate2 + "&cate3=" + cate3 + "&cate4=" + cate4 + "&sname=" + sname);   
}

function displayProductList(){
	if (request.readyState == 4) {
        if (request.status == 200) {
			var obj = document.getElementById("productListDiv");
			content = request.responseText;
			obj.innerHTML = content;

			request = null;
			ajaxRequest = null;
        } else {
            alert('처리중 오류가 발생했습니다');
			request = null;
			ajaxRequest = null;
        }
    }
}

var gblCateNo = null;
var gblCode = null;
var gblObjName = null;
var gblFlag = null;
/* 베스트 상품 설정하기 */
function setBestProduct(cateno,code,objName){
	this.gblCateNo = cateno;
	this.gblCode = code;
	this.gblObjName = objName;
	bestProductControl('add');	
}
/* 베스트 상품 제거하기 */
function removeBestProduct(cateno,code,objName){
	this.gblCateNo = cateno;
	this.gblCode = code;
	this.gblObjName = objName;
	
	bestProductControl('remove');	
}
/* 베스트 상품 추가/제거 함수 */
function bestProductControl(flag){
	this.gblFlag = flag;
	ajaxRequest = new ajax.HttpRequest();
	request = ajaxRequest.getHttpRequest();
	request.onreadystatechange = bestProductResultControl;
    request.open("POST", '/zzAppModule/admin/process/shop/setBestProduct.php', true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
    request.send("cateNo=" + this.gblCateNo + "&code=" + this.gblCode);
}
function bestProductResultControl(){
	if (request.readyState == 4) {
        if (request.status == 200) {
			//alert(gblCode + " : " + request.responseText);
			var objBody = document.getElementById("useProductListDiv");
			var objProduct =  document.getElementById("productListDiv");

			var objContentOrg = document.getElementById(gblObjName + gblCode);
			var objBtn = document.getElementById(gblObjName + "Btn" + gblCode);
			var objBtnReg = document.getElementById(gblObjName + "BtnReg" + gblCode);
			var objContent =  request.responseText;
			if(gblFlag == 'add'){		
				alert(gblObjName + gblCode);
				objBtn.style.display = 'none';
				objBtnReg.style.display = 'inline';
				objProduct.removeChild(objContentOrg);
				objBody.innerHTML = objContent;
				
			}else{
				objBtn.style.display = 'inline';
				objBtnReg.style.display = 'none';
				objProduct.innerHTML = objContent;
			}
			request = null;
			ajaxRequest = null;
			gblCateNo = null;
			gblCode = null;
			gblObjName = null;
			gblFlag = null;
        } else {
            alert('처리중 오류가 발생했습니다');
			request = null;
			ajaxRequest = null;
			gblCateNo = null;
			gblCode = null;
			gblObjName = null;
			gblFlag = null;
        }
    }
	
}
/* 베스트 상품 추가/제거 함수 */

function writeAddContent(bid,bno){
	//var obj = document.getElementById("getCommentFrm");
	//obj.src = "/zzAppModule/design/common/comment.html?board_id=" + bid +  "&bnum=" + bno;
	/* utf-8 환경에서*/	
	ajaxRequest = new ajax.HttpRequest();
	request = ajaxRequest.getHttpRequest();
	ajaxRequest.setUserParam(bno);
	request.onreadystatechange = displayCommentSkin;
    request.open("POST", '/zzAppModule/design/common/comment.html', true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
    request.send("board_id=" + bid + "&bnum=" + bno);   
}
function displayCommentSkinHTML(){
	var obj = document.getElementById("addBoardWord" + ajaxRequest.getUserParam());
	if (request.readyState == 4) {
        if (request.status == 200) {
			var obj = document.getElementById("addBoardWord" + ajaxRequest.getUserParam());
			content = request.responseText;
			obj.innerHTML = content;

			request = null;
			ajaxRequest = null;
        } else {
            alert('처리중 오류가 발생했습니다');
			request = null;
			ajaxRequest = null;
        }
    }
}
function displayCommentSkin(){
	if (request.readyState == 4) {
        if (request.status == 200) {
			var obj = document.getElementById("addBoardWord" + ajaxRequest.getUserParam());
			content = request.responseText;
			obj.innerHTML = content;

			request = null;
			ajaxRequest = null;
        } else {
            alert('처리중 오류가 발생했습니다');
			request = null;
			ajaxRequest = null;
        }
    }
}

function chkBoardCommentForm(frm){


var access = frm.accessFlag.value;	
if (access == 'login') {
		alert('로그인후 이용가능합니다');
		return;
	} else if(access == 'priv') {
		alert('작성할 권한이 없습니다.');
		return;
} else {
	if(frm.wMode.value == ''){
		if (frm.com_content != null) {	
			if (frm.name.value == '') {
				alert('이름을 입력하세요');
				return;
			}	
		}
		if (frm.pwd.value == '') {
			alert('비밀번호를 입력하세요');
			return;
		}	
		if (frm.com_content != null) {	
			if (frm.com_content.value == '') {
				alert('내용을 입력하세요');
				return;
			}
		}
	} else {
		if (frm.com_content != null) {	
			if (frm.com_content.value == '') {
				alert('내용을 입력하세요');
				return;
			}
		}
	}
			
}

ajaxRequest = new ajax.HttpRequest();
request = ajaxRequest.getHttpRequest();
request.onreadystatechange = writeCommentOk;
request.open("POST", frm.act.value, true);
request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
request.send(setQueryString(frm));

return;

}
function writeCommentOk(){
	if (request.readyState == 4) {
        if (request.status == 200) {
			var obj = document.getElementById("addBoardWord" + ajaxRequest.getUserParam());
			var result = request.responseText;
			request = null;
			ajaxRequest = null;
			if(result == '99'){
				alert('비밀번호가 일치하지 않습니다');
				return;
			}else{
				if(result != ''){
					var temp = new Array();
					temp = result.split(':');
					writeAddContent(temp[0],temp[1]);
					modData = 0;
					delData = 0;
					imsiText = '';
					alert(result);
					document.location.reload();
				}else{
					alert('처리중 오류가 발생했습니다');
				}
			}
        } else {
            alert('처리중 오류가 발생했습니다');
			request = null;
			ajaxRequest = null;
        }
    }
}

function setQueryString(frm)
{
  var queryString = "";
  var numberElements = frm.elements.length;
  for(var i = 0; i < numberElements; i++){
    input = frm.elements[i];
    if(i < numberElements - 1){
      queryString += input.name + "=" + encodeURIComponent(input.value) + "&";
    }else{
      queryString += input.name + "=" + encodeURIComponent(input.value);
    }
  }
  return queryString;
}
function commentDelete(bid,bnum,no,wmode,delMode){
	if(delData == 1){
		alert('삭제처리중인 데이터가 있습니다. 처리후 이용하여 주시기 바랍니다.');
		return;
	}
	if(modData == 1){
		alert('수정중인 데이터가 있습니다. 확인후 수정하여 주시기 바랍니다.');
		return;
	}
	
	var objTD = document.getElementById("comContent" + no);
	var objBtn = document.getElementById("btnDel" + no);
	var deleteFrm = document.getElementById("deleteFrm");
	var frm = document.getElementById("_commentDelF");

if(delMode == '1'){
		if(confirm('데이터를 삭제하시겠습니까?')){
			var wFrm = document._commentDelF;
			wFrm.ref_board.value = bid;
			wFrm.ref_no.value = bnum;
			wFrm.pmode.value = "del";
			wFrm.wMode.value = wmode;
			wFrm.pno.value = no;
			delData = 1;
			if(ajaxRequest != null) ajaxRequest = null;
			ajaxRequest = new ajax.HttpRequest();
//			if(request != null) request = null;

			request = ajaxRequest.getHttpRequest();
			request.onreadystatechange = writeCommentOk;
			request.open("POST", wFrm.act.value, true);
			request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			request.send(setQueryString(wFrm));
			
			return;
		}
		
	}else{
		imsiText = objBtn.innerHTML;
		//objTD.style.background='#DFDFDF';
		objTD.innerHTML = deleteFrm.innerHTML;
		objBtn.innerHTML = "<a href=\"javascript:commentDeleteCancel('" + bid +"','" + bnum + "','" + no + "','" + wmode + "');\" class='Cdelete'>취소</a>";	
		imsiContent = deleteFrm.innerHTML;
		deleteFrm.innerHTML = '';
		var wFrm = document._commentDelF;
		wFrm.ref_board.value = bid;
		wFrm.ref_no.value = bnum;
		wFrm.wMode.value = wmode;
		wFrm.pmode.value = "del";
		wFrm.pno.value = no;
		delData = 1;
	}
}
function commentModify(bid,bnum,no){
		

	if(delData == 1){
		alert('삭제처리중인 데이터가 있습니다. 처리후 이용하여 주시기 바랍니다.');
		return;
	}
	if(modData == 1){
		alert('수정중인 데이터가 있습니다. 확인후 수정하여 주시기 바랍니다.');
		return;
	}
	
	
	var objTD = document.getElementById("comContent" + no);
	var objBtn = document.getElementById("btnMod" + no);
	var writeFrm = document.getElementById("writeFrm");
	var frm = document.getElementById("_commentModF");
	var objName = document.getElementById("dataName" + no);
	var objContent = document.getElementById("dataContent" + no);

	
	imsiText = objBtn.innerHTML;
	objTD.innerHTML = writeFrm.innerHTML;
	objBtn.innerHTML = "<a href=\"javascript:commentModifyCancel('" + bid +"','" + bnum + "','" + no + "');\" class='Cmodify'>취소</a>";	
	imsiContent = writeFrm.innerHTML;
	writeFrm.innerHTML = '';

	var wFrm = document._commentModF;

	wFrm.name.value = objName.innerHTML;
	//wFrm.content.value = replace(objContent.innerHTML,"<BR>",'\r\n');
	wFrm.com_content.value = replace(objContent.innerHTML,"<br>",'');
	wFrm.ref_board.value = bid;
	wFrm.ref_no.value = bnum;
	wFrm.pmode.value = "mod";
	wFrm.pno.value = no;
	modData = 1;
	
}
function commentDeleteCancel(bid,bnum,no,wmode){
	var objTD = document.getElementById("comContent" + no);
	var objBtn = document.getElementById("btnDel" + no);
	var deleteFrm = document.getElementById("deleteFrm");
	var frm = document.getElementById("_commentDelF");
	var objContent = document.getElementById("dataContent" + no);

	objBtn.innerHTML = imsiText;
	alert(objBtn.innerHTML);
	//objTD.style.background='#FFFFFF';
	objTD.innerHTML = '';
	deleteFrm.innerHTML = imsiContent;
	imsiContent = '';
	imsiText = '';
	delData = 0;
}
function commentModifyCancel(bid,bnum,no){
	var objTD = document.getElementById("comContent" + no);
	var objBtn = document.getElementById("btnMod" + no);
	var writeFrm = document.getElementById("writeFrm");
	var frm = document.getElementById("_commentModF");
	var objName = document.getElementById("dataName" + no);
	var objContent = document.getElementById("dataContent" + no);
	

	objBtn.innerHTML = imsiText;	
	//objTD.style.background='#FFFFFF';
	writeFrm.innerHTML = imsiContent;
	objTD.innerHTML = '';

	imsiContent = '';
	imsiText = '';
	modData = 0;

}
function replace(str,s,d){
	for(i=0;i<str.length;i++){
		str = str.replace(s,d);
	}
	return str;
}


/* 아이디 / 비밀번호 찾기 */
function findIdPwd(flag){
	var frm = document.writeF;
	if(flag == 'id'){
		if(!chkInputType(frm,'name1','이름을',0,'')) return;
		frm.find_name.value = frm.name1.value;

		if(frm.jumin1 != null) {
		if(!chkInputType(frm,'jumin1','주민등록번호를',0,'')) return;
			frm.find_jumin.value = frm.jumin1.value;
		}
		
		if(frm.email1 != null) {
			if(!chkInputType(frm,'email1','이메일주소를',0,'')) return;
			frm.find_email.value = frm.email1.value;
		}		
	}else if(flag == 'pwd'){
		if(frm.id2 != null){
			if(!chkInputType(frm,'id2','아이디를',0,'')) return;
			frm.find_id.value = frm.id2.value;
		}
		if(frm.name2 != null)	{
			if(!chkInputType(frm,'name2','이름을',0,'')) return;
			frm.find_name.value = frm.name2.value;
		}
		if(frm.jumin2 != null){
			if(!chkInputType(frm,'jumin2','주민등록번호를',0,'')) return;
			frm.find_jumin.value = frm.jumin2.value;
		}
		if(frm.email2 != null) {
			if(!chkInputType(frm,'email2','이메일주소를',0,'')) return;
			frm.find_email.value = frm.email2.value;
		}		
	}
	frm.find_mode.value = flag;
	frm.submit();
}
/* 우편번호 검색하기 */
function searchZipCode(field){
	var win = window.open('/zzAppModule/common/zipcode.php?field=' + field,'zipcode','width=440,height=520,scrollbars=no,left=200,top=100');
	win.focus();
}
/* 아이디 중복검사 */
function checkIdUnique(field){
	var obj = document.getElementById(field);
	if(obj.value == ""){
		alert('아이디를 입력하세요.');
		obj.focus();
		return;
	}
	var win = window.open('/zzAppModule/common/id_chk.php?sid=' + obj.value + '&field=' + field,'id_chk','width=440,height=300,scrollbars=no,left=200,top=100');
	win.focus();
}
function openCalendar(objName){
	var frm = window.open('/zzAppModule/common/calendar.php?objName=' + objName,'calendar','width=300,height=250,scrollbars=no,left=200,top=100');
}
function openCalendarParam(objName){
	var frm = window.open('/zzAppModule/common/calendar.php?objName=' + objName + "&param=y",'calendar','width=300,height=250,scrollbars=no,left=200,top=100');
}
function chkAnswerBoard(){
	var frm = document.writeF;
	if(!chkInputType(frm,'answer_text','답변을',0,'')) return false;
}
function chkLoginFormB(flag){
	var frm = document.writeF;
	if(flag == 'mem'){
		if(!chkInputType(frm,'id','아이디를',0,'')) return;
		if(!chkInputType(frm,'pwd','비밀번호를',0,'')) return;
		frm.submit();
	}else if(flag == 'non'){
		if(!chkInputType(frm,'name','주문자명을',0,'')) return;
		if(!chkInputType(frm,'tel','전화번호를',0,'')) return;
		frm.action = "/zzAppModule/process/none_login.php";
		frm.submit();
	}
}
function chkTopLoginFrm(frm){
	if(!chkInputType(frm,'mid','아이디를',0,'')) return false;
	if(!chkInputType(frm,'mpwd','비밀번호를',0,'')) return false;
}
function sendShopTrace(company,number){
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
	}
}

function chkMemberFormNO(frm){
	var chkMode = frm.mem_mode.value;
	if(chkMode == 'mem_agree'){
		var agreeObj = frm.agreement;
		var privacyObj = frm.privacy;

		if(agreeObj != ''){
			if(agreeObj.checked == false){
				alert('회원 약관에 동의하셔야 합니다.');
				agreeObj.focus();
				return false;
			}
		}
		if(privacyObj != ''){
			if(privacyObj.checked == false){
				alert('개인보호 정책에 동의하셔야 합니다.');
				privacyObj.focus();
				return false;
			}
		}

		if(frm.name.value == ''){
				alert('이름을 입력하셔야 합니다.');
				frm.name.focus();
				return false;
			}
/*
		if(frm.chk_auth_name.value == ""){
			alert('실명인증을 하지 않았습니다. 실명 인증후 이용하여 주시기 바랍니다.');
			frm.name.focus();
			return false;
		}
*/
		frm.mem_mode.value = 'mem_reg';
	}else{		
		try{
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		}catch(e){
			oEditors = null;
		}
		var objDiv = createDebugWindow('debugDiv');
		var success = false;
		for(i = 0; i < frm.elements.length; i++){
			var tObj = frm.elements[i];
			var in_mode = tObj.getAttribute("in_mode");
			if(in_mode != undefined){	
				
				if(in_mode == 'y'){	
					success = false;			
					var in_type = tObj.getAttribute("in_type");
					var id = tObj.getAttribute("id");
					var in_ttl = tObj.getAttribute("in_ttl");

					if(in_type == '02'){
							if(!chkInputType(frm,id, in_ttl + '을(를)',1,'rdo')) break;
							else success = true;
					}else if(in_type == '03' || in_type == '13'){			
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
					}else if(in_type == '04' || in_type == '05'){
						flag = id.substring(id.length -1);
						if(flag == '1'){
							if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
							else success = true;
						}else{
							if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
							else success = true;
						}
					}else if(in_type == '06'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
					}else if(in_type == '07'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
						if(frm.id_chk.value == ''){
							alert('아이디 중복 확인을 하지 않았습니다.');
							success = false;
							break;
						}else{
							success = true;
						}
					}else if(in_type == '08'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
						else success = true;
					}else if(in_type == '11'){

						if (oEditor){
							var editContents = oEditor.EditorDocument.body.innerText; 
							if(editContents.split(" ").join("") == ""){ 
								alert("내용을 입력하세요."); 
								oEditor.EditorDocument.body.focus(); 
								break;
							 }else success = true;
						}
					}else if(in_type == '12'){
						//if(frm.elements[i].in_lng == '1'){
							if(!chkInputType(frm,id, in_ttl + '을(를)',1,'chk')) break;
							else success = true;
						//}
					}else{		
						if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
						else success = true;
					}
				}
			}
		}
		if(success){
			if(!compareValue(frm.pwd,frm.pwd_ok,'비밀번호가 일치하지 않습니다')){
				return false;
			}
			if(frm.mem_mode.value == 'mem_mod'){
				mess = '수정 하시겠습니까?';
			}else{
				mess = '가입 하시겠습니까?';
			}
			if(confirm(mess)){
				if(frm.mem_mode.value != 'mem_mod'){
					frm.mem_mode.value = "mem_reg";
				}
				frm.action = "/zzAppModule/process/member_ok.php";
				createProcessDIv();
				return true;
			}else{
				return false;
			}
		}
		return success;
		}

}




function chkMemberFormFlag(flag){
	var frm = document.writeF;
	var chkMode = frm.mem_mode.value;
	
	if(chkMode == 'mem_agree'){
		var agreeObj = frm.agreement;
		var privacyObj = frm.privacy;	

		if(agreeObj != ''){
			if(agreeObj.checked == false){
				alert('회원 약관에 동의하셔야 합니다.');
				agreeObj.focus();
				return false;
			}
		}
		if(privacyObj != ''){
			if(privacyObj.checked == false){
				alert('개인보호 정책에 동의하셔야 합니다.');
				privacyObj.focus();
				return false;
			}
		}

		if(frm.name.value == ''){
				alert('이름을 입력하셔야 합니다.');
				frm.name.focus();
				return false;
			}
		if(flag == '01'){
			frm.memFlag.value = 1;
		}else if(flag == '02'){
			frm.memFlag.value = 3;
		}
		frm.mem_mode.value = 'mem_reg';
		
	}else{		
		try{
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		}catch(e){
			oEditors = null;
		}
		var objDiv = createDebugWindow('debugDiv');
		var success = false;
		for(i = 0; i < frm.elements.length; i++){
			var tObj = frm.elements[i];
			var in_mode = tObj.getAttribute("in_mode");
			if(in_mode != undefined){	
				
				if(in_mode == 'y'){	
					success = false;			
					var in_type = tObj.getAttribute("in_type");
					var id = tObj.getAttribute("id");
					var in_ttl = tObj.getAttribute("in_ttl");

					if(in_type == '02'){
							if(!chkInputType(frm,id, in_ttl + '을(를)',1,'rdo')) break;
							else success = true;
					}else if(in_type == '03' || in_type == '13'){			
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
					}else if(in_type == '04' || in_type == '05'){
						flag = id.substring(id.length -1);
						if(flag == '1'){
							if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
							else success = true;
						}else{
							if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
							else success = true;
						}
					}else if(in_type == '06'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
					}else if(in_type == '07'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',1,'')) break;
						else success = true;
						if(frm.id_chk.value == ''){
							alert('아이디 중복 확인을 하지 않았습니다.');
							success = false;
							break;
						}else{
							success = true;
						}
					}else if(in_type == '08'){
						if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
						else success = true;
					}else if(in_type == '11'){

						if (oEditor){
							var editContents = oEditor.EditorDocument.body.innerText; 
							if(editContents.split(" ").join("") == ""){ 
								alert("내용을 입력하세요."); 
								oEditor.EditorDocument.body.focus(); 
								break;
							 }else success = true;
						}
					}else if(in_type == '12'){
						//if(frm.elements[i].in_lng == '1'){
							if(!chkInputType(frm,id, in_ttl + '을(를)',1,'chk')) break;
							else success = true;
						//}
					}else{		
						if(!chkInputType(frm,id, in_ttl + '을(를)',0,'')) break;
						else success = true;
					}
				}
			}
		}
		
		if(success){
			if(!compareValue(frm.pwd,frm.pwd_ok,'비밀번호가 일치하지 않습니다')){
				return false;
			}
			if(frm.mem_mode.value == 'mem_mod'){
				mess = '수정 하시겠습니까?';
			}else{
				mess = '가입 하시겠습니까?';
			}
			if(confirm(mess)){
				if(frm.mem_mode.value != 'mem_mod'){
					frm.mem_mode.value = "mem_reg";
				}
				frm.action = "/zzAppModule/process/member_ok.php";
				createProcessDIv();
				frm.submit();
				return true;
			}else{
				
				return false;
			}
		}
		return success;
		}
	
	frm.submit();
		
}