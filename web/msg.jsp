<%@ page import="com.pojo.Employees" %>
<%@ page import="com.service.EmpService" %>
<%@ page import="com.service.ServiceFactory" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 13035
  Date: 2020/7/22
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String tel = request.getParameter("tel");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String emptype = request.getParameter("emptype");

    Employees employees = new Employees();
    employees.setUsername(username);
    employees.setPassword(password);
    employees.setTel(tel);
    employees.setName(name);
    employees.setEmail(email);
    employees.setEmptype(emptype);
    EmpService employeesService = ServiceFactory.getEmpService();
    if (username.equals("")&&password.equals("")&&tel.equals("")&&name.equals("")&&emptype.equals("")){
        out.print("添加失败，缺少数据");
    }else {
        employeesService.insert(employees);
    }
//    List<Employees> list1 = employeesService.selectAll();
    response.sendRedirect("index.jsp");


%>
<%--<table height="50">--%>
<%--    <tr>--%>
<%--        <td width="500">Empid</td>--%>
<%--        <td width="500">Username</td>--%>
<%--        <td width="500">Password</td>--%>
<%--        <td width="500">Tel</td>--%>
<%--        <td width="500">Name</td>--%>
<%--        <td width="500">Email</td>--%>
<%--        <td width="500">Emptype</td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        for (Employees e:list1) {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%out.print(e.getEmpid());%></td>--%>
<%--        <td><%out.print(e.getUsername());%></td>--%>
<%--        <td><%out.print(e.getPassword());%></td>--%>
<%--        <td><%out.print(e.getTel());%></td>--%>
<%--        <td><%out.print(e.getName());%></td>--%>
<%--        <td><%out.print(e.getEmail());%></td>--%>
<%--        <td><%out.print(e.getEmptype());%></td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--    <br>--%>
<%--    <form action="index.jsp" method="post">--%>
<%--        <input type="submit" value="提交"><br><br>--%>
<%--    </form>--%>
<%--</table>--%>
</body>
</html>
