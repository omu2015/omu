<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>
<script type="text/javascript"	src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9"></script>

<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/layout2.css" rel="stylesheet" type="text/css" />
<link href="../../assets/css/map.css" rel="stylesheet" />


<HEAD>

<style type="text/css">

span.label {color:black;width:30;height:16;text-align:center;margin-top:0;background:#ffF;font:bold 30px Arial}
span.c1 {cursor:hand;color:black;width:30;height:16;text-align:center;margin-top:0;background:#ffF;font:bold 30px Arial}
span.c2 {cursor:hand;color:red;width:30;height:16;text-align:center;margin-top:0;background:#ffF;font:bold 30px Arial}
span.c3 {cursor:hand;color:#b0b0b0;width:30;height:16;text-align:center;margin-top:0;background:#ffF;font:bold 30px Arial}
table tr td{
			padding : 30px;
			border : 1px solid #000;
	}
select[name=selMonth] {
						margin-left : 500px;
}
select[name=selYear] {
						margin-left : -500px;
}		
</style>

<script type="text/javascript">
/* var a = [];
a = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','X','V','W','Y','Z'];
var testCode;
var testCode2;
var testCode3;
var code;
for( var i=0; i<a.length; i++ ){
	testCode = a[i];
	for(var d=0; d<a.length; d++){
		testCode2 = a[d];
		for(var k=0; k<10; k++){
			testCode3 =k;
			code = testCode + testCode2 + testCode3; */
			$.ajax({
				type : 'get',
			    url:'https://apis.daum.net/local/v1/search/category.json?apikey=bbef91da99f11fe76f4b3b523d3151e9',
			    data : {  
			    		location : '37.514322572335935,127.06283102249932' ,
			    		radius : 20000,			    		
			    		code : 'PM9'
			    },
			    dataType:'jsonp',
			    success:function(response){
			    	console.log(response);	
			    	
					}
				})
/* 		}
	} 
}
 */	

</script>
if(response.channel.item[0] != null){
			    		console.log(code);
			    		console.log(response.channel);

</HEAD>

<BODY>


</html>