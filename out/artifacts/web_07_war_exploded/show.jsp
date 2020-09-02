<%--
  Created by IntelliJ IDEA.
  User: 13035
  Date: 2020/7/22
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>表单数据收集</h2>
<%
    // 设置字符集utf-8，解决中文乱码问题
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    // 内置对象 out request response
    String empno = request.getParameter("empno");
    String ename = request.getParameter("ename");
    String courses[] = request.getParameterValues("course");
    String sex = request.getParameter("sex");
    String education = request.getParameter("education");
    String content = request.getParameter("content");


%>
<%=empno + "\t" + ename%>
<%=sex%>
<%=education%><br>
<%
    if (courses!=null) {
        for (String c : courses) {
            out.print(c + "<br>");
        }
    }else {
        out.print("null");
    }
%>
<%=content%>


</body>
</html>
