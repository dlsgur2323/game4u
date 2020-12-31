<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="game" value="${detailMap.game }" />
<c:set var="systemList" value="${detailMap.systemList }" />
<c:set var="tagList" value="${detailMap.tagList }" />
<c:set var="gamePictureList" value="${detailMap.gamePictureList }" />
<c:set var="enddate" value="${detailMap.enddate }" />
<c:set var="startdate" value="${detailMap.startdate }" />
<c:set var="reldate" value="${detailMap.reldate }" />

<c:set var="comList" value="${adminMap.comList }" />
<c:set var="osList" value="${adminMap.osList }" />
<c:set var="processorList" value="${adminMap.processorList }" />
<c:set var="graphicList" value="${adminMap.graphicList }" />
<c:set var="categoryList" value="${adminMap.categoryList }" />
<c:set var="functionList" value="${adminMap.functionList }" />
<form >

</form>

<body>
<div class="page lanidng-page">
	<form method="post" action="gameRegist.do" name="registForm" style="none;">
		<!-- 게임상세정보 -->
		<section id="" class="portfolio-block" style="padding: 0px 0px 0px 0px; borde:1px;">
			<div class="container">
				<br><br><br>
				<h1>게임 정보 수정</h1><br>
					<h5>게임 타이틀</h5>
					
					<input type="text" value="${game.gname }" name="gname" class="form-control">
					<br>
					<div class="row">
						<div id="demo" class="carousel slide col-md-8" data-ride="carousel">
							<div>
								<h5>게임 사진</h5>
								<div name="picture" id="picture" 
								style="border: 1px dotted gray; height: 300px; width: 700px; margin: 0; ">
									<div class="row">
										<div class="col-md-4" style="margin: 10px 0px;">
											<label for="inputPic_1" name="inputPic" value="inputPic_1" style="width:100%; height:100%; background-color: lightgray;">
					                           	<div class="portfolio-info-card" id="gamePic_1" style="width:100%; height:100%; background-color: lightgray;"></div>
					                        </label>
					                    </div>
					                    <div class="col-md-4" style="margin: 10px 0px;">
											<label for="inputPic_2" name="inputPic" value="inputPic_2" style="width:100%; height:100%; background-color: lightgray;">
					                           	<div class="portfolio-info-card" id="gamePic_2"></div>
					                        </label>
					                    </div>   
					                    <div class="col-md-4" style="margin: 10px 0px;">
											<label for="inputPic_3" style="width:100%; height:100%; background-color: lightgray;">
					                           	<div class="portfolio-info-card" id="gamePic_3"></div>
					                        </label>
					                    </div>
									</div>
									<div class="row">
										<div class="col-md-4" style="margin: 10px 0px;">
											<label for="inputPic_4" style="width:100%; height:100%; background-color: lightgray;">
					                           	<div class="portfolio-info-card" id="gamePic_4"></div>
					                        </label>
					                    </div>
					                    <div class="col-md-4" style="margin: 10px 0px;">
											<label for="inputPic_5" style="width:100%; height:100%; background-color: lightgray;">
					                           	<div class="portfolio-info-card" id="gamePic_5"></div>
					                        </label>
					                    </div>   
					                    <div class="col-md-4" style="margin: 10px 0px;">
											<label for="inputPic_6" style="width:100%; height:100%; background-color: lightgray;">
					                           	<div class="portfolio-info-card" id="gamePic_6"></div>
					                        </label>
					                    </div>
									</div>
									박스를 눌러 사진을 선택해주세요.
			        			</div>
							</div>	
						</div>
						<div class="col-md-4">
							<div style="height: 400px;">
								<!-- 썸네일 등록/수정 -->
								<div class="row">
									<h5>썸네일</h5><br>
									<div>
			                            <div style="height: 200px; width: 350px; text-align: center;">
				                            <label for="inputPic_7" style="width:100%; height:100%; background-color: lightgray;">
				                            	<div class="portfolio-info-card" id="gamePic_7">썸네일을 선택하세요</div>
				                            		
				                            </label>
				                        </div>
		                            </div>
								</div>
								<!-- 게임요약설명 등록/수정 -->
								<div class="row">
									<div><br>
										<h5>게임 요약 설명</h5> 
										<div class="form-group">
										  <textarea class="form-control" rows="7" name="simContent" id="simContent" style="width: 350px;">${game.simcontent }
										  </textarea>
										</div>
									</div>
								</div>
							</div>
						</div >
					</div>
					<br>
					<div>
						<div class="row" style="margin: 0px;">
						  <h5>태그</h5> 
						  <!-- Button to Open the Modal -->
						  <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#myModal">선택</button>
						</div>
						<div class="row" style="margin: 0px;">
						  <input type="text" value="<c:forEach items='${tagList }' var='tag' varStatus='status'>
						  <c:if test='${!status.first }'>,</c:if>
						  ${tag.tagname }</c:forEach>" readonly id="tagnames">
						</div>
						<br>
						
						<table>
							<tr>
								<td style="width: 90px;">
									<label for="sel1">출 &nbsp;시 &nbsp;&nbsp;일</label>
								</td>
								<td style="width: 340px;">
									<input name="relDate" value="${reldate}" style="width: 350px;" type="date">
								</td>
							</tr>
							<tr>
								<td>
									<label for="sel1">개 &nbsp;발 &nbsp;&nbsp;사</label>
								</td>
								<td>
									<select name="developer" style="width: 350px;" id="sel1">
										<option value="${game.developer }">${game.developer }</option>
									  	<c:forEach items="${comList }" var="company">
										  	<c:if test="${company ne game.developer }">	
											    <option value="${company }">${company }</option>
											</c:if>
									    </c:forEach>
								    </select>
								</td>
							</tr>
							<tr>
								<td>
									<label for="sel1">배 &nbsp;급 &nbsp;&nbsp;사</label>
								</td>
								<td>
									<select name="distributor" style="width: 350px;" id="sel1">
										<option value="${game.distributor }">${game.distributor }</option>
									  	<c:forEach items="${comList }" var="company">
											<c:if test="${company ne game.distributor }">	
											    <option value="${company }">${company }</option>
											</c:if>
									    </c:forEach>
								    </select>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" id="inputCorp" placeholder="게임사 추가"><input type="button" value="추가"></td>
							</tr>
							<tr>
								<td>
									<label for="sel1">판매가격</label>
								</td>
								<td>
									<input value="${game.price }" name="price" style="width: 320px;" type="text"> 원
								</td>
							</tr>
							<tr>
								<td>
									<label for="sel1">할인퍼센트(%)</label>
								</td>
								<td>
									<input name="sprice" value="${game.sprice }" style="width: 320px;" type="text"> %
								</td>
							</tr>
							<tr>
								<td>
									<label for="sel1">할인기간</label>
								</td>
								<td>
									<input name="startDate" value="${startdate}" type="date"> ~ <input value="${enddate}" name="endDate" type="date">
								</td>
							</tr>
						</table>
					</div>
					<br>
					<div>
						<h3>게임 상세 설명</h3> 
						<div class="form-group">
						  <textarea class="form-control" rows="5" name="content" id="content">${game.content }</textarea>
						</div>
					</div>
				
			</div>
		</section>
		
		<!-- 시스템요구사항 -->
		<section id="newGameRow" class="portfolio-block" style="padding: 50px;">
			<div class="container">
				<h3 style="display: inline-block;">시스템 요구사항</h3>
				<div class="row">
					<div class="col-md-12">
						<div class="card border-0">
							<div class="card-body" style="width: 800px;">
								<div class="form-group">
								  <label for="sel1">운영체제</label>
									  <div>
									  <c:forEach items="${osList }" var="os">
											<div class="form-check">
											  <label class="form-check-label">
											    <input type="checkbox" class="form-check-input" name="os"
												    <c:forEach items='${systemList }' var='system' >
										  				<c:if test='${system.os eq os }'>
										  					checked
										  				</c:if>
									  				</c:forEach>
											     value="${os }">${os }
											  </label>
											</div>
										</c:forEach>
									</div>
								</div>
								
								<c:forEach items="${osList }" var="os">
									<c:set var="there" value="no"/>
								  <c:forEach items="${systemList }" var="system" >
									  <c:if test="${system.os eq os }">
										<c:set var="there" value="yes"/>
										<c:set var="sys" value="${system}"/>
								  	  </c:if>
								  </c:forEach>
								  <c:choose>
								  	<c:when test="${there eq 'yes' }">
								  		<div id="tableSYS${os}" style="display: block;">
										<table >
											<h3>${os }</h3>
											<tr>
												<td style="width: 400px;">
													<div class="form-group">
													  <label for="sel1">프로세서1</label>
													  <select class="form-control" name="processor1">
													  
													  <option value="${sys.processor1 }">${sys.processor1 }</option>
													  	<c:forEach items="${processorList }" var="processor">
														  	<c:if test="${processor.name ne sys.processor1 }">	
															    <option value="${processor.name }">${processor.name }</option>
															</c:if>
													    </c:forEach>
													  </select>
													</div>
												</td>
												<td style="width: 400px;">
													<div class="form-group">
													  <label for="sel1">프로세서2</label>
													  <select class="form-control" name="processor2">
													  <option value="${sys.processor2 }">${sys.processor2 }</option>
													  	<c:forEach items="${processorList }" var="processor">
														  	<c:if test="${processor.name ne sys.processor2 }">	
															    <option value="${processor.name }">${processor.name }</option>
															</c:if>
													    </c:forEach>
													  </select>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="form-group">
													  <label for="sel1">메모리(GB)</label>
													  <input type="text" value="${sys.memory }" class="form-control" name="memory">
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="form-group">
													  <label for="sel1">그래픽1</label>
													  <select class="form-control" name="graphic1">
													  	<option value="${sys.graphic1 }">${sys.graphic1 }</option>
													  	<c:forEach items="${graphicList }" var="graphic">
														  	<c:if test="${graphic.name ne sys.graphic1 }">	
															    <option value="${graphic.name }">${graphic.name }</option>
															</c:if>
													    </c:forEach>
													  </select>
													</div>
												</td>
												<td>
													<div class="form-group">
													  <label for="sel1">그래픽2</label>
													  <select class="form-control" name="graphic2">
													  	<option value="${sys.graphic2 }">${sys.graphic2 }</option>
													  	<c:forEach items="${graphicList }" var="graphic">
														  	<c:if test="${graphic.name ne sys.graphic2 }">	
															    <option value="${graphic.name }">${graphic.name }</option>
															</c:if>
													    </c:forEach>
													  </select>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="form-group">
													  <label for="sel1">DirectX</label>
													  <input type="text" value="${sys.directx }" class="form-control" name="directx">
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="form-group">
													  <label for="sel1">저장공간 (GB)</label>
													  <input type="text" value="${sys.disk }" class="form-control" name="disk">
													</div>
												</td>
											</tr>
										</table>
										<hr>
										</div>
								  	</c:when>
								  	<c:otherwise>
								  		<div id="tableSYS${os}" style="display: none;">
										<table >
											<h3>${os }</h3>
											<tr>
												<td style="width: 400px;">
													<div class="form-group">
													  <label for="sel1">프로세서1</label>
													  <select class="form-control" name="processor1">
													  	<c:forEach items="${processorList }" var="processor">
															    <option value="${processor.name }">${processor.name }</option>
													    </c:forEach>
													  </select>
													</div>
												</td>
												<td style="width: 400px;">
													<div class="form-group">
													  <label for="sel1">프로세서2</label>
													  <select class="form-control" name="processor2">
													  	<c:forEach items="${processorList }" var="processor">
															    <option value="${processor.name }">${processor.name }</option>
													    </c:forEach>
													  </select>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="form-group">
													  <label for="sel1">메모리(GB)</label>
													  <input type="text" class="form-control" name="memory">
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="form-group">
													  <label for="sel1">그래픽1</label>
													  <select class="form-control" name="graphic1">
													  	<c:forEach items="${graphicList }" var="graphic">
															    <option value="${graphic.name }">${graphic.name }</option>
													    </c:forEach>
													  </select>
													</div>
												</td>
												<td>
													<div class="form-group">
													  <label for="sel1">그래픽2</label>
													  <select class="form-control" name="graphic2">
													  	<c:forEach items="${graphicList }" var="graphic">
															    <option value="${graphic.name }">${graphic.name }</option>
													    </c:forEach>
													  </select>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="form-group">
													  <label for="sel1">DirectX</label>
													  <input type="text"  class="form-control" name="directx">
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="form-group">
													  <label for="sel1">저장공간 (GB)</label>
													  <input type="text"class="form-control" name="disk">
													</div>
												</td>
											</tr>
										</table>
										<hr>
										</div>
								  	</c:otherwise>
								  </c:choose>
								
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<section class="portfolio-block" style="padding: 50px;">
			<div class="row">
				<div class="col-md-5"></div>
				<div class="col-md-1"><button type="button" onclick="registGame();" class="btn btn-primary btn-lg" id="registBtn">저장</button></div>
				<div class="col-md-1"><button type="button" onclick="history.go(-1);" class="btn btn-secondary btn-lg">취소</button></div>
				<div class="col-md-5"></div>
				<br>
			</div>
		</section>
	</form>
</div>



<div class="container">


  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">태그 추가</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">

		
		<div class="form-group">
			 <label for="sel1">카테고리를 선택해주세요</label>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="newCate" placeholder="새로운 카테고리 태그 추가"><input type="button" onclick="createTag('category')" value="추가">
			  <div id="categoryTagDiv">
			  <c:forEach items="${categoryList }" var="category">
					<div class="form-check">
					  <label class="form-check-label">
					    <input type="checkbox" class="form-check-input" name="tagname" value="${category.tagname }">${category.tagname }
					  </label>
					</div>
			 </c:forEach>
			</div>
		</div>
		<div class="form-group">
		  <label for="sel1">기능을 선택해주세요</label>
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="newFunc" placeholder="새로운 기능 태그 추가"><input type="button" onclick="createTag('function')"  value="추가">
			  <div id="functionTagDiv">
			  <c:forEach items="${functionList }" var="function">
					<div class="form-check">
					  <label class="form-check-label">
					    <input type="checkbox" class="form-check-input" name="tagname" value="${function.tagname }">${function.tagname }
					  </label>
					</div>
				</c:forEach>
			</div>
		</div>

</div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick="selectTag();" data-dismiss="modal">저장</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>



  <%@ include file="gameModify_js2.jsp" %>
  <%@ include file="gameModify_js.jsp" %>
 </body>
  