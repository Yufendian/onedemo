<%@ page import="java.util.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.Emp" %>
<%@ page import="com.service.EmpService" %>
<%@ page import="com.service.ServiceFactory" %>
<%@ page import="com.pojo.Employees" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1>JSP语法</h1>
<%!
    public int add(int x, int y) {
        return x + y;
    }
%>
<%
    int a = 5;
    String str = "杰哥";
    Emp emp = new Emp(1001, "蔡徐坤");
    System.out.print("你\n好n");
    out.print(a);
    out.print(str);
    out.print("你<br/>好");
    out.println(add(5, 6) + "<br/>");
    List<String> list = new ArrayList<>();
    list.add("苹果");
    list.add("香蕉");
    list.add("西瓜");
    for (String s : list) {%>
<%=s%><br/>
<%
    }
%>
<%
    EmpService employeesService = ServiceFactory.getEmpService();
    List<Employees> list1 = employeesService.selectAll();
    %>

<%=str%>
<%=add(5, 6) + "<br/>" + 2%>
<%=emp%>

<h2>表单提交和表单数据收集</h2>
<form action="forward.jsp" method="post">
    编号：<input type="text" name="empno"><br>
    姓名：<input type="text" name="ename"><br>
    性别：<input type="radio" value="男" name="sex">男
    <input type="radio" value="女" name="sex">女<br>
    学历：<select name="education">
    <option>专科</option>
    <option>本科</option>
    </select><br>
    选修：
    <input type="checkbox" value="JS" name="course" checked>JS
    <input type="checkbox" value="CSS" name="course">CSS
    <input type="checkbox" value="DIV" name="course">DIV
    <input type="checkbox" value="spring" name="course">spring<br>
    自我评价：<br>
    <textarea rows="10" cols="30" name="content">感觉不错</textarea><br>
    <input type="submit" value="提交">
    <a href="show.jsp?empno=1002&ename=赵露思">链接</a>
</form>
<br><br>
<form action="msg.jsp" method="post">
    Username：<input type="text" name="username"><br>
    Password：<input type="text" name="password"><br>
    Tel：<input type="text" name="tel"><br>
    Name    ：<input type="text" name="name"><br>
    Email   ：<input type="text" name="email"><br>
    Emptype ：<input type="text" name="emptype"><br>
    <input type="submit" value="提交"><br><br>
<%--    <input type="button" value="查询" onclick="aaa()">--%>
    <table height="50">
        <tr>
            <td width="500">Empid</td>
            <td width="500">Username</td>
            <td width="500">Password</td>
            <td width="500">Tel</td>
            <td width="500">Name</td>
            <td width="500">Email</td>
            <td width="500">Emptype</td>
        </tr>
        <%
            for (Employees e:list1) {
        %>
        <tr>
            <td><%out.print(e.getEmpid());%></td>
            <td><%out.print(e.getUsername());%></td>
            <td><%out.print(e.getPassword());%></td>
            <td><%out.print(e.getTel());%></td>
            <td><%out.print(e.getName());%></td>
            <td><%out.print(e.getEmail());%></td>
            <td><%out.print(e.getEmptype());%></td>
        </tr>
        <%
            }
        %>
    </table>




</form>

<form action="one.jsp" method="post">
    Empid：<input type="text" name="empid"><br>
    Name：<input type="text" name="Name"><br>
    <input type="submit" value="搜索"><br><br>
</form>



</body>
</html>
