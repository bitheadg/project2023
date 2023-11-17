<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Removal</title>
</head>
<body>

<%-- form 태그에 action 정보가 없어도 Spring이 브라우저 창을 참고해서 자동으로 action정보를 설정==> 현재 페이지 호출시에만 --%>
<!-- Unable to find setter method for attribute: [commandName]==> commandName는 스프링 5.0 이후 사라짐, use modelAttribute
Neither BindingResult nor plain target object for bean name 'bbsVo' available as request attribute ==> f:label tag
==>
-->
<f:form modelAttribute="bbsVo" method="post">
    <table border="1">
        <tr>
            <th>제목</th>
            <td><f:input path="subject" readonly="true"/> <!-- you need to use input element anyway for MVC binding work -->
            	<f:errors path="subject"/>
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td><f:input path="content" readonly="true"/>
                </td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><f:input path="create_user" readonly="true"/>
                </td>
        </tr>
        <tr>
            <th><label for="pwd">Confirm your deletion by typing loginId(loginId: alphanumeric only)</label></th>
            <%-- form 태그를 사용하면 글을 등록할 때 입력했떤 비밀번호가 채워지기 때문에 input 태그를 사용 --%>
            <td><input type="password" id="xxx" name="loginId"/>${alert}</td>
        </tr>
    </table>
    <div>
        <input type="submit" value="Submit">
        <a href="<c:url value="/bbs/read/${bbsVo.bbs_id}"/>">Cancel</a>
    </div>
</f:form>

</body>
</html>
