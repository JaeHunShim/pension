/*
###########################################################################
##### 폼 체크 스크립트
###########################################################################
### Writer		: ZZDRAGON
###	Version		: 1.0
### Write day : 2006년 01월 10일
###########################################################################
### 함수명 : chkInputType()	:: 폼 체크 스크립트
### Parameter List
    1. frm	=> 폼 객체
    2. name	=> INPUT 객체명
    3. txt	=> User에게 보여줄 문구
    4. flag	=> 입력(0)/(1)선택 문구 선택
    5. type	=> INPUT TYPE (Default : text :: textarea,selectbox 동일 처리)
       [ipt : text , rdo : radio, chk : checkbox]
### [사용 예제]
    1. if(!chkInputType(frm,'name','이름을',0,'')) return false;  :: text,textarea,selectbox 사용시
    2. if(!chkInputType(frm,'service','체크박스를',1,'chk')) return false;	:: checkbox, radio 사용시
###########################################################################
*/
function chkInputType(frm,name,txt,flag,type){
  var obj = document.getElementsByName(name);
  if(obj[0] == null) return true;
  msg = '';
  switch (flag){
    case 0:
      msg = '입력';
    break;
    case 1:
      msg = '선택';
    break;
  }  
  if(type == '') type = 'ipt';
  switch(type){
    case 'ipt':
      if(eval("frm." +  name + ".value==''")){
        alert(txt + ' ' + msg + "하세요.");
        eval("frm." + name + ".focus()");
        return false;
      }
    break;
    case 'rdo':
    case 'chk':

	  lng = eval("frm." +  name + ".length");    
      
      chking = 0;
	  for(_i = 0; _i < lng; _i++){
        if(eval("frm." +  name + "[" + _i + "].checked == true")){
          chking = 1;
        }
      }

      if(chking == 0){
        alert(txt + ' ' + msg + "하세요.");
        eval("frm." + name + "[0].focus()");
        return false;
      }
    break;
  }   
  return true;
}

function compareValue(ipt1,ipt2,mess){
  if(ipt1.value == ipt2.value) {
    return true;
  } else{
    alert(mess);
    ipt2.select();
    ipt2.focus();
    return false;
  }
}
/*
###########################################################################
### 함수명 : NumCheck() :: 정수값 체크 스크립트
### Parameter List
    1. frm		=> input 객체 
    2. strArg => input value 값
### [사용 예제]
    1. <input type="text" name="number" onBlur="javascript:NumCheck(this,this.value)">
###########################################################################
*/
function NumCheck(frm,strArg){
  var num ="0123456789.";
  for (var i=0; i<frm.value.length; i++){
    if(-1 == num.indexOf(frm.value.charAt(i))){
      alert("숫자만 입력가능합니다!");
      frm.value = '';
      frm.focus();
      return;
    }
  }
}
/*
###########################################################################
### 함수명 : chkResultJumin(),serialCheck() :: 유효 주민번호 체크 스크립트
### Parameter List 2
    1. jfrm1		=> 주민번호 객체1
    2. jfrm2		=> 주민번호 객체2
### Parameter List 2
    1. jumin1		=> 주민번호 앞자리
    2. jumin2 	=> 주민번호 뒷자리
### [사용 예제]
    1. chkResultJumin(폼이름.jumin1,폼이름.jumin2)
### [사용 예제]
    1. serialCheck(폼이름.jumin1.value,폼이름.jumin2.value)        
###########################################################################
*/
function chkResultJumin(obj01,obj02){
  var jfrm1 = document.getElementById(obj01);
  var jfrm2 = document.getElementById(obj02);
  if(!serialCheck(jfrm1.value,jfrm2.value)){
    alert('유효한 주민등록번호가 아닙니다.');
    jfrm1.select();
    jfrm1.focus();
    return false;
  }
  return true;
}
function serialCheck(jumin1,jumin2){ 
	if (jumin1.length != 6 || jumin2.length !=7){ 
		return false;
	}else{ 
		var str_serial1 = jumin1; 
		var str_serial2 = jumin2;
		var digit = 0; 
		for (var i=0;i<str_serial1.length;i++){ 
			var str_dig=str_serial1.substring(i,i+1); 
			if (str_dig<'0' || str_dig>'9'){ 
				digit=digit+1; 
			} 
		} 
		if ((str_serial1 == '') || ( digit != 0 )){ 
			return false;   
		} 
		var digit1=0 
   for (var i=0;i<str_serial2.length;i++){ 
    var str_dig1=str_serial2.substring(i,i+1); 
    if (str_dig1<'0' || str_dig1>'9'){ 
     digit1=digit1+1 
     } 
   } 
   if ((str_serial2 == '') || ( digit1 != 0 )){ 
    return false;   
   } 
   if (str_serial1.substring(2,3) > 1){ 
    return false;   
   } 
   if (str_serial1.substring(4,5) > 3){ 
    return false;   
   } 
   if (str_serial2.substring(0,1) > 4 || str_serial2.substring(0,1) == 0){ 
    return false;   
   } 
   var a1=str_serial1.substring(0,1); 
		var a2=str_serial1.substring(1,2);
		var a3=str_serial1.substring(2,3); 
		var a4=str_serial1.substring(3,4); 
		var a5=str_serial1.substring(4,5); 
		var a6=str_serial1.substring(5,6); 
		var check_digit=a1*2+a2*3+a3*4+a4*5+a5*6+a6*7; 
		var b1=str_serial2.substring(0,1); 
		var b2=str_serial2.substring(1,2); 
		var b3=str_serial2.substring(2,3); 
		var b4=str_serial2.substring(3,4); 
		var b5=str_serial2.substring(4,5); 
		var b6=str_serial2.substring(5,6); 
		var b7=str_serial2.substring(6,7); 
		var check_digit=check_digit+b1*8+b2*9+b3*2+b4*3+b5*4+b6*5; 
		check_digit = check_digit%11; 
		check_digit = 11 - check_digit; 
		check_digit = check_digit%10; 
		if (check_digit != b7){ 
			return false;   
		}else{ 
			return true;
		} 
	} 
}

/*
###########################################################################
### 함수명 : chkEmail() :: 이메일 유효성 스크립트
### Parameter List
    1. val		=> input 객체 
### [사용 예제]
    1. chkEmail(frm.email)
###########################################################################
*/
function chkEmail(frm) {
 var user_email = frm.value; 
 var len = user_email.length;
 if(user_email){
  if(user_email.indexOf("@") < 0 || user_email.indexOf(".") < 0){
   alert("잘못된 이메일 입니다.");
   frm.value="";
   frm.focus();
   return false; 
  }else{
   /* 이메일 거부주소 사용시 */
   email_address = user_email.split('@');    
   if(!rejectEmail(email_address[1])){     
     alert('사용할수 없는 이메일주소입니다.');
      frm.value = "";
      frm.focus();
      return false;
   }
   /* 이메일 거부주소 사용시 */
   return true;
  }
 }
}
function rejectEmail(val){
  var _EmailList = new Array();
  _EmailList[0] = "daum.net";
  _EmailList[1] = "hanmail.net";
  val = val.toLowerCase();  
  for(i = 0; i < _EmailList.length; i++){
    if(val == _EmailList[i]){      
      return false;
    }
  }  
  return true;
}
/*
###########################################################################
*/

function selectBirth(frm,jumin1,birth_y,birth_m,birth_d){
 val = frm.jumin1.value;
 
 if(val.length < 6){    
    return false;
 }
 f_num = val.substring(0,2);
 f_sex = val.substring(0,1);
	
 frm.birth_y.value = "19" + f_num;
 frm.birth_m.value = val.substring(2,4);	
 frm.birth_d.value = val.substring(4,6); 
}

function chkID(frm,url,option){
  if(frm.value == ''){
    alert('아이디를 입력하세요.');
    frm.focus();
    return;
  }
  
  window.open(url + "?sid=" + frm.value,'id',option);
}

function regConfirm(msg){
	if(!confirm(msg)){
		return false;
	}
	return true;
}
var preFlag = '';
function viewContentFaq(objName,flag){
	var obj = document.getElementById(objName + flag);
	

	if(preFlag != ''){
		var objPre = document.getElementById(objName + preFlag);
		if(objPre != null) objPre.style.display = 'none';
			
	}
	
	preFlag = flag;
	obj.style.display = 'table-row';
	objTitle.style.fontWeight = 'bold';
	objTitle.style.color = '#000000';
	
}
function downFile(file,rfile){
	window.document.location.href="/zzAppModule/config/function/download.php?file=" + file + "&rfile=" + rfile;
}
function displayFlash(url,width,height)
{
document.write("<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' width='" + width + "' height='" + height + "' id='m_menu' align='middle'>");
document.write("<param name='allowScriptAccess' value='sameDomain' />");
document.write("<param name='movie' value='" + url + "' />");
document.write("<param name='wmode' value='transparent' />");
document.write("<param name='quality' value='high' />");
document.write("<param name='bgcolor' value='#87b76a' />");
document.write("<embed src='" + url + "' quality='high' bgcolor='#87b76a' width='" + width + "' height='" + height + "' name='m_menu' align='middle' allowScriptAccess='sameDomain' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' /></object>");	
}
function createProcessDIv(){
	var divObj = document.createElement("div");
	divObj.style.width = "100%";
	divObj.style.height = "100%";
	divObj.style.left = 0;
	divObj.style.top = document.documentElement.scrollTop;
	divObj.style.background = "#DEDEDE";
	divObj.style.position = "absolute";
	divObj.style.filter = "alpha(opacity=70)";
	divObj.style.zindex = "9999999";
	divObj.innerHTML = "<table border='0' width='100%' height='100%'><tr><td align='center' valign='middle'><span style='color:red;font-size:20px;'>처리중 입니다</font></td></tr></table>";
	this.document.body.appendChild(divObj);
}

var zoomImgTimer = null;
function zoomBoardPhoto(src,url,gdUseing){
	if(document.getElementById('baseImage') == undefined || document.getElementById('baseImage') == null){
		var canvasImg = window.document.createElement("div");
		var divImg = window.document.createElement("div");
		var divObj = document.createElement("div");
		var imgWidth = this.document.body.clientWidth-50;
		var imgHeight = this.document.body.clientHeight-50;

		canvasImg.id = "canvas";
		canvasImg.style.width="100%";
		canvasImg.style.height="100%";
		canvasImg.style.position = "absolute";
		//canvasImg.style.zIndex = 9999;
		divObj.style.filter = "none";

		divObj.id = 'baseImage';
		divObj.style.width = "100%";
		divObj.style.height = "100%";
		divObj.style.left = 0;
		//divObj.style.top = document.documentElement.scrollTop;
		divObj.style.background = "#000000";
		divObj.style.position = "absolute";
		divObj.style.filter = "alpha(opacity=90)";
		divObj.style.zIndex = 1;
		divObj.innerHTML = '';
		//this.document.body.appendChild(divObj);
		divImg.id='zoomImg';
		divImg.style.width = "100%";
		divImg.style.height = "100%";
		divImg.style.position = "absolute";
		divImg.style.zIndex = 9999999999;
		divImg.style.filter = "alpha(opacity=100)";
		//divObj.style.top = document.documentElement.scrollTop;
		//divImg.style.border="1 solid #FF0000";
		if(gdUseing == 'y'){
		   var imgSource = "/zzAppModule/config/function/image_display.php?w=700&h=500&img=" + src;
		}else{			
		   var imgSource = url + "/" + src;
		}
		divImg.innerHTML = "<table border='0' cellpadding='0' cellspacing='0' width='100%' height='100%'><td align='center' valign='middle'><div style='border:0 solid #FFFFFF;width:" + imgWidth + "px;height:" + imgHeight + "px;overflow:auto;display:table-cell;vertical-align:middle;'><table border='0' cellpadding='0' cellspacing='0' width='100%' height='100%'><tr><td align='center' valign='middle'><img src='" + imgSource + "' onClick=\"javascript:zoomBoardClose();\" style='cursor:hand'></td></tr></table></div></td></table>";
		this.document.body.appendChild(canvasImg);		
		this.document.getElementById('canvas').appendChild(divObj);
		this.document.getElementById('canvas').appendChild(divImg);
		//document.getElementById('canvas').innerHTML = document.getElementById('canvas').innerHTML + divImg.innerHTML;
		//document.getElementById('baseImage').innerHTML = divImg.innerHTML;
		//this.document.body.appendChild(divImg);
		this.document.body.scrolling = "no";
		zoomImgTimer = setInterval("chkZoomPosition()",1);
	}
}
function zoomBoardPhotoPop(src,url,gdUseing){
	var zoomImg = window.open('/zzAppModule/common/zoomImg.php?src=' + src,'zoomImg','width=300,height=300');
	zoomImg.focus();
	return;
	if(document.getElementById('baseImage') == undefined || document.getElementById('baseImage') == null){
		var canvasImg = window.document.createElement("div");
		var divImg = window.document.createElement("div");
		var divObj = document.createElement("div");
		var imgWidth = this.document.body.clientWidth-50;
		var imgHeight = this.document.body.clientHeight-50;

		canvasImg.id = "canvas";
		canvasImg.style.width="100%";
		canvasImg.style.height="100%";
		canvasImg.style.position = "absolute";
		//canvasImg.style.zIndex = 9999;
		divObj.style.filter = "none";

		divObj.id = 'baseImage';
		divObj.style.width = "100%";
		divObj.style.height = "100%";
		divObj.style.left = 0;
		//divObj.style.top = document.documentElement.scrollTop;
		divObj.style.background = "#000000";
		divObj.style.position = "absolute";
		divObj.style.filter = "alpha(opacity=80)";
		divObj.style.zIndex = 1;
		divObj.innerHTML = '';
		//this.document.body.appendChild(divObj);
		divImg.id='zoomImg';
		divImg.style.width = "100%";
		divImg.style.height = "100%";
		divImg.style.position = "absolute";
		divImg.style.zIndex = 9999999999;
		divImg.style.filter = "alpha(opacity=100)";
		//divObj.style.top = document.documentElement.scrollTop;
		//divImg.style.border="1 solid #FF0000";
		if(gdUseing == 'y'){
		   var imgSource = "/zzAppModule/config/function/image_display.php?w=700&h=500&img=" + src;
		}else{			
		   var imgSource = url + "/" + src;
		}
		divImg.innerHTML = "<table border='0' cellpadding='0' cellspacing='0' width='100%' height='100%'><td align='center' valign='middle'><div style='border:0 solid #FFFFFF;width:" + imgWidth + "px;height:" + imgHeight + "px;overflow:auto;display:table-cell;vertical-align:middle;'><table border='0' cellpadding='0' cellspacing='0' width='100%' height='100%'><tr><td align='center' valign='middle'><img src='" + imgSource + "' onClick=\"javascript:zoomBoardClose();\" style='cursor:hand'></td></tr></table></div></td></table>";
		window.document.body.appendChild(canvasImg);		
		window.document.getElementById('canvas').appendChild(divObj);
		window.document.getElementById('canvas').appendChild(divImg);
		//document.getElementById('canvas').innerHTML = document.getElementById('canvas').innerHTML + divImg.innerHTML;
		//document.getElementById('baseImage').innerHTML = divImg.innerHTML;
		//this.document.body.appendChild(divImg);
		window.document.body.scrolling = "no";
		zoomImgTimer = setInterval("chkZoomPosition()",1);
	}
}

function zoomPhoto(src,url,gdUseing){
	var zoomImg = window.open('/zzAppModule/common/zoomImgBoard.php?src=' + src,'zoomImg','width=300,height=300,scrollbars=yes');
	zoomImg.focus();
	return;	
}

function zoomBoardPrintPop(src,url,gdUseing){
	var zoomImg = window.open('/zzAppModule/common/zoomImgPrint.php?src=' + src,'zoomImg','width=300,height=300');
	zoomImg.focus();
	return;
	if(document.getElementById('baseImage') == undefined || document.getElementById('baseImage') == null){
		var canvasImg = window.document.createElement("div");
		var divImg = window.document.createElement("div");
		var divObj = document.createElement("div");
		var imgWidth = this.document.body.clientWidth-50;
		var imgHeight = this.document.body.clientHeight-50;

		canvasImg.id = "canvas";
		canvasImg.style.width="100%";
		canvasImg.style.height="100%";
		canvasImg.style.position = "absolute";
		//canvasImg.style.zIndex = 9999;
		divObj.style.filter = "none";

		divObj.id = 'baseImage';
		divObj.style.width = "100%";
		divObj.style.height = "100%";
		divObj.style.left = 0;
		//divObj.style.top = document.documentElement.scrollTop;
		divObj.style.background = "#000000";
		divObj.style.position = "absolute";
		divObj.style.filter = "alpha(opacity=80)";
		divObj.style.zIndex = 1;
		divObj.innerHTML = '';
		//this.document.body.appendChild(divObj);
		divImg.id='zoomImg';
		divImg.style.width = "100%";
		divImg.style.height = "100%";
		divImg.style.position = "absolute";
		divImg.style.zIndex = 9999999999;
		divImg.style.filter = "alpha(opacity=100)";
		//divObj.style.top = document.documentElement.scrollTop;
		//divImg.style.border="1 solid #FF0000";
		if(gdUseing == 'y'){
		   var imgSource = "/zzAppModule/config/function/image_display.php?w=700&h=500&img=" + src;
		}else{			
		   var imgSource = url + "/" + src;
		}
		divImg.innerHTML = "<table border='0' cellpadding='0' cellspacing='0' width='100%' height='100%'><td align='center' valign='middle'><div style='border:0 solid #FFFFFF;width:" + imgWidth + "px;height:" + imgHeight + "px;overflow:auto;display:table-cell;vertical-align:middle;'><table border='0' cellpadding='0' cellspacing='0' width='100%' height='100%'><tr><td align='center' valign='middle'><img src='" + imgSource + "' onClick=\"javascript:zoomBoardClose();\" style='cursor:hand'></td></tr></table></div></td></table>";
		window.document.body.appendChild(canvasImg);		
		window.document.getElementById('canvas').appendChild(divObj);
		window.document.getElementById('canvas').appendChild(divImg);
		//document.getElementById('canvas').innerHTML = document.getElementById('canvas').innerHTML + divImg.innerHTML;
		//document.getElementById('baseImage').innerHTML = divImg.innerHTML;
		//this.document.body.appendChild(divImg);
		window.document.body.scrolling = "no";
		zoomImgTimer = setInterval("chkZoomPosition()",1);
	}
}


function chkZoomPosition(){
	var obj01 = 	document.getElementById('canvas');
	obj01.style.top = document.documentElement.scrollTop;
}
function zoomBoardClose(){
	var obj01 = 	document.getElementById('canvas');
	this.document.body.removeChild(obj01);
	clearInterval(zoomImgTimer);
}
function viewAttachFile(no){
	var obj = document.getElementById("attachFileDiv" + no);

	if(obj.style.display == 'none') obj.style.display = 'inline';
	else  obj.style.display = 'none';
}
function showHidePopupDiv(objName,cookName,cookValue) { //v2.0				
	var obj = document.getElementById(objName);
	if( getCookie(cookName) != cookValue) { 
		obj.style.display = "inline";
	}
}
function getCookie( name )
{
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie )
		{
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
				endOfCookie = document.cookie.length;
			return unescape( document.cookie.substring( y, endOfCookie ) );
		}
		x = document.cookie.indexOf( " ", x ) + 1;
		if ( x == 0 )
			break;
	}
	return "";
}
function setCookie( name, value, expiredays ){
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() +";" 
}
function moveDiv(){}
function mouseMove() { 
	if (move) { 
		dragObj.style.left = window.event.x - clickleft + "px";
		dragObj.style.top = window.event.y - clicktop  + "px";
	} 
} 
function mouseUp() { 
	move = 0 
} 
function mouseDown() { 
	if (drag) { 
		clicktop = window.event.y - parseInt(dragObj.style.top) 
		dragObj.style.zIndex += 1 
		clickleft = window.event.x - parseInt(dragObj.style.left) 
		move = 1 
	} 
} 	
function mouseStop() { 
	window.event.returnValue = false 
} 
function displayFlash(url,width,height)
{

document.write("<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' width='" + width + "' height='" + height + "' id='m_menu' align='middle'>");
document.write("<param name='allowScriptAccess' value='sameDomain' />");
document.write("<param name='movie' value='" + url + "' />");
document.write("<param name='wmode' value='transparent' />");
document.write("<param name='quality' value='high' />");
document.write("<param name='bgcolor' value='#87b76a' />");
document.write("<embed src='" + url + "' quality='high' bgcolor='#87b76a' width='" + width + "' height='" + height + "' name='m_menu' align='middle' allowScriptAccess='sameDomain' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' /></object>");
	
}
function getPopUpOpen(theURL,winName,features) { //v2.0
       window.onerror=null;
        // Browser Versionu
       var BV = parseInt(navigator.appVersion);

        // Browser Name§
        var BN = navigator.appName;
        // Browser Detecting
       var NS4 = (BN == "Netscape" && BV >= 4);
       var IE4 = (BN == "Microsoft Internet Explorer" && BV >= 4);
       var NS3 = (BN == "Netscape" && BV < 4);
       var IE3 = (BN == "Microsoft internet Explorer" && BV < 4);

       // Browser Swapping 
		// 익스플로러의 경우...
        if (IE4) { 
				   if(getCookie(winName) != 'no' ) { 
						try{
							var winFrm = window.open(theURL,winName,features);						
							winFrm.focus();
						}catch(e){
							alert('팝업이 차단 되어 있습니다.');
						}
				   }
        } else {
		// 넷스케이프의 경우...
         if (NS3 || NS4) {
					if( getCookie(winName) != 'no' ) { 
						try{
							window.open(theURL,winName,features);				
						}catch(e){
							alert('팝업이 차단 되어 있습니다.');
						}
					}
     		}               
	}
}
function closeWin(objName,flag){
	if(flag == '1'){
		var obj = document.getElementById(objName);

		if (obj.checked)
		{
			setCookie(objName, "no", 1); // 숫자 1 ==> 하루단위 0 ==> 무한대
		}
		self.close();
	}else{
		var obj = document.getElementById(objName);
		var obj_today = document.getElementById(objName + "_today");
		if (obj_today.checked)
		{
			setCookie(objName, "no", 1); // 숫자 1 ==> 하루단위 0 ==> 무한대
		}
		obj.style.display = 'none';
	}
}
function playNonMovie(url,width,height,auto){
  if(width == '') width = 320;
  if(height == '') height = 240;
  document.write("<OBJECT id='moviePlayer' classid='clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95' width='" + width + "' height='" + height + "'>");
  document.write("<PARAM NAME='Filename' VALUE='" + url + "'>");
  document.write("<param name='ClickToPlay' value='true'>");
  document.write("<param name='AutoSize' value='false'>");
  document.write("<param name='AutoStart' value='" + auto + "'>");
  document.write("<param name='ShowControls' value='false'>");
  document.write("<param name='ShowAudioControls' value='true'>");
  document.write("<param name='ShowDisplay' value='false'>");
  document.write("<param name='ShowTracker' value='false'>");
  document.write("<param name='ShowStatusBar' value='false'>");
  document.write("<param name='EnableContextMenu' value='false'>");
  document.write("<param name='ShowPositionControls' value='false'>");
  document.write("<param name='ShowCaptioning' value='false'>");
  document.write("<param name='AutoRewind' value='true'>");
  document.write("<param name='Enabled' value='true'>");
  document.write("<param name='EnablePositionControls' value='true'>");
  document.write("<param name='EnableTracker' value='true'>");
  document.write("<param name='PlayCount' value='1'>");
  document.write("<param name='SendWarningEvents' value='true'>");
  document.write("<param name='SendErrorEvents' value='true'>");
  document.write("<param name='SendKeyboardEvents' value='false'>");
  document.write("<param name='SendMouseClickEvents' value='false'>");
  document.write("<param name='SendMouseMoveEvents' value='false'>");
  document.write("<param name='ShowGotoBar' value='false'>");
  document.write("<param name='TransparentAtStart' value='false'>");
  document.write("<param name='Volume' value='0'>");
  document.write("</OBJECT>");
}
function playMovie(url,width,height){
  if(width == '') width = 320;
  if(height == '') height = 240;
  document.write("<OBJECT id='moviePlayer' classid='clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95' width='" + width + "' height='" + height + "'>");
  document.write("<PARAM NAME='Filename' VALUE='" + url + "'>");
  document.write("<param name='ClickToPlay' value='true'>");
  document.write("<param name='AutoSize' value='true'>");
  document.write("<param name='AutoStart' value='true'>");
  document.write("<param name='ShowControls' value='true'>");
  document.write("<param name='ShowAudioControls' value='true'>");
  document.write("<param name='ShowDisplay' value='false'>");
  document.write("<param name='ShowTracker' value='true'>");
  document.write("<param name='ShowStatusBar' value='false'>");
  document.write("<param name='EnableContextMenu' value='false'>");
  document.write("<param name='ShowPositionControls' value='false'>");
  document.write("<param name='ShowCaptioning' value='false'>");
  document.write("<param name='AutoRewind' value='true'>");
  document.write("<param name='Enabled' value='true'>");
  document.write("<param name='EnablePositionControls' value='true'>");
  document.write("<param name='EnableTracker' value='true'>");
  document.write("<param name='PlayCount' value='1'>");
  document.write("<param name='SendWarningEvents' value='true'>");
  document.write("<param name='SendErrorEvents' value='true'>");
  document.write("<param name='SendKeyboardEvents' value='false'>");
  document.write("<param name='SendMouseClickEvents' value='false'>");
  document.write("<param name='SendMouseMoveEvents' value='false'>");
  document.write("<param name='ShowGotoBar' value='false'>");
  document.write("<param name='TransparentAtStart' value='false'>");
  document.write("<param name='Volume' value='0'>");
  document.write("</OBJECT>");

}
function playMovieMode(url,width,height,auto){
  if(width == '') width = 320;
  if(height == '') height = 240;
  document.write("<OBJECT classid='clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95' width='" + width + "' height='" + height + "'>");
  document.write("<PARAM NAME='Filename' VALUE='" + url + "'>");
  document.write("<param name='ClickToPlay' value='true'>");
  document.write("<param name='AutoSize' value='false'>");
  document.write("<param name='AutoStart' value='" + auto + "'>");
  document.write("<param name='ShowControls' value='true'>");
  document.write("<param name='ShowAudioControls' value='true'>");
  document.write("<param name='ShowDisplay' value='false'>");
  document.write("<param name='ShowTracker' value='true'>");
  document.write("<param name='ShowStatusBar' value='false'>");
  document.write("<param name='EnableContextMenu' value='false'>");
  document.write("<param name='ShowPositionControls' value='false'>");
  document.write("<param name='ShowCaptioning' value='false'>");
  document.write("<param name='AutoRewind' value='true'>");
  document.write("<param name='Enabled' value='true'>");
  document.write("<param name='EnablePositionControls' value='true'>");
  document.write("<param name='EnableTracker' value='true'>");
  document.write("<param name='PlayCount' value='1'>");
  document.write("<param name='SendWarningEvents' value='true'>");
  document.write("<param name='SendErrorEvents' value='true'>");
  document.write("<param name='SendKeyboardEvents' value='false'>");
  document.write("<param name='SendMouseClickEvents' value='false'>");
  document.write("<param name='SendMouseMoveEvents' value='false'>");
  document.write("<param name='ShowGotoBar' value='false'>");
  document.write("<param name='TransparentAtStart' value='false'>");
  document.write("<param name='Volume' value='0'>");
  document.write("</OBJECT>");

}
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
