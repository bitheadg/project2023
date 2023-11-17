<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Posting</title>
</head>
<body>

<%-- form 태그에 action 정보가 없어도 Spring이 브라우저 창을 참고해서 자동으로 action정보를 설정==> 현재 페이지 호출시에만 --%>
<!-- Unable to find setter method for attribute: [commandName]==> commandName는 스프링 5.0 이후 사라짐, use modelAttribute
Neither BindingResult nor plain target object for bean name 'bbsVo' available as request attribute ==> f:label tag
==>
-->
<f:form action="/user/join" method="post" modelAttribute="userVo">
    <table border="1">
        <tr>
            <th>작성자 이름</th>
            <td><f:input path="user_name"/>
                </td>
        </tr>
    </table>
    <div>
        <input type="submit" value="Post">
        <a href="<c:url value="/bbs/list"/>">목록</a>
    </div>
</f:form>
</body>
</html>
