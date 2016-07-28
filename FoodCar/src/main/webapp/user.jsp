<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>餐餔餔</title>   
   
    <!--CSS-->
<link rel='stylesheet' id='main-stylesheet-css'  href='bootstrap/user/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='slicknav-css'  href="bootstrap/user/css/mobile%20menu%20style.css" type='text/css' media='all' /><!--mobile menu style.css-->
<!--JS-->
<script type='text/javascript' src="bootstrap/user/js/modernizr.custom.js"></script>
<!--list浮動-->
<link href="bootstrap/user/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/user/css/scrolling-nav.css" rel="stylesheet" />
<script src="bootstrap/user/js/jquery.js"></script>
<script src="bootstrap/user/js/scrolling-nav.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style type="text/css">
    /* USER PROFILE PAGE */
 .card {
    margin-top: 20px;
    padding: 30px;
    background-color: rgba(214, 224, 226, 0.2);
    -webkit-border-top-left-radius:5px;
    -moz-border-top-left-radius:5px;
    border-top-left-radius:5px;
    -webkit-border-top-right-radius:5px;
    -moz-border-top-right-radius:5px;
    border-top-right-radius:5px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.card.hovercard {
    position: relative;
    padding-top: 0;
    overflow: hidden;
    text-align: center;
    background-color: #fff;
    background-color: rgba(255, 255, 255, 1);
}
.card.hovercard .card-background {
    height: 130px;
}
.card-background img {
    -webkit-filter: blur(25px);
    -moz-filter: blur(25px);
    -o-filter: blur(25px);
    -ms-filter: blur(25px);
    filter: blur(25px);
    margin-left: -100px;
    margin-top: -200px;
    min-width: 130%;
}
.card.hovercard .useravatar {
    position: absolute;
    top: 15px;
    left: 0;
    right: 0;
}
.card.hovercard .useravatar img {
    width: 100px;
    height: 100px;
    max-width: 100px;
    max-height: 100px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    border-radius: 50%;
    border: 5px solid rgba(255, 255, 255, 0.5);
}
.card.hovercard .card-info {
    position: absolute;
    bottom: 14px;
    left: 0;
    right: 0;
}
.card.hovercard .card-info .card-title {
    padding:0 5px;
    font-size: 20px;
    line-height: 1;
    color: #262626;
    background-color: rgba(255, 255, 255, 0.1);
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
}
.card.hovercard .card-info {
    overflow: hidden;
    font-size: 12px;
    line-height: 20px;
    color: #737373;
    text-overflow: ellipsis;
}
.card.hovercard .bottom {
    padding: 0 20px;
    margin-bottom: 17px;
}
.btn-pref .btn {
    -webkit-border-radius:0 !important;
}


    </style>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.alert = function () { };
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css) {
            if (css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="' + css + '" type="text/css" />');
            else $('head > link').filter(':first').replaceWith(defaultCSS);
        }
        $(document).ready(function () {
            var iframe_height = parseInt($('html').height());
            window.parent.postMessage(iframe_height, 'http://bootsnipp.com');
        });
    </script>






  </head>
  <body class="page page-id-8736 page-template page-template-template-truck-page page-template-template-truck-page-php born2eat-food-truck-toronto">  
  
  
     <jsp:include page="header.jsp"></jsp:include>
     
     
<div id="MainContent" style="width:800px;margin:auto">
  <div class="row">
    <div class="small-12 large-50 columns">
      <div class="truck-details">
        <div class="content">
      
         
	<div class="col-lg-14 col-sm-14">
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" alt="" src="images/hand/hand1.jpg">
        
        </div>
        <div class="useravatar">
            <img alt="" src="images/hand/hand1.jpg">
        </div>
        <div class="card-info"> <span class="card-title">${member.mName}</span>

        </div>
    </div>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                <div class="hidden-xs">基本資料</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="favorites" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
                <div class="hidden-xs">追蹤店家</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <div class="hidden-xs">變更密碼</div>
            </button>
        </div>
    </div>

        <div class="well">
      <div class="tab-content">
        <div class="tab-pane fade in active" id="tab1">
        <form class="form-inline" role="form"
										action="<c:url value='/update.do' />" method="post">
							<p></p>

							<!-- 										<label for="mIMG" style="font-size: 30px">個人頭貼：</label> <input type="text" class="form-control" required autofocus -->
								<%-- 											style="font-size: 15px" value="${mUsername.mIMG}" name="mIMG"></br>  --%>
								<input type="hidden" name="mID" value="${member.mID}"><br />
								<label for="mName" style="font-size: 24px">姓名：${member.mName}</label><br />
								<input type="text" class="form-control" placeholder="若要更改，請輸入"
									required autofocus style="font-size: 15px" name="mName"><br />
									
								<label for="mAddress" style="font-size: 24px">地址：${member.mAddress}</label><br />
								<input type="text" class="form-control" placeholder="若要更改，請輸入"
											required autofocus style="font-size: 15px" name="mAddress"><br />
											
								<label for="mPhone" style="font-size: 24px">電話：${member.mPhone}</label><br />
								<input type="text" class="form-control" placeholder="若要更改，請輸入"
									required autofocus style="font-size: 15px" name="mPhone"><br />
									
								<label for="mBirthday" style="font-size: 24px">生日：${member.mBirthday}</label><br />
								<input type="text" class="form-control" placeholder="若要更改，請輸入"
									required autofocus style="font-size: 15px" name="mBirthday"><br/>

										<p></p>
										<div class="checkbox">
											<button class="btn btn-lg btn-primary btn-block"
												type="submit">更改</button>
										</div>
									</form>
        </div>
        <div class="tab-pane fade in" id="tab2">
          <h3>追蹤店家:</h3>
        </div>
        <div class="tab-pane fade in" id="tab3">
          <h3>變更密碼:</h3>
          <form class="form-inline" style="width: 700px;"
										action="<c:url value='/change.do' />" method="post">

		<input type="hidden" class="form-control" placeholder="請輸入原密碼"
						required autofocus style="font-size: 15px"
						value="${member.mUsername}" name="mUsername"><br /> 

	<label for="mPassword" style="font-size: 15px">請輸入原密碼：</label> 
				<input	type="text" class="form-control" placeholder="請輸入原密碼"
				required autofocus style="font-size: 15px" name="mPassword"><br />
				
		<label for="newPassword" style="font-size: 15px">請輸入新密碼：</label>
			<input type="text"	class="form-control" placeholder="請輸入新密碼" required autofocus
				style="font-size: 15px" name="newPassword"><br />
				
	 <label	for="newAgain" style="font-size: 15px">再次輸入新密碼：</label>
			 <input type="text"class="form-control" placeholder="請再次輸入新密碼" required
					style="font-size: 15px" name="newAgain"><br />
						<p></p>
				<button class="btn btn-lg btn-primary btn-block" type="submit">更新</button>
		</form>
        </div>
      </div>
    </div>
    
    </div>
            
    
	<script type="text/javascript">
	    $(document).ready(function () {
	        $(".btn-pref .btn").click(function () {
	            $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
	            // $(".tab").addClass("active"); // instead of this do the below 
	            $(this).removeClass("btn-default").addClass("btn-primary");
	        });
	    });
	</script>



      </div>
      <!--/truck-details-->
    </div>
    <!--/small-12 large-8 columns-->

    <!--/sidebar-->
  </div>
  <!--/row-->
</div>
</div>
  
<!--/MainContent-->
      
<!-- Footer -->
    <div id="SecondFooter">
      <div class="row">
        <div class="small-12 medium-6 large-8 columns">
          <div class="footer-links">
            <p>© 2016 Freshdaily Inc. All rights reserved.</p>
          </div>
        </div>
      
      </div>
    </div>
<!-- /Footer -->
       <script type='text/javascript' src="bootstrap/user/js/foundation.min.js"></script>
      <script type='text/javascript' src="bootstrap/user/js/app.js"></script>
      <!--MENU縮小-->
    <script type='text/javascript' src="bootstrap/user/js/jquery.slicknav.js"></script>    
      <script type="text/javascript">
          $(document).ready(function () {
              $('#menu-mobile').slicknav({
                  label: '',
                  prependTo: '#MenuPhone'
              });
          });
    </script>
  </body>
</html>