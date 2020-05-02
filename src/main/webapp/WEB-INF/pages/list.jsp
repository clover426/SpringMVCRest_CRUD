<%--
  Created by IntelliJ IDEA.
  User: 单少宝宝
  Date: 2020/5/1
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  isErrorPage="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%
    pageContext.setAttribute("ctp",request.getContextPath());
%>
<head>
    <title>员工列表</title>
    <script type="text/javascript" src="${ctp}/scripts/jquery-1.9.1.min.js"></script>
</head>
<body>

    <h1>员工列表</h1>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>lastName</th>
            <th>email</th>
            <th>gender</th>
            <th>departmentName</th>
            <th>EDIT</th>
            <th>DELETE</th>
        </tr>
        <c:forEach items="${emps}" var="emp">
            <tr>
                <td>${emp.id}</td>
                <td>${emp.lastName}</td>
                <td>${emp.email}</td>
                <td>${emp.gender==0?"女":"男"}</td>
                <td>${emp.department.departmentName}</td>
                <td>
                    <a href="${ctp}/emp/${emp.id}">edit</a>
                </td>
                <td>
                    <a href="${ctp}/emp/${emp.id}" class="delBtn">delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="toaddpage">添加员工</a>
    <form id="deleteForm" action="${ctp}/emp/${emp.id}" method="post">
        <input type="hidden" name="_method" value="DELETE"/>
    </form>
    <script type="text/javascript">
        $(function () {
            $(".delBtn").click(function () {
                //0.确定删除？
                //1.改变表单的action指向
                $("#deleteForm").attr("action",this.href);
                //2.提交表单
                $("#deleteForm").submit();
                return false;
            });
        });
    </script>
</body>
</html>
