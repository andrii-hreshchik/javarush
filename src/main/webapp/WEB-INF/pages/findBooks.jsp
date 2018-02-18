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
<c:if test="${listBooks.size() != 0}">
    <h1 align="center">Найденные книги</h1>
</c:if>
<div align="center">
    <table class="table" border="1" <c:if test="${listBooks.size() == 0}">hidden="hidden"</c:if>>
        <th>ID</th>
        <th>Название</th>
        <th>Описание</th>
        <th>Автор</th>
        <th>ISBN</th>
        <th>Год издания</th>
        <th>Статус</th>
        <th colspan="2">Действия</th>
        <c:forEach var="book" items="${listBooks}">
            <tr>
                <td align="center">${book.id}</td>
                <td>${book.title}</td>
                <td>${book.description}</td>
                <td>${book.author}</td>
                <td>${book.isbn}</td>
                <td align="center">${book.printYear}</td>
                <c:if test="${book.readAlready == true}">
                    <td align="center">Прочитана</td>
                </c:if>
                <c:if test="${book.readAlready == false}">
                    <td align="center">
                        Не прочитана
                        <a href="/bookmanager/updateread?id=${book.id}"><input type="button" align="center"
                                                                               value="Прочитано"></a>
                    </td>
                </c:if>
                <td>
                    <a href="/bookmanager/edit?id=${book.id}"><input type="button" align="center" value="Редактировать"></a>
                    <a href="/bookmanager/delete/${book.id}"><input type="button" align="center" value="Удалить"></a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${listBooks.size() == 0}">
        <h1>Такой книги нет в списке</h1>
    </c:if>
    <table>
        <tr>
            <td colspan="2" align="center">
                <a href="/bookmanager/search"><input type="submit" value="Назад к поиску" class="button"></a>
                <a href="/bookmanager/list"><input type="button" value="Назад к списку" class="button"></a>
            </td>
        </tr>
    </table>
</div>


</body>
</html>
