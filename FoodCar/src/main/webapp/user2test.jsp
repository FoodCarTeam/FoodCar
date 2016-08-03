<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>Business Hours plugin for jQuery &ndash; Demos and Documentation</title>
    <meta name="description" content="Business hours jQuery plugin."/>
<link rel="shortcut icon" href="images/tools/logo.png"> 
   <!--CSS-->
<link rel='stylesheet' id='main-stylesheet-css'
	href='bootstrap/user/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='slicknav-css'
	href="bootstrap/user/css/mobile%20menu%20style.css" type='text/css'
	media='all' />
<!--mobile menu style.css-->
<!--JS-->
<script type='text/javascript'
	src="bootstrap/user/js/modernizr.custom.js"></script>
<!--list浮動-->
<link href="bootstrap/user/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/user/css/scrolling-nav.css" rel="stylesheet" />
<script src="bootstrap/user/js/jquery.js"></script>
<script src="bootstrap/user/js/scrolling-nav.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet"><!--選擇器外框-->
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"><!--太陽.月亮圖片-->
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.2.17/jquery.timepicker.min.js"></script><!--時間list-->
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.2.17/jquery.timepicker.min.css"/><!--時間list版型-->
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/themes/github.css"/>
    <script src="//cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/js/rainbow.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="bootstrap/user/js/businessHours.js"></script>
    <link rel="stylesheet" type="text/css" href="bootstrap/user/css/businessHours.css"/>

 
</head>
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
<body>    
<jsp:include page="header.jsp"></jsp:include>
    <div id="MainContent" style="width: 800px; margin: auto">
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
								<div class="card-info">
									<span class="card-title">${store.sName}</span>

								</div>
							</div>
							<div class="btn-pref btn-group btn-group-justified btn-group-lg"
								role="group" aria-label="...">
								<div class="btn-group" role="group">
									<button type="button" id="stars" class="btn btn-primary"
										href="#tab1" data-toggle="tab">
										<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										<div class="hidden-xs">基本資料</div>
									</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" id="orders" class="btn btn-default"
										href="#tab2" data-toggle="tab">
										<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
										<div class="hidden-xs">訂單追蹤</div>
									</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" id="following" class="btn btn-default"
										href="#tab3" data-toggle="tab">
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
										<div class="hidden-xs">變更密碼</div>
									</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" id="Button1" class="btn btn-default"
										href="#tab4" data-toggle="tab">
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
										<div class="hidden-xs">????</div>
									</button>
								</div>

							</div>

							<div class="well">
								<div class="tab-content">
									<div class="tab-pane fade in active" id="tab1">
										<form class="form-inline" role="form"
											action="<c:url value='/storeUpdate.do' />" method="post">
											<p></p>

											<input type="hidden" name="sID" value="${store.sID}"><br />
											<label for="sName" style="font-size: 20px">店名：${store.sName}</label><br />
											<input type="text" class="form-control"
												placeholder="若要更改，請輸入" required autofocus
												style="font-size: 15px" name="sName"><br /> <label
												for="sBossName" style="font-size: 20px">老闆姓名：${store.sBossName}</label><br />
											<input type="text" class="form-control"
												placeholder="若要更改，請輸入" required autofocus
												style="font-size: 15px" name="sBossName"><br /> <label
												for="sIntro" style="font-size: 20px">介紹：</label><br />
											<textarea cols="50" rows="3" type="textarea"
												class="form-control" required autofocus
												style="font-size: 15px; resize: none" name="sIntro">${store.sIntro}</textarea>
											<br />


											<p></p>
											<div class="checkbox">
												<button class="btn btn-lg btn-primary btn-block"
													type="submit">更改</button>
											</div>
										</form>
									</div>
									<div class="tab-pane fade in" id="tab2">
										<h3>訂單追蹤</h3>
									</div>
									<div class="tab-pane fade in" id="tab3">
										<!--           <h3>變更密碼:</h3> -->
										<form class="form-inline" style="width: 700px;"
											action="<c:url value='/storechange.do' />" method="post">

											<input type="hidden" class="form-control"
												placeholder="請輸入原密碼" required autofocus
												style="font-size: 15px" value="${store.sUsername}"
												name="sUsername"><br /> <br /> <label
												for="sPassword" style="font-size: 15px">請輸入原密碼：</label><br />
											<input type="password" class="form-control"
												placeholder="請輸入原密碼" required autofocus
												style="font-size: 15px" name="sPassword"><br /> <label
												for="newPassword" style="font-size: 15px">請輸入新密碼：</label><br />
											<input type="password" class="form-control"
												placeholder="請輸入新密碼" required autofocus
												style="font-size: 15px" name="newPassword"><br /> <label
												for="newAgain" style="font-size: 15px">再次輸入新密碼：</label><br />
											<input type="password" class="form-control"
												placeholder="請再次輸入新密碼" required style="font-size: 15px"
												name="newAgain"><br />
											<p></p>

											<button class="btn btn-lg btn-primary btn-block"
												type="submit">更新</button>
										</form>
									</div>
									<div class="tab-pane fade in" id="tab4" style="height:200px ">
										<h3>營業時間:</h3>
                                         <div id="businessHoursContainer3"></div>
									</div>

								</div>
							</div>

						</div>


						<script type="text/javascript">
						    $(document)
									.ready(
											function () {
											    $(".btn-pref .btn")
														.click(
																function () {
																    $(
																			".btn-pref .btn")
																			.removeClass(
																					"btn-primary")
																			.addClass(
																					"btn-default");
																    // $(".tab").addClass("active"); // instead of this do the below 
																    $(this)
																			.removeClass(
																					"btn-default")
																			.addClass(
																					"btn-primary");
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
	<script type='text/javascript'
		src="bootstrap/user/js/foundation.min.js"></script>
	<script type='text/javascript' src="bootstrap/user/js/app.js"></script>
	<!--MENU縮小-->
	<script type='text/javascript'
		src="bootstrap/user/js/jquery.slicknav.js"></script>
	<script type="text/javascript">
	    $(document).ready(function () {
	        $('#menu-mobile').slicknav({
	            label: '',
	            prependTo: '#MenuPhone'
	        });
	    });
	</script>
            
          
    <script>

        $("#businessHoursContainer3").businessHours({
            postInit: function () {
                $('.operationTimeFrom, .operationTimeTill').timepicker({
                    'timeFormat': 'H:i',
                    'step': 15
                });
            },
            dayTmpl: '<div class="dayContainer" style="width: 80px;">' +
                '<div data-original-title="" class="colorBox"><input type="checkbox" class="invisible operationState"></div>' +
                '<div class="weekday"></div>' +
                '<div class="operationDayTimeContainer">' +
                '<div class="operationTime input-group"><span class="input-group-addon"><i class="fa fa-sun-o"></i></span><input type="text" name="startTime" class="mini-time form-control operationTimeFrom" value=""></div>' +
                '<div class="operationTime input-group"><span class="input-group-addon"><i class="fa fa-moon-o"></i></span><input type="text" name="endTime" class="mini-time form-control operationTimeTill" value=""></div>' +
                '</div></div>'
        });
    </script>




</body>
</html>
