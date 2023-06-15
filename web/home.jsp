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

<div class="container">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newmodal">
        Добавить задание
    </button>
</div>
<!-- Modal new -->
<div class="modal fade" id="newmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/newtask" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Новое задание</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="mb-3">
                        <label class="col-form-label">Наименование</label>
                        <input type="text" class="form-control" name="name" placeholder="Наименование">
                    </div>
                    <div class="mb-3">
                        <label class="col-form-label">Описание:</label>
                        <textarea class="form-control" name="description" placeholder="Описание"></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="col-form-label">Крайний срок:</label>
                        <input type="date" class="form-control" name="deadlineDate">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Отмена</button>
                    <button type="submit" class="btn btn-primary">Создать</button>
                </div>

            </form>
        </div>

    </div>
</div>


<div class="container">
    <table class="table table-hover">
        <tr>
            <th> ID</th>
            <th> Наименованеи задания</th>
            <th> Крайний срок</th>
            <th> Статус</th>
            <th> Детали</th>
        </tr>

        <% ArrayList<Task> fronttask = (ArrayList<Task>) request.getAttribute("ftasks");

            for (Task t : fronttask) {
        %>
        <tr>
            <td><%=t.getId()%>
            </td>
            <td><%=t.getName()%>
            </td>

            <td><%=t.getDeadlineDate()%>
            </td>
            <td><%=t.getStatus()%>
            </td>
            <td><a href="/details?id=<%=t.getId()%>" class="btn btn-primary">Детали</a>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#deleteModal<%=t.getId()%>"> Удалить
                </button>

                <%--Delete modal--%>
                <div class="modal fade" id="deleteModal<%=t.getId()%>" tabindex="-1"
                     aria-labelledby="deleteModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="delete" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title"> Удаление записи
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" name="id" value="<%=t.getId()%>">
                                        <h5>Вы уверены, что хотите удалить запись? </h5>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть
                                        </button>
                                        <button type="submit" class="btn btn-danger">Удалить</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
