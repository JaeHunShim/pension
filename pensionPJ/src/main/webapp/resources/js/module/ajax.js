var ajax = new Object();

ajax.HttpRequest = function(){
	var requestObj = false;
	var userParam = "";
}
ajax.HttpRequest.prototype = {
	getHttpRequest:function(){
		if (window.XMLHttpRequest) {
			requestObj = new XMLHttpRequest();
		}else if (window.ActiveXObject) {
			try {
			  requestObj = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e1) {
			  try {
				requestObj = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e2) {
			  }
			}
		}
		return requestObj;
	},
	setUserParam:function(userParam){
		this.userParam = userParam;
	},
	getUserParam:function(){
		return this.userParam;
	}
}
var ajaxRequest = null;

XML_CLASS = function(url,params,callback,method,keyword,auth){
	this.url = url;
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.keyword = keyword;
	this.search();
	this.authChk = auth;
}

XML_CLASS.prototype = {	
	
	getXMLHttpRequest: function(){
		if(window.ActiveXObject){
			try{
				return  new ActiveXObject("Msxml2.XMLHTTP");
			}catch(e){
				try{
					return  new ActiveXObject("Microsoft.XMLHTTP");
				}catch(e1){
					return null;
				}
			}
		}else if(window.XMLHttpRequest){
			return new XMLHttpRequest();
		}else{
			return null;
		}
	},
	search: function(){
		
		this.httpRequest = this.getXMLHttpRequest();
		
		var httpMethod =  this.method ? this.method : 'GET';
		if(httpMethod != 'GET' && httpMethod != 'POST'){
			httpMethod = 'GET';
		}
		var httpParams = (this.params == null || this.params == '') ? null : this.params;
		var httpURL = this.url;
		
		if(httpMethod == 'GET' && httpParams != null){
			httpURL = httpURL + "?" + httpParams;
		}
		this.httpRequest.open(httpMethod,httpURL,true);
		this.httpRequest.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		var Request = this;
		this.httpRequest.onreadystatechange = function(){			
			Request.onStateChange.call(Request);
		}
		
		this.httpRequest.send(httpMethod == 'POST' ? httpParams : null);				
	},
	onStateChange: function(){
		this.callback(this.httpRequest);
	}
}