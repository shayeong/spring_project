<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<c:set var="root" value="${pageContext.request.contextPath }"/>
 <c:choose>
    <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
        <c:set var="str">관리자 페이지 입니다.</c:set>
    </c:when>
    <c:when test="${not empty sessionScope.id && sessionScope.grade != 'A'}">
        <c:set var='str'>안녕하세요 ${sessionScope.mname}(${sessionScope.id }) 님!</c:set>
    </c:when>
    <c:otherwise>
        <c:set var="str">기본 페이지 입니다.</c:set>
    </c:otherwise>
</c:choose> 
<!DOCTYPE html>	
<html lang="en">
<head>
  <title>shop</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <script src="https://kit.fontawesome.com/71c72323b0.js" crossorigin="anonymous"></script>
<style type="text/css">
  #grade {
    color: white;
  }
  body {
    font-family: 'Arial', sans-serif;
    margin: 0; /* Remove default margin */
  }

  .navbar {
    padding: 15px; /* Add padding */
  }

  .vertical-nav {
    width: 200px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    background-color: #343a40;
    padding-top: 20px;
    /* z-index: 1; Remove or set to 0 */
  }

  .vertical-nav a {
    display: block;
    padding: 15px;
    color: #fff;
    text-decoration: none;
    transition: background-color 0.3s;
  }

  .vertical-nav a:hover {
    background-color: #555;
  }

  .content {
    margin-left: 200px;
    padding: 16px;
  }
</style>


  <script type="text/javascript">
    function getCategory(){
      return fetch("/contents/getCategory")
                      .then(response => response.json());
    }
    window.onload=function(){
      getCategory()
        .then(data => {  
          console.log(data);
          for (let i = 0; i < data.length; i++) {
            $('#pmenu').append("<li><a  class='dropdown-item' href='/contents/mainlist/"+data[i].cateno+"'>" + data[i].catename + "</a></li>");
          }                  
        }).catch(console.log);
    };
    function updateM(){
      var url = "/member/update";
      url += "?id=${dto.id}";
      location.href = url;
    }  
  </script>
</head>
<body>
    <nav class="d-flex flex-column p-3 bg-white" style="width: 280px;">
        <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
            <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
            <span class="fs-5 fw-semibold">HOME</span>
        </a>
        <ul class="list-unstyled ps-0">
            <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#home-collapse" aria-expanded="false">
                    STORE
                </button>
                <div class="collapse" id="home-collapse" style="">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-dark rounded">OUTER</a></li>
                        <li><a href="#" class="link-dark rounded">TOP</a></li>
                        <li><a href="#" class="link-dark rounded">BOTTOM</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#dashboard-collapse" aria-expanded="false">
                    COLLECTION
                </button>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#orders-collapse" aria-expanded="false">
                   COMMUNITY
                </button>
                <div class="collapse" id="orders-collapse" style="">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-dark rounded">NOTICE</a></li>
                        <li><a href="#" class="link-dark rounded">Q & A</a></li>
                    </ul>
                </div>             
            </li>
            
        </ul>

        <!-- JSTL 코드 추가 -->
        <c:choose>
            <c:when test="${empty sessionScope.id }">
                <ul class="list-unstyled ps-0 mt-auto">
                    <li class="mb-1">
                		<a class="btn btn-primary w-100" id="grade" href="#"><i class="fa-solid fa-cat"></i> ${str}</a>
            		</li>
                    <li class="mb-1">
                        <a href="${root}/member/agree" class="btn btn-primary w-100"><i
                                class="fa-solid fa-user-plus"></i> Sign Up</a>
                    </li>
                    <li class="mb-1">
                        <a href="${root}/member/login" class="btn btn-primary w-100"><i
                                class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
                    </li>
                </ul>
            </c:when>
            <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
                <ul class="list-unstyled ps-0 mt-auto">
					<li class="mb-1">
                		<a class="btn btn-primary w-100" id="grade" href="#"><i class="fa-solid fa-cat"></i> ${str}</a>
            		</li>
                    <li class="mb-1">
                        <a href="${root}/admin/contents/create" class="btn btn-primary w-100"><i
                                class="fa-brands fa-shopify"></i> 상품등록</a>
                    </li>
                    <li class="mb-1">
                        <a href="${root}/contents/list" class="btn btn-primary w-100"><i
                                class="fa-brands fa-shopify"></i> 상품목록</a>
                    </li>
                    <li class="mb-1">
                        <a href="${root}/admin/member/list" class="btn btn-primary w-100"><i
                                class="fa-solid fa-user-group"></i> 회원목록</a>
                    </li>
                    <li class="mb-1">
                        <a href="${root}/member/logout" class="btn btn-primary w-100"><i
                                class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
                    </li>
                </ul>
            </c:when>
            <c:otherwise>
                <ul class="list-unstyled ps-0 mt-auto">
                	<li class="mb-1">
                		<a class="btn btn-primary w-100" id="grade" href="#"><i class="fa-solid fa-cat"></i> ${str}</a>
            		</li>
                    <li class="mb-1">
                        <a href="${root}/cart/list" class="btn btn-primary w-100"><i class="bi bi-cart4"></i> Cart</a>
                    </li>
                    <li class="mb-1">
                        <a href="${root}/member/update/${sessionScope.id}/" class="btn btn-primary w-100"><i
                                class="fa-solid fa-user-pen"></i> 정보 수정</a>
                    </li>
                    <li class="mb-1">
                        <a href="${root}/member/logout" class="btn btn-primary w-100"><i
                                class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
                    </li>
                </ul>
            </c:otherwise>
        </c:choose>
    </nav>

    <!-- Bootstrap JS and Popper.js scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta2/js/bootstrap.min.js"></script>
</body>

</html>
<!-- 

 -->


<!--
<nav class="navbar navbar-expand-sm">
  <div class="container-fluid">
    <a class="navbar-brand" href="/"><i class="bi bi-shop"> </i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse">
      <div class="vertical-nav">
        <ul class="navbar-nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="/"><i class="fa-solid fa-shirt"></i></a>
          </li> 
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Product</a>
            <ul class="dropdown-menu" id="pmenu">
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Community</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="${root}/member/mypage">Mypage</a></li>
              <li><a class="dropdown-item" href="${root}/contents/detail">Review</a></li>
              <li><a class="dropdown-item" href="${root}/notice/list">Notice</a></li>
              <li><a class="dropdown-item" href="#">Q&A</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="grade" href="#"><i class="fa-solid fa-cat"></i> ${str}</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${root}/cart/list"><i class="bi bi-cart4"></i> Cart</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${root}/member/update/${sessionScope.id}/"><i class="fa-solid fa-user-pen"></i> 정보 수정</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${root}/member/login"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${root}/member/logout"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
          </li>
        </ul>
      </div>
      <ul class="navbar-nav ms-auto">
      </ul>
    </div>
  </div>
</nav>
 -->








  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

<!-- 
<nav class="navbar navbar-expand-sm bg-dark navbar-dark flex-column fixed-start">
  <div class="container-fluid">
    <a class="navbar-brand" href="/"><i class="bi bi-shop"> </i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/"><i class="fa-solid fa-shirt"></i></a>
        </li> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Product</a>
          <ul class="dropdown-menu" id="pmenu">
  
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Community</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${root}/member/mypage">Mypage</a></li>
            <li><a class="dropdown-item" href="${root}/contents/detail">Review</a></li>
            <li><a class="dropdown-item" href="${root}/notice/list">Notice</a></li>
            <li><a class="dropdown-item" href="#">Q&A</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="grade" href="#"><i class="fa-solid fa-cat"></i> ${str}</a>
        </li>
      </ul>
        <ul class="navbar-nav ms-auto">
        <c:choose>
            <c:when test="${empty sessionScope.id }">
        <li class="nav-item">
            <a href="${root}/member/agree" class="nav-link m-2"><i class="fa-solid fa-user-plus"></i> Sign Up</a>
        </li>
        <li class="nav-item">
            <a href="${root}/member/login" class="nav-link m-2 "><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
        </li>
        
        </c:when>
        <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
        <li class="nav-item">
            <a href="${root}/admin/contents/create" class="nav-link m-2 "><i class="fa-brands fa-shopify"></i> 상품등록</a>
        </li>
        <li class="nav-item">
    		<a href="${root}/contents/list" class="nav-link m-2 "><i class="fa-brands fa-shopify"></i> 상품목록</a>
		</li>
        <li class="nav-item">
            <a href="${root}/admin/member/list" class="nav-link m-2 "><i class="fa-solid fa-user-group"></i> 회원목록</a>
        </li>
        <li class="nav-item">
            <a href="${root}/member/logout" class="nav-link m-2 "><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
        </li>
        </c:when>
        <c:otherwise>
        <li class="nav-item">
            <a href="${root}/cart/list" class="nav-link m-2 "><i class="bi bi-cart4"></i> Cart</a>
        </li>
        <li class="nav-item">
           <a href="${root}/member/update/${sessionScope.id}/" class="nav-link m-2 "><i class="fa-solid fa-user-pen"></i> 정보 수정</a>
        </li>
        <li class="nav-item">
            <a href="${root}/member/logout" class="nav-link m-2 "><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
        </li>
         </c:otherwise>
       </c:choose> 
     </ul>
    </div>
  </div>
</nav>
 -->