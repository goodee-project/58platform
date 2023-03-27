<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="semi-dark">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="/58platform/assets/images/favicon-32x32.png" type="image/png" />
  <!--plugins-->
  <link href="/58platform/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
  <link href="/58platform/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
  <link href="/58platform/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
  <!-- Bootstrap CSS -->
  <link href="/58platform/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/58platform/assets/css/bootstrap-extended.css" rel="stylesheet" />
  <link href="/58platform/assets/css/style.css" rel="stylesheet" />
  <link href="/58platform/assets/css/icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

  <!-- loader-->
	<link href="/58platform/assets/css/pace.min.css" rel="stylesheet" />
	


  <!--Theme Styles-->
  <link href="/58platform/assets/css/dark-theme.css" rel="stylesheet" />
  <link href="/58platform/assets/css/light-theme.css" rel="stylesheet" />
  <link href="/58platform/assets/css/semi-dark.css" rel="stylesheet" />
  <link href="/58platform/assets/css/header-colors.css" rel="stylesheet" />

  <title>chat</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="/58platform/webjars/sockjs-client/1.5.1/sockjs.min.js"></script>
  <script src="/58platform/webjars/webstomp-client/1.2.6/dist/webstomp.min.js"></script>
</head>

<body>


	<!--start wrapper-->
	<div class="wrapper">
		<!--start header -->
		<c:import url="/WEB-INF/inc/header.jsp"></c:import>
		<!--end header -->
		
		<!--start sidebar -->
		<c:import url="/WEB-INF/inc/sideMenu.jsp"></c:import>
		<!--end sidebar -->
			<!--start content-->
			<main class="page-content">
				<div class="chat-wrapper">
					<div class="chat-sidebar">
						<div class="chat-sidebar-content">
							<div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade show active" id="pills-Chats">
									<div class="p-3">
										<div class="meeting-button d-flex justify-content-between">
											<div class="input-group input-group-sm"> <span class="input-group-text bg-transparent"><i class='bx bx-search'></i></span>
												<input type="text" class="form-control" placeholder="People, groups, & messages"> <span class="input-group-text bg-transparent"><i class='bx bx-dialpad'></i></span>
											</div>										
										</div>
										<div class="dropdown mt-3"> <a href="#" class="text-uppercase text-secondary dropdown-toggle dropdown-toggle-nocaret btn btn-white btn-sm radius-5" data-bs-toggle="dropdown">Recent Chats <i class='bx bxs-chevron-down'></i></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#">Recent Chats</a>
												<a class="dropdown-item" href="#">Hidden Chats</a>
												<div class="dropdown-divider"></div>	<a class="dropdown-item" href="#">Sort by Time</a>
												<a class="dropdown-item" href="#">Sort by Unread</a>
												<div class="dropdown-divider"></div>	<a class="dropdown-item" href="#">Show Favorites</a>
											</div>
												<form action="${pageContext.request.contextPath}/employee/question/chat" method="post">
											            <input class="btn btn-white btn-sm radius-30" style="float:right;" type="submit" value="New Chat">
<!-- 											<a href="#" class="btn btn-white btn-sm radius-30" style="float:right;"><i class='bx bxs-edit me-2'></i>New Chat</a> -->
											    </form>
										</div>
									</div>
									<div class="chat-list" id="chat-sidebar-list-wrapper">
										<ul class="list-group list-group-flush" id="chat-list">
            								<c:forEach var="rl" items="${roomList}">
            									<li>
													<a href="${pageContext.request.contextPath}/employee/question/chat?chattingRoomNo=${rl.chattingRoomNo}" class="list-group-item">
														<div class="d-flex">
															<div class="chat-user-online">
																<img src="/58platform/assets/images/avatars/avatar-2.png" width="42" height="42" class="rounded-circle" alt="" />
															</div>
															<div class="flex-grow-1 ms-2">
																<h6 class="mb-0 chat-title">${rl.chattingRoomNo} : ${rl.fromId}</h6>
																<p class="mb-0 chat-msg">${rl.chattingMemo}</p>
															</div>
															<div class="chat-time">${rl.updatedate}</div>
														</div>
													</a>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="chat-header d-flex align-items-center">
						<div class="chat-toggle-btn"><i class='bx bx-menu-alt-left'></i>
						</div>
						<div>
							<h4 class="mb-1 font-weight-bold">${chattingRoomNo}</h4>
						</div>
						<div class="chat-top-header-menu ms-auto">
							<a href="javascript:;"><i class='bx bx-user-plus'></i></a>
						</div>
					</div>
					
					
					<!-- chat -->					
					<input type="hidden" value="${chattingRoomNo}" id="chattingRoomNo">
					<input type="hidden" value="${sessionScope.login}" id="login">
					<div class="chat-content" id="msgArea">						
            			<c:forEach var="cl" items="${chatList}">
							<c:if test="${sessionScope.login != cl.fromId}">						
								<div class="chat-content-leftside">
									<div class="d-flex">
										<img src="/58platform/assets/images/avatars/avatar-3.png" width="48" height="48" class="rounded-circle" alt="" />
										<div class="flex-grow-1 ms-2">
											<p class="mb-0 chat-time">${cl.fromId}, ${cl.createdate}</p>
											<p class="chat-left-msg">${cl.chattingMemo}</p>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${sessionScope.login == cl.fromId}">						
								<div class="chat-content-rightside">
									<div class="d-flex ms-auto">
										<div class="flex-grow-1 me-2">
											<p class="mb-0 chat-time text-end">${cl.fromId}, ${cl.createdate}</p>
											<p class="chat-right-msg">${cl.chattingMemo}</p>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="chat-footer d-flex align-items-center">
						<div class="flex-grow-1 pe-2">
							<div class="input-group">	<span class="input-group-text"><i class='bx bx-smile'></i></span>
								<input type="text" id="msg" class="form-control" placeholder="Type a message">
								<button class="btn btn-secondary" type="button" id="button-send">Button</button>
							</div>
						</div>
						<div class="chat-footer-menu"> <a href="javascript:;"><i class='bx bx-file'></i></a>
							<a href="javascript:;"><i class='bx bx-dots-horizontal-rounded'></i></a>
						</div>
					</div>
					<!--start chat overlay-->
					<div class="overlay chat-toggle-btn-mobile"></div>
					<!--end chat overlay-->
				</div>
			</main>
       <!--end page main-->


       <!--start overlay-->
        <div class="overlay nav-toggle-icon"></div>
       <!--end overlay-->

        <!--Start Back To Top Button-->
        <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
        <!--End Back To Top Button-->
  </div>
  <!--end wrapper-->
	
  <script>
	$(document).ready(function(){		
		const chattingRoomNo = $("#chattingRoomNo").val();
		const username = $("#login").val();
		
		console.log("chattingRoomNo: " + chattingRoomNo);
		console.log("username: " + username);
		
		/* const websocket = new WebSocket("ws://localhost:8080/ws/chat");
		console.log("websocket");
		console.log(websocket); */
		// console.log(websocket);
		
		let sockJs = new SockJS("/58platform/stomp/chat"); // registerStompEndpoints - registry.addEndpoint("/stomp/chat")
		// var sockJs = new SockJS("http://localhost:8080/ws/chat", null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]});
		console.log("sockJs");
		console.log(sockJs);
		
		var stomp = webstomp.over(sockJs);
		console.log(stomp);
		
		
		// 2. connection이 이루어지면 실행할 콜백함수
		stomp.connect({}, function(){
			console.log("STOMP connected!");
			//3. send(path, header, chattingMemo)로 메세지를 보낼 수 있음
            stomp.send('/pub/chat/enter', JSON.stringify({chattingRoomNo: chattingRoomNo, fromId: username}));
			
			//4. subscribe(path, callback)으로 메세지를 받을 수 있음
            stomp.subscribe("/sub/chat?chattingRoomNo=" + chattingRoomNo, function (chat) {
            	console.log("subscribe!!!");
            	console.log("chat");
            	console.log(chat.body);
            	
                var content = JSON.parse(chat.body);
            	console.log(content);

                var fromId = content.fromId;
                let chattingMemo = content.chattingMemo;
                let createdate = content.createdate;
                console.log("SUBSCRIBE")
                console.log(fromId + ": " + chattingMemo);
                var str = '';

                if(fromId != username){
                    str = '<div class="chat-content-leftside">';
                    str += '<div class="d-flex">';
                    str += '<img src="assets/images/avatars/avatar-3.png" width="48" height="48" class="rounded-circle" alt="" />';
                    str += '<div class="flex-grow-1 ms-2">';
                    str += '<p class="mb-0 chat-time">' + fromId + ', ' + createdate + '</p>';
                    str += '<p class="chat-left-msg">' + chattingMemo + '</p>';
                    str += '</div></div></div>';
                } else {
                    str = '<div class="chat-content-rightside">';
                    str += '<div class="d-flex ms-auto">';
                    str += '<div class="flex-grow-1 me-2">';
                    str += '<p class="mb-0 chat-time text-end">' + fromId + ', ' + createdate + '</p>';
                    str += '<p class="chat-right-msg">' + chattingMemo + '</p>';
                    str += '</div></div></div>';
                }                
                
                $("#msgArea").append(str);
			}); 
			
	        $("#button-send").on("click", function(e){
                var msg =  $("#msg").val();
                console.log(username + ":" + msg);
                
                stomp.send('/pub/chat/message', JSON.stringify({chattingRoomNo: chattingRoomNo, chattingMemo: msg, fromId: username}));
                $("#msg").val('');
            });	        
	     	// 엔터키를 누르면 submit 버튼이 눌리도록
	        $("#msg").keyup(function(event) {
				if (event.which === 13) {
					// console.log("enter key pressed!");
    				$("#button-send").click();
				}
			});
        });
	});
  </script>

  <!-- Bootstrap bundle JS -->
  <script src="/58platform/assets/js/bootstrap.bundle.min.js"></script>
  <!--plugins-->
  <script src="/58platform/assets/js/jquery.min.js"></script>
  <script src="/58platform/assets/plugins/simplebar/js/simplebar.min.js"></script>
  <script src="/58platform/assets/plugins/metismenu/js/metisMenu.min.js"></script>
  <script src="/58platform/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
  <script src="/58platform/assets/js/pace.min.js"></script>
  <!--app-->
  <script src="/58platform/assets/js/app.js"></script>
  <script src="/58platform/assets/js/app-chat-box.js"></script>
</body>
</html>