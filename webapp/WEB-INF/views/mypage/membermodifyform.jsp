<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>오늘 뭐하지?</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />
<!-- css -->
<link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../assets/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="../../assets/css/jcarousel.css" rel="stylesheet" />
<link href="../../assets/css/flexslider.css" rel="stylesheet" />
<link href="../../assets/css/style.css" rel="stylesheet" />
<link href="../../assets/css/table.css" rel="stylesheet" />

<!-- 다음우편번호api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;
            }
        }).open();
    }
    
    $.fn.setPreview = function(opt){
        "use strict"
        
        
        var defaultOpt = {
            inputFile: $(this),
            img: null,
            w: 200,
            h: 200
         	
        };
        $.extend(defaultOpt, opt);
       /*  console.log("jjj"+JSON.stringify(defaultOpt)); */
    /*   var obj = JSON.parse(defaultOpt);
       console.log("jjj"+obj); 
        */
        var previewImage = function(){
            if (!defaultOpt.inputFile || !defaultOpt.img) return;
     
            var inputFile = defaultOpt.inputFile.get(0);
            var img       = defaultOpt.img.get(0);
     
            // FileReader
            if (window.FileReader) {
                // image 파일만
                if (!inputFile.files[0].type.match(/image\//)) return;
     
                // preview
                try {
                    var reader = new FileReader();
                    reader.onload = function(e){
                        img.src = e.target.result;
                        img.style.width  = defaultOpt.w+'px';
                        img.style.height = defaultOpt.h+'px';
                        img.style.display = '';
                    }
                    reader.readAsDataURL(inputFile.files[0]);
              /*       console.log("jjj"+JSON.stringify(img.src)); */
                } catch (e) {
                    // exception...
                }
                 // img.filters (MSIE)
            } else if (img.filters) {
                inputFile.select();
                inputFile.blur();
                var imgSrc = document.selection.createRange().text;
     
                img.style.width  = defaultOpt.w+'px';
                img.style.height = defaultOpt.h+'px';
                img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";            
                img.style.display = '';
               
            // no support
            } else {
                // Safari5, ...
            }
        };
     
        // onchange
        $(this).change(function(){
            previewImage();
        });
    };
     
     
    $(document).ready(function(){
        var opt = {
            img: $('#img_preview'),
            w: 200,
            h: 200
        };
       
        
        $('#input_file').setPreview(opt);
        
        
    });
</script>


<!-- Theme skin -->
<link href="../../assets/css/default.css" rel="stylesheet" />

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>
<div id="wrapper">
	<!-- start header -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<!-- end header -->
	<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			</div>
		</div>
	</div>
	</section>
	<section id="content">

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
					<div class="row">
					<form  name="membermodifyform" method="post" action="/mypage/membermodifyformok" enctype="multipart/form-data">
					<div id="join-form">
					<table>
					<tr>
					
					
						<td id="photo" rowspan="4">
						<c:choose>
                        <c:when test="${not empty authUser.imageUrl }">
                        <%-- <img src="${authUser.imageUrl }" style="width:150px"> --%>
                        <img id="img_preview" name ="image2" src="${authUser.imageUrl }"style="width:150px"/>
                        </c:when>
                        <c:otherwise>
                                      고객의 사진이 없습니다.                        
                        </c:otherwise>
                     </c:choose>
                         <input type="file" id="input_file" name="img" title=""  style="display:block; width:200px; margin:0; text-align:center;" >
						<!-- <input type="file" name="img" style="display:block; width:100px; margin:0; text-align:center;" value="" /> -->
						</td>
						<td class="title">이름</td>
						<td><input id="name"  name="memberName" type="" value="${authUser.memberName  }" ></td>
					</tr>
					<tr>
						<td class="title">아이디</td>
						<td><input name="memberId" type="id" value="${authUser.memberId }" readonly="readonly">
					</tr>
					<tr>
						<td class="title">지금 패스워드</td>
						<td><input  name="password" type="password" value=""  placeholder="무조건 입력하세요"  ></td>
					</tr>
					<tr>
						<td class="title">지금 패스워드 재확인</td>
						<td><input name="password1" type="password" value="" placeholder="무조건 입력하세요"></td>
					</tr>
					<tr>
						<td class="title">변경 패스워드 </td>
						<td><input id="repassword" name="repassword" type="password" value="" placeholder="변경안할시 빈공간으로"></td>
					</tr>
					<tr>
						<td class="title">이메일</td>
						<td colspan="2"><input id="email" name="email" type="text" value="${authUser.email } "></td>
					</tr>
					<tr>
						<td class="title">생년월일</td>
						<td colspan="2">
							<input type="text" id="birth" name="birth" value="${authUser.birth }" readonly="readonly" >
						</td>
					</tr>
					<tr>
						<td rowspan="2"  class="title">주소</td>
						<td colspan="2"><input  name="zipcode" id="zipcode" class="txt" style="width:20%; text-align: center;" maxlength="6" value="${authUser.zipcode }" /><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
					</tr>
					<tr>
						<td colspan="2"><input name="address" id="address" class="txt" style="width: 100%; text-align: center;"  value="${authUser.address }" /></td>
					</tr>
					<tr>
						<td class="title">연락처</td>
						<td colspan="2">
					        <input name="phoneNum1" value="${authUser.phoneNum1 }" maxlength="4" style="width:15%"/>-
							<input name="phoneNum2" value="${authUser.phoneNum2 }" maxlength="4" style="width:15%"/>-
							<input name="phoneNum3" value="${authUser.phoneNum3 }" maxlength="4" style="width:15%"/>	
						</td>
						
					</tr>

					</table>
					</div>
				
					<input type="submit" value="수정완료">
				</form>
				
				</div>
			</div>
		</div>
	</div>
	</section>
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="../../assets/jsjquery.js"></script>
<script src="../../assets/jsjquery.easing.1.3.js"></script>
<script src="../../assets/jsbootstrap.min.js"></script>
<script src="../../assets/jsjquery.fancybox.pack.js"></script>
<script src="../../assets/jsjquery.fancybox-media.js"></script>
<script src="../../assets/jsgoogle-code-prettify/prettify.js"></script>
<script src="../../assets/jsportfolio/jquery.quicksand.js"></script>
<script src="../../assets/jsportfolio/setting.js"></script>
<script src="../../assets/jsjquery.flexslider.js"></script>
<script src="../../assets/jsanimate.js"></script>
<script src="../../assets/jscustom.js"></script>
<script src="../../assets/jsvalidate.js"></script>
</body>
</html>