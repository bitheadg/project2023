<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Posting BBS</title>
</head>
<body>
<strong><u>
<s:message code="change.lang"/>:
</u></strong>
<br/><br/> 
<!-- Unable to find setter method for attribute: [commandName]==> commandName는 스프링 5.0 이후 사라짐, use modelAttribute
Neither BindingResult nor plain target object for bean name 'bbsVo' available as request attribute ==> f:label tag
==>
-->
<%-- form 태그에 action 정보가 없어도 Spring이 브라우저 창을 참고해서 자동으로 action정보를 설정==> 현재 페이지 호출시에만, 아래 경우 post방식의 @RequestMapping(value 부분이 get방식의 @RequestMapping(value 부분과 다르므로 아래와 같이 explicitly 지정해야 --%>
<f:form modelAttribute="bbsVo" method="post" action="/bbs/post">
<table border="1">
        <tr>
            <th>Target Service</th>
            <td>
            <f:select path="create_user">
            	<option value="">선택해주세요</option>
	            <f:option value="CRM">CRM</f:option>
			    <f:option value="ERP">ERP</f:option>
			    <f:option value="FIN" label="FIN Label">FIN</f:option>
			</f:select>    
            </td>
        </tr>
        <tr>
            <th>Urgency</th>
            <td>
            <f:select path="subject">
            	<option value="">선택해주세요</option>
	            <f:option value="H">Critical</f:option>
			    <f:option value="M">Medium</f:option>
			    <f:option value="L" label="Low Label">Low</f:option>
			</f:select>
                </td>
        </tr>
        <tr>
	        <th>Issue Description</th>
            <td><f:textarea cols="50" rows="10" path="content"/>
            </td>
        </tr>
        <tr></tr>
        <tr>
            <th>Env.(max 20 chars for Transactio demo)</th>
            <td>
            <f:input path="create_user2"/>
                </td>
        </tr>
        <tr>
            <th>Your customer name</th>
            <td><f:input path="subject2"/>
                </td>
        </tr>
        <tr>
            <th>Log Id to replay</th>
            <td><f:input path="content2"/>
            </td>            
        </tr>
</table>
<br/>
<div>
    <input type="submit" value="Post">
    <a href="<c:url value="/bbs/list"/>">목록</a>
</div>
</f:form>

</body>
</html>
