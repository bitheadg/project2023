<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read detail</title>
</head>
<body>
<table border="1">
    <tr>
        <th>제목</th>
        <td>${bbsVo.subject}</td>
    </tr>
    <tr>
        <th>최초작성자</th>
        <td>${bbsVo.create_user}</td>
    </tr>
    <tr>
        <th>이후작성자</th>
        <td>${bbsVo.update_user}</td>
    </tr>
    <tr>
        <th>Content</th>
        <td>${bbsVo.content}</td>
    </tr>
</table>
<div>
    <a href="<c:url value="/bbs/modify/${bbsVo.bbs_id}"/>">Modify</a>
    <a href="<c:url value="/bbs/list"/>">목록</a>
    <a href="<c:url value="/bbs/remove/${bbsVo.bbs_id}"/>">삭제</a>
</div>
</body>
</html>