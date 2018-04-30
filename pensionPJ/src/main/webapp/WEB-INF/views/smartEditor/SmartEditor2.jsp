<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ë¤ì´ë² :: Smart Editor 2 &#8482;</title>
<script type="text/javascript" src="./js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<form action="sample/viewer/index.php" method="post">
	<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;"></textarea>
	<!--textarea name="ir1" id="ir1" rows="10" cols="100" style="width:100%; height:412px; min-width:610px; display:none;"></textarea-->
	<p>
		<input type="button" onclick="pasteHTML();" value="ë³¸ë¬¸ì ë´ì© ë£ê¸°" />
		<input type="button" onclick="showHTML();" value="ë³¸ë¬¸ ë´ì© ê°ì ¸ì¤ê¸°" />
		<input type="button" onclick="submitContents(this);" value="ìë²ë¡ ë´ì© ì ì¡" />
		<input type="button" onclick="setDefaultFont();" value="ê¸°ë³¸ í°í¸ ì§ì íê¸° (ê¶ì_24)" />
	</p>
</form>

<script type="text/javascript">
var oEditors = [];

// ì¶ê° ê¸ê¼´ ëª©ë¡
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// í´ë° ì¬ì© ì¬ë¶ (true:ì¬ì©/ false:ì¬ì©íì§ ìì)
		bUseVerticalResizer : true,		// ìë ¥ì°½ í¬ê¸° ì¡°ì ë° ì¬ì© ì¬ë¶ (true:ì¬ì©/ false:ì¬ì©íì§ ìì)
		bUseModeChanger : true,			// ëª¨ë í­(Editor | HTML | TEXT) ì¬ì© ì¬ë¶ (true:ì¬ì©/ false:ì¬ì©íì§ ìì)
		//bSkipXssFilter : true,		// client-side xss filter ë¬´ì ì¬ë¶ (true:ì¬ì©íì§ ìì / ê·¸ì¸:ì¬ì©)
		//aAdditionalFontList : aAdditionalFontSet,		// ì¶ê° ê¸ê¼´ ëª©ë¡
		fOnBeforeUnload : function(){
			//alert("ìë£!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//ìì  ì½ë
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["ë¡ë©ì´ ìë£ë íì ë³¸ë¬¸ì ì½ìëë textìëë¤."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>ì´ë¯¸ì§ë ê°ì ë°©ìì¼ë¡ ì½ìí©ëë¤.<\/span>";
	oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["ir1"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// ìëí°ì ë´ì©ì´ textareaì ì ì©ë©ëë¤.
	
	// ìëí°ì ë´ì©ì ëí ê° ê²ì¦ì ì´ê³³ìì document.getElementById("ir1").valueë¥¼ ì´ì©í´ì ì²ë¦¬íë©´ ë©ëë¤.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = 'ê¶ì';
	var nFontSize = 24;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>

</body>
</html>