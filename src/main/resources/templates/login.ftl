<body>
    <#if model.loginError.isPresent()>
        Неверный логин или пароль
    </#if>
    <form method="post" action="/login">
        <input type="text" name="login" id="login" placeholder="login">
        <input type="password" name="password" id="password" placeholder="password">
        <input type="submit">
    </form>
</body>