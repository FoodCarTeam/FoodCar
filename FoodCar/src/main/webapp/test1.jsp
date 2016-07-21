<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%= timeago_tag Time.zone.now, :lang => :zh-TW %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src="jquery/jquery-3.0.0.min.js"></script>
<script type='text/javascript' src="bootstrap/comments/js/bootstrap.js"></script>
<script type='text/javascript' src="bootstrap/comments/Markdown/js/bootstrap-markdown.js"></script>
<!--  <script data-require="bootstrap@3.1.1" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> -->
  <script data-require="marked@*" data-semver="0.3.1" src="http://cdnjs.cloudflare.com/ajax/libs/marked/0.3.1/marked.js"></script>
<script data-require="marked@*" data-semver="0.3.1" src="bootstrap/comments/Markdown/js/bootstrap-markdown.js"></script>


<!-- <script src="https://rawgit.com/jeresig/jquery.hotkeys/master/jquery.hotkeys.js"></script> -->
<!--  <script src="https://rawgit.com/lodev09/jquery-filedrop/master/jquery.filedrop.js"></script> -->

<!-- <link rel='stylesheet' href='bootstrap/comments/css/bootstrap.min.css' -->
<!-- 	type='text/css' media='all' /> -->
<link href="bootstrap/comments/Markdown/css/bootstrap-markdown-editor .css" rel="stylesheet">
<link rel='stylesheet' href='bootstrap/comments/css/bootstrap.css'
	type='text/css' media='all' />
<link rel='stylesheet' href='bootstrap/comments/Markdown/css/bootstrap-markdown.min.css'
	type='text/css' media='all' />
<!--   <link data-require="fontawesome@4.1.0" data-semver="4.1.0" rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" /> -->
</head>
<body>
<script type='text/javascript' src="DateFormat/jquery.timeago.zh-TW.js"></script>
<script type='text/javascript' src="DateFormat/jquery.timeago.js"></script>




<script>

$(function(){
	  jQuery(document).ready(function() {  
	  jQuery("time.timeago").timeago();
	  
	  console.log(jQuery.timeago("2008-07-17"));
	  
	});
	

		  var strings = {
		    "zh-TW": {
		      prefixAgo: null,
		      prefixFromNow: null,
		      suffixAgo: "前",
		      suffixFromNow: "剛剛",
		      seconds: "不到1分鐘",
		      minute: "約1分鐘",
		      minutes: "%d分鐘",
		      hour: "1小時",
		      hours: "%d小時",
		      day: "1天",
		      days: "%d天",
		      month: "1月",
		      months: "%d月",
		      year: "1年",
		      years: "%d年",
		      numbers: [],
		      formatter: function(prefix, words, suffix) { return [prefix, words, suffix].join(""); }
		    }
		  };

		 
		  


	
	
	
	
})

</script>
<time class="timeago" datetime="2008-07-17T09:24:17Z">July 17, 2008</time>
<!-- <div style="width:500px;height:500px;"> -->
<!-- 	<form> -->
<!--     <input name="title" type="text" placeholder="Title?" class='form-control'/> -->
<!--     <textarea id='' name="content" data-provide="markdown" rows="10" ></textarea> -->
<!--     <label class="checkbox"> -->
<!--       <input name="publish" type="checkbox"> sddsa -->
<!--     </label> -->
<!--     <hr/> -->
<!--     <button id='sumnit' type="submit" class="btn" style="margin: 10px">確定</button> -->
<!--   </form>  -->
<!-- </div> -->

<div class="container">
    <form>
        <textarea name="content" data-provide="markdown-editable" rows="2" class="status-box md-input">### Hello World *This* **is** the ***ultimate test***.</textarea>
    </form>
    <div class="button-group pull-right">
        <p class="counter">140</p> <a href="#" class="btn btn-primary btn-post">Post</a>

    </div>
    <ul class='rows'>
        <ul class="posts list-inline"></ul>
    </ul>
</div>



</body>
</html>