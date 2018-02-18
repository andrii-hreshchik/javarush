<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Список книг</title>
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
<div align="left">
    <h1>Ваши книги</h1>
    <c:url var="addAction" value="/bookmanager/add"/>
    <c:url var="searchAction" value="/bookmanager/search"/>
    <c:url var="searchForUnreadAction" value="/bookmanager/findunread"/>
    <table>
        <tr>
            <td>
                <form:form action="${searchAction}" method="get">
                    <input type="submit" value="Поиск книги" class="button">
                </form:form>
            </td>
            <td>
                <form:form action="${addAction}" method="get">
                    <input type="submit" value="Добавить книгу" class="button">
                </form:form>
            </td>
            <td>
                <form:form action="${searchForUnreadAction}" method="post">
                    <input type="submit" value="Показать непрочитанные" class="button">
                </form:form>
            </td>
        </tr>
    </table>
    <table class="table" border="1">

        <th>ID</th>
        <th>Название</th>
        <th>Описание</th>
        <th>Автор</th>
        <th>ISBN</th>
        <th>Год издания</th>
        <th>Статус</th>
        <th colspan="2">Действия</th>
        <c:forEach var="book" items="${listBook}">
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
    <div id="pagination">
        <c:url value="/bookmanager/list" var="prev">
            <c:param name="page" value="${page-1}"/>
        </c:url>
        <c:if test="${page > 1}">
            <a href="<c:out value="${prev}"/>" class="nextprev"> < </a>
        </c:if>

        <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
            <c:choose>
                <c:when test="${page == i.index}">
                    <span class="nextprev">${i.index}</span>
                </c:when>
                <c:otherwise>
                    <c:url value="/bookmanager/list" var="url">
                        <c:param name="page" value="${i.index}"/>
                    </c:url>
                    <a href='<c:out value="${url}" />' class="nextprev">${i.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:url value="/bookmanager/list" var="next">
            <c:param name="page" value="${page + 1}"/>
        </c:url>
        <c:if test="${page + 1 <= maxPages}">
            <a href='<c:out value="${next}" />' class="nextprev"> > </a>
        </c:if>
    </div>
</div>
</body>
</html>
