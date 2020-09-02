<%--
  Created by IntelliJ IDEA.
  User: 13035
  Date: 2020/7/22
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // 对比两种跳转区别

    // 转发，地址栏的地址不改变，参数传递继续
    request.getRequestDispatcher("show.jsp").forward(request,response);

    // 重定向，地址栏的地址会改变，不继续传递参数
    //response.sendRedirect("show.jsp");

%>
</body>
</html>
