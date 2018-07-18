<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/bootstrap-grid.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/bootstrap-reboot.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/resources/js/basic/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/resources/js/websocket/sockjs.min.js"></script>
<style>
      .box {
          width: 300px;
          float: left;
          margin: 0 20px 0 20px;
      }
      .box div, .box input {
          border: 1px solid;
          -moz-border-radius: 4px;
          border-radius: 4px;
          width: 100%;
          padding: 0px;
          margin: 5px;
      }
      .box div {
          border-color: grey;
          height: 300px;
          overflow: auto;
      }
      .box input {
          height: 30px;
      }
      h1 {
          margin-left: 30px;
      }
      body {
          background-color: #F0F0F0;
          font-family: "Arial";
      }
    </style>
<title>Insert title here</title>
</head>
<body>
</head><body lang="en">
    <h1>SockJS Express example</h1>

    <div id="first" class="box">
      <div></div>
      <form>
      	<input autocomplete="off" value=""></input>
      </form>
    </div>

    <script>
    	function msg(){
    		chat={}
    		chat.content  = $('#first input').val();
    		chat.user_id = '${login.user_id}';
    		 
    		sockjs.send(JSON.stringify(chat));
    	}
        var sockjs_url = '/chat';
        var sockjs = new SockJS(sockjs_url);
        $('#first input').focus();
        var div  = $('#first div');
        var inp  = $('#first input');
        var form = $('#first form');
        var print = function(m, p) {
            p = (p === undefined) ? '' : JSON.stringify(p);
            div.append($("<code>").text(m + ' ' + p));
            div.append($("<br>"));
            div.scrollTop(div.scrollTop()+10000);
        };
        sockjs.onopen   = function()  {print('[*] open', sockjs.protocol);};
        sockjs.onmessage = function(e) {print(e.data);};
        sockjs.onclose   = function()  {print('[*] close');};
        form.submit(function() {
           /*  print('[ ] sending', inp.val()); */
            msg();
            inp.val('');
            return false;
        });
    </script>

</body>
</html>