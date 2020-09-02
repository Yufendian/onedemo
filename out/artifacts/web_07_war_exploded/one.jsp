<%@ page import="com.service.EmpService" %>
<%@ page import="com.service.ServiceFactory" %>
<%@ page import="com.pojo.Employees" %><%--
  Created by IntelliJ IDEA.
  User: 13035
  Date: 2020/7/22
  Time: 20:02
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
    String Empid = request.getParameter("empid");
    int empid = Integer.parseInt(Empid);
    String name = request.getParameter("Name");
    EmpService employeesService = ServiceFactory.getEmpService();
    if (Empid.equals("") && name.equals("")) {
        out.print("请输入数据");
    } else {
        if (employeesService.selectOneUser(empid, name)){
            Employees onecome = employeesService.selectone(empid, name);
        %>

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
    <tr>
        <td><%out.print(onecome.getEmpid());%></td>
        <td><%out.print(onecome.getUsername());%></td>
        <td><%out.print(onecome.getPassword());%></td>
        <td><%out.print(onecome.getTel());%></td>
        <td><%out.print(onecome.getName());%></td>
        <td><%out.print(onecome.getEmail());%></td>
        <td><%out.print(onecome.getEmptype());%></td>
    </tr>
</table>
<%
        } else {
            out.print("数据为空");
        }
    }

%>

</body>
</html>
