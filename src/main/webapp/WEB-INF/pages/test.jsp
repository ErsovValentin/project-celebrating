<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:url var="addAction" value="/uploadFile"/>
<form action="${addAction}" method="post" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit" value="Upload"/>
</form>

</body>
</html>
