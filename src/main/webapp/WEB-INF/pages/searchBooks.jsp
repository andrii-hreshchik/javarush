<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Поиск книг</title>
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
<h1 align="center">Поиск книги по названию</h1>
<div align="center">
    <c:url var="searchAction" value="/bookmanager/findbooksbytitle"/>

    <form:form action="${searchAction}" method="post" modelAttribute="book">
        <table class="table" border="1" align="center">
            <tr>
                <td>Введите название книги:</td>
                <td><form:input path="title"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Найти" class="button">
                    <a href="/bookmanager/list"><input type="button" value="Назад к списку" class="button"></a>
                </td>
            </tr>
        </table>

    </form:form>
</div>
</body>
</html>
