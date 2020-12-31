<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="store-list-template" >
{{#each .}}
<div class="col-md-3 game-card-div" style="padding: 5px; height: 380px; cursor:pointer;" onclick="window.parent.location.href='detail.do?gno={{gno}}'">
	<div class="card special-skill-item border-0" style="text-align: left;">
		<div class="card-header bg-transparent border-0" style="padding: 0px;">
			<div data-id="picture" style="height: 230px; background-color: #EAEAEB; border-radius: 5px;">
				<img style="height:100%; width:100%;" src="{{getPicture thumbnail}}">
			</div>
		</div>
		<div class="card-body" style="padding: 0px;">
			<div>
				<span style="padding-left:5px; padding-right:5px;height: 23px; margin: 5px 0px; display: block; border-radius: 5px;">{{gname}}</span>
				<span style="padding-left:5px; padding-right:5px;height: 23px; display: block;white-space: nowrap;overflow: hidden;  color : #5688FA; border-radius: 5px;">{{setTag tagnames}}</span>

				<div style="height: 23px; border-radius: 5px;">
					<span class="" style="padding-left:5px; padding-right:5px;margin: 0px 8px 0px 0px;"><span style="text-decoration: line-through; color:gray">{{setPrice price sprice}}</span>{{setSprice price sprice}}</span>
				</div>
			</div>
		</div>
	</div>
</div>
{{/each}}
</script>
<script>
window.onload = function(){
	//console.log("현재 url : " + window.location.href);
	setDataFromURL();
	
	Handlebars.registerHelper({
		"setPrice" : function(price, sprice){
			var str = "";
			if(sprice != 0){
				str += " ₩ " + price;
			}
			return str;
		},
		"setSprice":function(price,sprice){
			
			var str = "";
			if(sprice == 0){
				str += " ₩ " + price;
			} else {
			
				str +=  " /"+ " ₩ " + (price *(1-sprice/100));
			}
			return str;
		},
		"setTag":function(tagnames){
			var str = "";
			for(var tag of tagnames){
				str += "#" + tag + " "
			}
			return str;
		},
		"getPicture":function(thumbnail){
			var src="<%=request.getContextPath() %>/common/getImage.do?picName=" + thumbnail;
			return src;
		}
	});
	
	$('.col-md-12').on('click','input[type="checkbox"]', function(){
		getPage(0);
	});
	
}
	
	function setDataFromURL(){
		var url = location.href;
		if(url.indexOf("keyword=") == -1){
			getPage(0);
			return false;
		}
		var keyword = decodeURI(url.substring(url.indexOf("keyword=")+8, url.indexOf("&tagnames")));
		
		var tagnames = decodeURI(url.substring(url.indexOf("tagnames=")+9, url.indexOf("&os")));
		var os = decodeURI(url.substring(url.indexOf("os=")+3, url.indexOf("&page")));
		var page = decodeURI(url.substring(url.indexOf("page=")+5, url.length));
		$('input#keyword').val(keyword);
		tagnames = tagnames.split(",");
		for(var tag of tagnames){
			$('input[value="'+tag+'"]').attr("checked","true");
		}
		os = os.split(",");
		for(var oo of os){
			$('input[value="'+oo+'"]').attr("checked","true");
		}
		getPage(page);
		
	}
	
	function getPageKeyword(){
		$('input#keyword').val($('#search-field').val());
		getPage(0);
	}
	
	function getPage(pa){
		key = $('input#keyword').val();
		order = $('select#order').val();
		page = pa;
		tagnames = getTagCheckBox();
		os = getOsCheckBox();
		
		var datas = {
				 "keyword" : key,
				 "orderBy" : order,
				 "tagnames" : tagnames,
				 "os" : os,
				 "page" : page
		};
		//console.log(datas);
		$.ajax({
			url : "resultList.do",
			type:"post",
			traditional : true,
			data : datas,
			success : function(data){
 				printData(data.resultList, $('#gameListCard'), $('#store-list-template'),page);
			},
			error : function(e){
				
			}
		})
		
		urlChange(datas);
	}
	
	function urlChange(datas){
		if(typeof(history.pushState) == 'function') {
			var renewURL = location.href;
			//현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
			renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
			//if(datas.keyword != null) {
				renewURL += "?keyword="+ datas.keyword;
			//}
			//if(datas.tagnames != null) {
				renewURL += "&tagnames=";
				for(var i = 0 ; i < datas.tagnames.length; i++){
					if(i==0){
						renewURL += datas.tagnames[i];
					} else {
						renewURL += ","+ datas.tagnames[i];
					}
				}
			//}
				//if(datas.os != null) {
				renewURL +="&os=";
				for(var i = 0 ; i < datas.os.length; i++){
					if(i==0){
						renewURL += datas.os[i];
					} else {
						renewURL += ","+ datas.os;
					}
				}
				//}
				//if(datas.page != null) {
				renewURL += "&page="+datas.page;
				//}
			
			//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
			history.pushState("", null, renewURL);
			console.log("바꿀 url : " + renewURL);
		}else {
			location.hash = "#"+mCode;
		}
	}
	
	var printData = function(dataArr,target,templateObject,page){
		var template = Handlebars.compile(templateObject.html());
		var html = template(dataArr);
		if(page==0){
			$('.game-card-div').remove();
			$('#moreBtn').css("visibility", "visible");
		} else {
			$('#moreBtn').css("visibility", "hidden");
		}
		target.append(html);
	}
	
	
	function getTagCheckBox(){
		var tags = $("input[name='tag']");
		var temp = []
		for(var i = 0; i<tags.length;i++){
			if(tags[i].checked){
				temp.push(tags[i].value);
			}
		}
		return temp;
	}
	function getOsCheckBox(){
		var tags = $("input[name='os']");
		var temp = []
		for(var i = 0; i<tags.length;i++){
			if(tags[i].checked){
				temp.push(tags[i].value);
			}
		}
		
		return temp;
	}
	
</script>














