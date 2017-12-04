<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head><title>404!</title></head>
<body>
<div style="
     width:100%;
     height:100% ;
     position: relative">
    <div style="
            width:100% ;
            height:100%;
            position: absolute;
            background: url(${pageContext.request.contextPath}/resources/images/errorPage/line.png);
            background-size:100%;
            ">

    </div>
    <div style="
            left: 45%;
            top: 40%;
            width:50% ;
            height:50%;
            position: absolute;
    <%--background: url(${pageContext.request.contextPath}/resources/images/errorPage/Plane.png);--%>
            background-size:50%;

            ">
        <img src="${pageContext.request.contextPath}/resources/images/errorPage/Plane.png">


    </div>
    <div>
        <p><span
                style="
    left: 30%;
    top: 23%;
    font-size:400px ;
    position: absolute;
    ">
    404
    </span></p>
    </div>
    <div style="
    left: 35%;
    top: 70%;
    font-size:36px ;
    position: absolute;
    ">
        <p>
            <span>
                Sorry,We could not find the page.
            </span>
        </p>
    </div>
    <div style="
    left: 35%;
    top: 80%;
    font-size:36px ;
    position: absolute;
    ">
        <p>
            <span>
             <a href="${pageContext.request.contextPath}/home" style="color: #2671de">
                 <span ></span> Click here to go back home.
             </a>
            </span>
        </p>
    </div>
</div>
</body>
</html>