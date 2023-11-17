<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<link href="/main.css" rel="stylesheet">
    <title>List Table</title>

<!-- i18n, ^ -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<script type="text/javascript">
$(document).ready(function() {
    $("#locales").change(function () {
        var selectedOption = $('#locales').val();
        if (selectedOption != ''){
            window.location.replace('/bbs/list?lang=' + selectedOption); //this will call /bbs/i18n?lang=...
        }
    });
});
</script>

<!-- i18n, $ -->

</head>
<body style="background-color: <s:message code="lang.based.color"/>;">
<span><s:message code="change.lang"/></span>:
<select id="locales">
    <option value="">Please select language.</option>
    <option value="en_US"><s:message code="lang.en"/></option>
    <option value="ko_KR"><s:message code="lang.ko"/></option>
    <option value="zh_CN"><s:message code="lang.zh"/></option>
    <option value="en_US">Get back to default language(US English)</option>
</select>

<table><tr><td>1st db</td><td>2nd db</td></tr>
<tr><td>
    <table border="1">
        <tr>
            <th>DT</th>
            <th><s:message code="bbs.writer"/></th>
            <th>
            <fmt:setLocale value="ko_KR"/>
            <fmt:bundle basename="i18n/fixedmessage">
              <fmt:message key="unique.fixed.writer"/>
              <!-- c:out value="$(msg})"/-->
            </fmt:bundle>
            </th>
            <th><s:message code="bbs.content"/></th>
        </tr>
        <c:forEach var="bbs" items="${bbsList}" varStatus="loop">
            <tr>
                <td>${bbs.create_dt}</td>
                <td>${bbs.create_user}</td>
                <td><a href="<c:url value="/bbs/read/${bbs.bbs_id}"/> ">${bbs.subject}</a></td>
                <td>${bbs.content}</td>
            </tr>
        </c:forEach>
    </table>
</td>
<td>    
    <table border="1">
        <tr>
            <th>Env.</th>
            <th>Client Name</th>
            <th>Log ID</th>
        </tr>
        <c:forEach var="bbs" items="${bbsList2}" varStatus="loop">
            <tr> <!-- bbs.variables are from the id where resultMap="customMap" used in mybatis xml -->
                <td>${bbs.create_user}</td>
                <td><a href="<c:url value="/bbs/read2/${bbs.bbs_id}"/> ">${bbs.subject}</a></td>
                <td>${bbs.content}</td>
            </tr>
        </c:forEach>
    </table>
</td></tr>
</table>
        
    <a href="<c:url value="/bbs/form"/> ">새글</a>
</body>
</html>