<%@ page import="java.util.ArrayList" %>
<%@ page import="claesses.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Task4</title>
    <%@include file="Sdn.jsp" %>
</head>

<body>
<%@include file="navbar.jsp" %>

<% Task datailtask = (Task) request.getAttribute("ftasks");%>
<div style="padding: 50px; padding-left: 20%; padding-right: 20%">
    <h1 class="modal-title fs-5" id="exampleModalLabel">Работа с заданием </h1>

    <form action="/worktotask" method="post">

        <label class="col-form-label">ID</label>
        <input type="text" class="form-control" name="id" value="<%=datailtask.getId()%>">

        <div class="mb-3">
            <label class="col-form-label">Наименование</label>
            <input type="text" class="form-control" name="name" value="<%=datailtask.getName()%>">
        </div>
        <div class="mb-3">
            <label class="col-form-label">Описание:</label>
            <textarea class="form-control" name="description"><%=datailtask.getDescription()%></textarea>
        </div>
        <div class="mb-3">
            <label class="col-form-label">Крайний срок:</label>
            <input type="date" class="form-control" name="deadlineDate" value="<%=datailtask.getDeadlineDate()%>">
        </div>
        <div class="mb-3">

            <label class="col-form-label">Статус</label>
            <select class="form-select" aria-label="Default select example" name="status">
                <option>В процессе</option>
                <option>Выполненно</option>
            </select>
        </div>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Отмена</button>
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>
</div>


</body>
</html>
