<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<jsp:include page="../templates/header.jsp"/>

<!-- Wrapper -->
<div class="wrapper style1" height="100%">

    <jsp:include page="../templates/menu.jsp"/>

    <div id="footer" class="wrapper style2" >
        <div class="container">
            <section>
                <header class="major">
                    <h2>Войдите в систему</h2>
                </header>
                <form name='adminLogin' action="/admin" method='POST'>
                    <div class="row half">
                        <div class="12u">
                            <input class="text" required type="text" name='username' placeholder="Логин" />
                        </div>
                    </div>
                    <div class="row half">
                        <div class="12u">
                            <input class="text" required type='password' name='password' placeholder="Логин" />
                        </div>
                    </div>

                    <div class="row half">
                        <div class="12u">
                            <ul class="actions">
                                <li>
                                    <input type="submit" value="Войти" class="button alt">
                                </li>
                            </ul>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>

</div>

<jsp:include page="../templates/modal.jsp"/>

<jsp:include page="../templates/footer.jsp"/>