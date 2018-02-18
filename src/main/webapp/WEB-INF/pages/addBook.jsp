<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Добавление книги</title>
    <style type="text/css">
        body {
            margin: 5mm;
            background: white;
            font-family: Verdana, serif;
            font-size: 12px;
            text-align: center;
            line-height: 1cm;
        }

        .table {
            font-size: 12px;
            border: 1px black;
            background-color: #f1f1c1;
            border-collapse: collapse;
            font-family: Verdana, serif;
        }
    </style>
</head>
<body>
<h1 align="center">Внесите информацию о новой книге</h1>
<div align="center">
    <c:url var="saveAction" value="/bookmanager/save"/>
    <form:form action="${saveAction}" method="post" modelAttribute="book">
        <table class="table" border="1" align="center">
            <form:hidden path="id"/>
            <tr>
                <td>Название книги:</td>
                <td><form:input path="title" maxlength="100"/></td>
            </tr>
            <tr>
                <td>Описание:</td>
                <td><form:input path="description" maxlength="255"/></td>
            </tr>
            <tr>
                <td>Автор:</td>
                <td><form:input path="author" maxlength="100"/></td>
            </tr>
            <tr>
                <td>ISBN:</td>
                <td><form:input path="isbn" maxlength="20"/></td>
            </tr>
            <tr>
                <td>Год издания:</td>
                <td><form:input path="printYear" maxlength="4"/></td>
            </tr>
            <form:hidden path="readAlready"/>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Сохранить" class="button">
                    <a href="${pageContext.request.contextPath}/bookmanager/list"><input type="button"
                                                                                         value="Назад к списку"
                                                                                         class="button"></a>
                </td>
            </tr>
        </table>
    </form:form>
</div>

</body>
</html>
