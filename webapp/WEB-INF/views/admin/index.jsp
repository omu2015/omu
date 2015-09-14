<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style type="text/css">
#adminMainTable{
	margin : 0 auto;
	padding: 0 auto;
}

#adminMainTable table{
	margin-top: 30px;
  margin-bottom: 30px;
}

#adminMainTable tbody tr td table tbody tr td{
	text-align : center;
}

#selectMember{
width: 1500px;
}

#adminli {
	align : center;
}
</style>
</head>
<body>

<div id="wrapper">
	<!-- start header -->
		<c:import url="/WEB-INF/views/include/header.jsp"/>
	<!-- end header -->
	
	<section id="featured">
	<!-- start slider -->
	<div class="container">
	</section>
	<section id="content">
			<div class="row">
							<table id="adminMainTable">
								<c:import url="/WEB-INF/views/admin/viewlist.jsp"></c:import>
								<c:import url="/WEB-INF/views/admin/insertmember.jsp"></c:import>
								<c:import url="/WEB-INF/views/admin/inserttheme.jsp"></c:import>
								<c:import url="/WEB-INF/views/admin/insertthemebox.jsp"></c:import>
								<c:import url="/WEB-INF/views/admin/insertcontent.jsp"></c:import>
								<c:import url="/WEB-INF/views/admin/insertplan.jsp"></c:import>
								<c:import url="/WEB-INF/views/admin/insertcontentbox.jsp"></c:import>
							</table>
	</div>	
	</section>
</div>
</div>	
<a href="#" class="scrollup">위로가기<i class="fa fa-angle-up active"></i></a>
</body>
</html>