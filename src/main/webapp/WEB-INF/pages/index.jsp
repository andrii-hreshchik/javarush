<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<html>
<head>
    <meta http-equiv="refresh" content="5; url=bookmanager/list">
    <title>Book Manager</title>
    <style type="text/css">
        .main {
            color: #000000;
            text-align: center;
            line-height: 5cm;
            font-family: 'Verdana', serif;
            font-size: 36px;
            font-weight: bold;
        }

        .page {
            color: #000000;
            text-align: center;
            font-family: 'Verdana', serif;
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="main">
    <b>Book Manager</b>
</div>

<div class="page">
    <p align="center">
        Вы будете перенаправлены к списку книг через 10 секунд
    </p>
    <p align="center">
        <button onclick="location.href='bookmanager/list'">Перейти сейчас</button>
    </p>
</div>
</body>
</html>
