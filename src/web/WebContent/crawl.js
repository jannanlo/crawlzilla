function check_null(){	
	if (document.forms[0].name_crawl_db.value == ""){
		alert("Please input DataBase Name !!!");
	}
	if (document.forms[0].name_crawl_url.value == ""){
		alert("Please input URLs !!!");
	}	
}

function deleteFun(num){
	if (confirm("Delete this DataBase ?")){
		document.forms[num].action="NutchDBDelete.do";
		document.forms[num].submit();
	}
}

function preview(num){
		document.forms[num].action="Statistics.do";
		document.forms[num].submit();
}

function tomcat_cancle(){
	location.href='nutch_DB.jsp';
}

function nuHiddlen(){
	object_how_to = document.getElementById("how_to");
	object_how_to.setAttribute("class", "show");
}

function hiddlen(){
	object_how_to = document.getElementById("how_to");
	object_how_to.setAttribute("class", "hiddlen");	
}

time=11;
function wait(){
	time = time - 1;
	object_wait_num = document.getElementById("wait_num");
	text_1 = document.createTextNode( "After " + time + " second, it will go to Crawl operation page");
	
	if (time != 0){
		object_wait_num.innerHTML = "After "+time+" second, it will go to Crawl operation page!";
	} else {
		alert("Go to Crawl operation page!");
		location.href='sysinfo.jsp';
	}
		
	setTimeout("wait()",1000);
}


function deleteDBStatus(num){
if (confirm("Delete this DataBase status ?")){
document.forms[num].action="NutchDBStatusDelete.do";
document.forms[num].submit();
}
}

function embed_code(num){
	alert('<form name="search" action="http://' + serverIP + ':8080/' + fileName + '/search.jsp" method="get"><input name="query" size=20 value="haha"><input type="hidden" name="hitsPerPage" value="50"><input type="hidden" name="lang" value="zh"></form>');
}
