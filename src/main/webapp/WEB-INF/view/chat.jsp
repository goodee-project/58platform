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
						<div class="chat-sidebar-header">
							<div class="d-flex align-items-center">
								<div class="chat-user-online">
									<img src="/58platform/assets/images/avatars/avatar-1.png" width="45" height="45" class="rounded-circle" alt="" />
								</div>
								<div class="flex-grow-1 ms-2">
									<p class="mb-0">Rachel Zane</p>
								</div>
								<div class="dropdown">
									<div class="cursor-pointer font-24 dropdown-toggle dropdown-toggle-nocaret" data-bs-toggle="dropdown"><i class='bx bx-dots-horizontal-rounded'></i>
									</div>
									<div class="dropdown-menu dropdown-menu-end"> <a class="dropdown-item" href="javascript:;">Settings</a>
										<div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Help & Feedback</a>
										<a class="dropdown-item" href="javascript:;">Enable Split View Mode</a>
										<a class="dropdown-item" href="javascript:;">Keyboard Shortcuts</a>
										<div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Sign Out</a>
									</div>
								</div>
							</div>
							<div class="mb-3"></div>
							<div class="input-group input-group-sm"> <span class="input-group-text bg-transparent"><i class='bx bx-search'></i></span>
								<input type="text" class="form-control" placeholder="People, groups, & messages"> <span class="input-group-text bg-transparent"><i class='bx bx-dialpad'></i></span>
							</div>
							<div class="chat-tab-menu mt-3">
								<ul class="nav nav-pills nav-justified">
									<li class="nav-item">
										<a class="nav-link active" data-bs-toggle="pill" href="javascript:;">
											<div class="font-24"><i class='bx bx-conversation'></i>
											</div>
											<div><small>Chats</small>
											</div>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="pill" href="javascript:;">
											<div class="font-24"><i class='bx bx-phone'></i>
											</div>
											<div><small>Calls</small>
											</div>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="pill" href="javascript:;">
											<div class="font-24"><i class='bx bxs-contact'></i>
											</div>
											<div><small>Contacts</small>
											</div>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-bs-toggle="pill" href="javascript:;">
											<div class="font-24"><i class='bx bx-bell'></i>
											</div>
											<div><small>Notifications</small>
											</div>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="chat-sidebar-content">
							<div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade show active" id="pills-Chats">
									<div class="p-3">
										<div class="meeting-button d-flex justify-content-between">
											<div class="dropdown"> <a href="#" class="btn btn-white btn-sm radius-30 dropdown-toggle dropdown-toggle-nocaret" data-bs-toggle="dropdown"><i class='bx bx-video me-2'></i>Meet Now<i class='bx bxs-chevron-down ms-2'></i></a>
												<div class="dropdown-menu"> <a class="dropdown-item" href="#">Host a meeting</a>
													<a class="dropdown-item" href="#">Join a meeting</a>
												</div>
											</div>
											<div class="dropdown"> <a href="#" class="btn btn-white btn-sm radius-30 dropdown-toggle dropdown-toggle-nocaret" data-bs-toggle="dropdown" data-display="static"><i class='bx bxs-edit me-2'></i>New Chat<i class='bx bxs-chevron-down ms-2'></i></a>
												<div class="dropdown-menu dropdown-menu-right">	<a class="dropdown-item" href="#">New Group Chat</a>
													<a class="dropdown-item" href="#">New Moderated Group</a>
													<a class="dropdown-item" href="#">New Chat</a>
													<a class="dropdown-item" href="#">New Private Conversation</a>
												</div>
											</div>
										</div>
										<div class="dropdown mt-3"> <a href="#" class="text-uppercase text-secondary dropdown-toggle dropdown-toggle-nocaret" data-bs-toggle="dropdown">Recent Chats <i class='bx bxs-chevron-down'></i></a>
											<div class="dropdown-menu">	<a class="dropdown-item" href="#">Recent Chats</a>
												<a class="dropdown-item" href="#">Hidden Chats</a>
												<div class="dropdown-divider"></div>	<a class="dropdown-item" href="#">Sort by Time</a>
												<a class="dropdown-item" href="#">Sort by Unread</a>
												<div class="dropdown-divider"></div>	<a class="dropdown-item" href="#">Show Favorites</a>
											</div>
										</div>
									</div>
									<div class="chat-list">
										<div class="list-group list-group-flush">
											<a href="javascript:;" class="list-group-item">
												<div class="d-flex">
													<div class="chat-user-online">
														<img src="/58platform/assets/images/avatars/avatar-2.png" width="42" height="42" class="rounded-circle" alt="" />
													</div>
													<div class="flex-grow-1 ms-2">
														<h6 class="mb-0 chat-title">Louis Litt</h6>
														<p class="mb-0 chat-msg">You just got LITT up, Mike.</p>
													</div>
													<div class="chat-time">9:51 AM</div>
												</div>
											</a>
											<a href="javascript:;" class="list-group-item active">
												<div class="d-flex">
													<div class="chat-user-online">
														<img src="/58platform/assets/images/avatars/avatar-3.png" width="42" height="42" class="rounded-circle" alt="" />
													</div>
													<div class="flex-grow-1 ms-2">
														<h6 class="mb-0 chat-title">Harvey Specter</h6>
														<p class="mb-0 chat-msg">Wrong. You take the gun....</p>
													</div>
													<div class="chat-time">4:32 PM</div>
												</div>
											</a>
											<a href="javascript:;" class="list-group-item">
												<div class="d-flex">
													<div class="chat-user-online">
														<img src="/58platform/assets/images/avatars/avatar-4.png" width="42" height="42" class="rounded-circle" alt="" />
													</div>
													<div class="flex-grow-1 ms-2">
														<h6 class="mb-0 chat-title">Rachel Zane</h6>
														<p class="mb-0 chat-msg">I was thinking that we could...</p>
													</div>
													<div class="chat-time">Wed</div>
												</div>
											</a>
											<a href="javascript:;" class="list-group-item">
												<div class="d-flex">
													<div class="chat-user-online">
														<img src="/58platform/assets/images/avatars/avatar-5.png" width="42" height="42" class="rounded-circle" alt="" />
													</div>
													<div class="flex-grow-1 ms-2">
														<h6 class="mb-0 chat-title">Donna Paulsen</h6>
														<p class="mb-0 chat-msg">Mike, I know everything!</p>
													</div>
													<div class="chat-time">Tue</div>
												</div>
											</a>
											<a href="javascript:;" class="list-group-item">
												<div class="d-flex">
													<div class="chat-user-online">
														<img src="/58platform/assets/images/avatars/avatar-6.png" width="42" height="42" class="rounded-circle" alt="" />
													</div>
													<div class="flex-grow-1 ms-2">
														<h6 class="mb-0 chat-title">Jessica Pearson</h6>
														<p class="mb-0 chat-msg">Have you finished the draft...</p>
													</div>
													<div class="chat-time">9/3/2020</div>
												</div>
											</a>
											<a href="javascript:;" class="list-group-item">
												<div class="d-flex">
													<div class="chat-user-online">
														<img src="/58platform/assets/images/avatars/avatar-7.png" width="42" height="42" class="rounded-circle" alt="" />
													</div>
													<div class="flex-grow-1 ms-2">
														<h6 class="mb-0 chat-title">Harold Gunderson</h6>
														<p class="mb-0 chat-msg">Thanks Mike! :)</p>
													</div>
													<div class="chat-time">12/3/2020</div>
												</div>
											</a>
											<a href="javascript:;" class="list-group-item">
												<div class="d-flex">
													<div class="chat-user-online">
														<img src="/58platform/assets/images/avatars/avatar-9.png" width="42" height="42" class="rounded-circle" alt="" />
													</div>
													<div class="flex-grow-1 ms-2">
														<h6 class="mb-0 chat-title">Katrina Bennett</h6>
														<p class="mb-0 chat-msg">I've sent you the files for...</p>
													</div>
													<div class="chat-time">16/3/2020</div>
												</div>
											</a>
											<a href="javascript:;" class="list-group-item">
												<div class="d-flex">
													<div class="chat-user-online">
														<img src="/58platform/assets/images/avatars/avatar-10.png" width="42" height="42" class="rounded-circle" alt="" />
													</div>
													<div class="flex-grow-1 ms-2">
														<h6 class="mb-0 chat-title">Charles Forstman</h6>
														<p class="mb-0 chat-msg">Mike, this isn't over.</p>
													</div>
													<div class="chat-time">18/3/2020</div>
												</div>
											</a>
											<a href="javascript:;" class="list-group-item">
												<div class="d-flex">
													<div class="chat-user-online">
														<img src="/58platform/assets/images/avatars/avatar-11.png" width="42" height="42" class="rounded-circle" alt="" />
													</div>
													<div class="flex-grow-1 ms-2">
														<h6 class="mb-0 chat-title">Jonathan Sidwell</h6>
														<p class="mb-0 chat-msg">That's bullshit. This deal..</p>
													</div>
													<div class="chat-time">24/3/2020</div>
												</div>
											</a>
										</div>
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
							<div class="list-inline d-sm-flex mb-0 d-none"> <a href="javascript:;" class="list-inline-item d-flex align-items-center text-secondary"><small class='bx bxs-circle me-1 chart-online'></small>Active Now</a>
								<a href="javascript:;" class="list-inline-item d-flex align-items-center text-secondary">|</a>
								<a href="javascript:;" class="list-inline-item d-flex align-items-center text-secondary"><i class='bx bx-images me-1'></i>Gallery</a>
								<a href="javascript:;" class="list-inline-item d-flex align-items-center text-secondary">|</a>
								<a href="javascript:;" class="list-inline-item d-flex align-items-center text-secondary"><i class='bx bx-search me-1'></i>Find</a>
							</div>
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
		
		let sockJs = new SockJS("/stomp/chat"); // registerStompEndpoints - registry.addEndpoint("/stomp/chat")
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
            	console.log(content + "content");

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