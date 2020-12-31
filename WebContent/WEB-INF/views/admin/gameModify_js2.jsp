<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	registOk = true;
	function registGame(){
		registOk = true;
		
		var pictures = getPictures();
		var tagnames = getTags();
		var gameVO = getGameInfo();
		var systems = getSystems();

		var data = {
			pictures : pictures,
			tagnames : tagnames,
			gameVO : gameVO,
			systems : systems
		}
		
		dataj = JSON.stringify(data);
		
		if(registOk){
			
			$.ajax({
				url : "gameModify.do",
				type : "post",
				data : dataj,
				dataType : "json",
				success : function(e){
					if(e){
						location.href="<%=request.getContextPath()%>/store/detail.do?gno="+e;
					}
				},
				error : function(e){
					
				}
			})
		} else {
			alert("필수 항목들을 입력해주세요.")
		}
		
	}
	
	function registGraphic(btn){
		var inputGraphic = $(btn).parent().find('input[type="text"]');
		var graphic = $(inputGraphic).val();
		if(graphic != "" && graphic != null){
			
			$.ajax({
				url : "registHardWare.do",
				data : {name : graphic,
						kind : "graphic"
						},
				type : "post",
				success : function(){
					var html = "<option value='"+graphic+"'>"+graphic+"</option>";
					$(inputGraphic).val("");
					
					$('select[name="graphic1"]').append(html);
					$('select[name="graphic2"]').append(html);
					
				},
				error : function(){
					alert("이미 있는 그래픽 이거나 서버 오류 입니다.");
				}
			})
			
		} else {
			alert("그래픽 이름을 입력해주세요.");
		}
	}
	
	function registProcessor(btn){
		var inputPro = $(btn).parent().find('input[type="text"]');
		var processor = $(inputPro).val();
		if(processor != "" && processor != null){
			
			$.ajax({
				url : "registHardWare.do",
				data : {name : processor,
						kind : "processor"
						},
				type : "post",
				success : function(){
					var html = "<option value='"+processor+"'>"+processor+"</option>";
					$(inputPro).val("");
					
					$('select[name="processor1"]').append(html);
					$('select[name="processor2"]').append(html);
					
				},
				error : function(){
					alert("이미 있는 프로세서 이거나 서버 오류 입니다.");
				}
			})
			
		} else {
			alert("프로세서 이름을 입력해주세요.");
		}
	}
	
	function registCorp(){
		var corp = $('#inputCorp').val();
		if(corp != "" && corp != null){
			
			$.ajax({
				url : "registCorp.do",
				data : {corp : corp},
				type : "post",
				success : function(){
					var html = '<option value="'+corp+'">'+corp+'</option>';
					$('#inputCorp').val("");
					$('select[name="developer"]').append(html);
					$('select[name="distributor"]').append(html);
				},
				error : function(){
					alert("이미 있는 게임사 이거나 서버 오류 입니다.");
				}
			})
			
		} else {
			alert("게임사 이름을 입력해주세요.");
		}
	}
	
	function createTag(category){
		var targetDiv;
		var newtag;
		var tagkind;
		if(category == 'category'){
			if($('#newCate').val() == ""){
				return false;
			}
			targetDiv = $('#categoryTagDiv');
			newtag = $('#newCate').val(); 
			$('#newCate').val("");
			tagkind = "카테고리";
			
		} else if (category == 'function'){
			if($('#newFunc').val() == ""){
				return false;
			}
			targetDiv = $('#functionTagDiv');
			newtag = $('#newFunc').val(); 
			$('#newFunc').val("");
			tagkind = "기능";
		}
		
		$.ajax({
			url : "registTagKind.do",
			data : { tagname : newtag,
					 tagkind : tagkind,
					},
			type : "post",
			success : function(){
				var html = ""
					+'	<div class="form-check">'
					+'		<label class="form-check-label">'
					+'			<input type="checkbox" class="form-check-input" name="tagname" value="'+newtag+'">'+newtag
					+'		</label>'
					+'	</div>';
				$(targetDiv).append(html);
				
			},
			error : function(){
				alert("이미 있는 태그 이름이거나 서버 오류 입니다.");
			}
		})
			
	}
	
	
	
	function getPictures(){
		var pictures = [];
		var inputPic = $('input[name="pictures"]');
		for(var pic of inputPic){
			if(pic.value != "" && pic.value != null){
				pictu = { picno : $(pic).attr("idx"), picture : pic.value };
				pictures.push(pictu);
			}
		}
		return pictures;
	}
	function getTags(){
		var tagnames = $('#tagnames').val();
		if(tagnames != null){
			tagnames = tagnames.split(",");
		}
		if(tagnames == null || tagnames == ""){
			registOk = false;
		}
		return tagnames;
	}
	
	function getGameInfo(){
		var gameInfo = {};
		
		var gno = ${game.gno};
		var gname = $('input[name="gname"]').val();
		var content = $('#content').val();
		var price = $('input[name="price"]').val();
		var sprice = $('input[name="sprice"]').val();
		var startdate = $('input[name="startDate"]').val();
		var enddate = $('input[name="endDate"]').val();
		var relDate = $('input[name="relDate"]').val();
		var distributor = $('select[name="distributor"]').val();
		var developer = $('select[name="developer"]').val();
		var simContent = $('#simContent').val();
		var thumbnail = $('#picname_7').val();
		
		gameInfo.gno = gno;
		gameInfo.gname = gname; 
		gameInfo.content = content;
		gameInfo.price = price;
		gameInfo.sprice = sprice;
		gameInfo.startdate = startdate;
		gameInfo.enddate = enddate;
		gameInfo.reldate = relDate;
		gameInfo.distributor = distributor;
		gameInfo.developer = developer;
		gameInfo.simcontent = simContent;
		gameInfo.thumbnail = thumbnail;
		
		if(gname =="" || gname==null){
			registOk = false;
		}
		if(content =="" || content==null){
			registOk = false;
		}
		if(price =="" || price==null){
			registOk = false;
		}
		if(relDate =="" || relDate==null){
			registOk = false;
		}
		if(distributor =="" || distributor==null){
			registOk = false;
		}
		if(developer =="" || developer==null){
			registOk = false;
		}
		if(simContent =="" || thumbnail==null){
			registOk = false;
		}
		
		return gameInfo;
	}

	function getSystems(){
		var systems = [];
		
		var osArr = $('input[name="os"]');
		for(var oos of osArr){
			system = {};
			if(oos.checked){
				var osdiv = $('div#tableSYS'+oos.value);
				var pro1 = $(osdiv).find('select[name="processor1"]').val();
				var pro2 = $(osdiv).find('select[name="processor2"]').val();
				var memo = $(osdiv).find('input[name="memory"]').val();
				var grap1 = $(osdiv).find('select[name="graphic1"]').val();
				var grap2 = $(osdiv).find('select[name="graphic2"]').val();
				var direct = $(osdiv).find('input[name="directx"]').val();
				var dis = $(osdiv).find('input[name="disk"]').val();
				
				system.os = oos.value;
				system.processor1 = pro1;
				system.memory = memo;
				if(!(pro2 == null || pro2 == "")){
					system.processor2 = pro2;
				}
				system.graphic1 = grap1;
				if(!(grap2 == null || grap2 == "")){
					system.graphic2 = grap2;
				}
				if(!(direct == null || direct == "")){
					system.directx = direct;
				}
				if(!(dis == null || dis == "")){
					system.disk = dis;
				}
				
				systems.push(system);
				
			}
		}
		
		return systems;
	}
	function selectTag(){
		var tagnames = $('input[name="tagname"]');
		str = "";
		var isFirst = true;
		for(var i = 0; i < tagnames.length; i++){
			if(tagnames[i].checked){
				if(!isFirst){
					str += "," + tagnames[i].value;
				} else {
					str += tagnames[i].value;
					isFirst = false;
				}
			}
		}
		$('input#tagnames').val(str);
		
	}




</script>