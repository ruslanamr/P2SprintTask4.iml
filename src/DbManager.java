import claesses.Task;

import java.util.ArrayList;

public class DbManager {
    static ArrayList<Task> tasks = new ArrayList<>();

    static Long idd = 3L;
    static Task t1 = new Task(1L, "Сделать домашнее задание 1", "Создайте сервлет который добавляет товар в определенный список. Получается мы создадим специальный класс товара - Item.java, который в себе хранит параметры", "2023-06-14", "В процессе");
    static Task t2 = new Task(2L, "Задание 2 - 2", "Продолжайте разрабатывать задание с товарами. Сделайте детальный просмотр каждого товара. Используйте ссылку, чтобы был переход в определенный товар под определенным id. Например, если у товара id=4, то ссылкой на детальный просмотр будет - /details?id=4", "2023-06-15", "В процессе");

    static {
        tasks.add(t1);
        tasks.add(t2);
    }

    static void addTask(Task task) {
        task.setId(idd);
        idd++;
        tasks.add(task);
    }

    static Task getTask(Long id) {
        for (Task t : tasks) {
            if (t.getId() == id) {
                return t;
            }
        }
        return null;
    }

    static ArrayList<Task> getAllTasks() {
        return tasks;
    }

    static void deleteTask(Long id) {
        for (Task t : tasks) {
            if (t.getId() == id) {
                tasks.remove(t);
                break;
            }
        }
        idd--;
    }

    static void updateTask(Task task) {
        for (Task t : tasks) {
            if (t.getId() == task.getId()) {
                t.setId(task.getId());
                t.setName(task.getName());
                t.setDescription(task.getDescription());
                t.setStatus(task.getStatus());
                t.setDeadlineDate(task.getDeadlineDate());
                break;
            }
        }
    }


}
