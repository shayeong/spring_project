<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><tiles:getAsString name="title"/></title>
    <!-- Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta2/css/bootstrap.min.css">
    <!-- Custom CSS styles for the sidebar -->
    <style>
        body {
            display: flex;
            min-height: 100vh;
            margin: 0;
            flex-direction: column;
        }

        .container-fluid {
            display: flex;
            flex: 1;
        }

        .sidebar {
            width: 280px;
            position: fixed;
            height: 100%;
            background-color: #f8f9fa; /* Set your desired sidebar background color */
        }

        .main-content {
            flex: 1;
            margin-left: 280px; /* Set the same width as the sidebar */
            padding: 15px;
        }
    </style>
</head>

<body>

<!-- Container for sidebar and main content -->
<div class="container-fluid">
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- 상단 메뉴 -->
        <tiles:insertAttribute name="header"/>
        <!-- 상단 메뉴 끝 -->
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- 내용 시작 -->
        <tiles:insertAttribute name="body"/>
        <!-- 내용 끝 -->
    </div>
</div>

<!-- Bootstrap JS and Popper.js scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta2/js/bootstrap.min.js"></script>

</body>
</html>
