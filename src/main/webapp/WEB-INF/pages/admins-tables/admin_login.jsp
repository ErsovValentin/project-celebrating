<jsp:include page="../templates/header.jsp"/>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<jsp:include page="../templates/menu.jsp"/>
<br/>
<br/>

<h1>Аутентификация</h1>
<form name='adminLogin' action="/admin" method='POST'>
    <table>
        <tr>
            <td>Логин:</td>
            <td><input type='text' name='username' value=''></td>
        </tr>
        <tr>
            <td>Пароль:</td>
            <td><input type='password' name='password' /></td>
        </tr>
        <tr>
            <td><input name="submit" type="submit" value="Войти" /></td>
        </tr>
    </table>
</form>

<jsp:include page="../templates/footer.jsp"/>
