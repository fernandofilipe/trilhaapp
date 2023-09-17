import 'package:flutter/material.dart';
import 'package:trilhaapp/model/task.dart';
import 'package:trilhaapp/repositories/task_repository.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var taskRepository = TaskRepository();
  final _descriptionController = TextEditingController(text: "");
  var _tasks = <Task>[];
  var onlyNotDoneTasks = false;

  void loadTasks() async {
    onlyNotDoneTasks
        ? _tasks = await taskRepository.getNoDoneTasks()
        : _tasks = await taskRepository.getTasks();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _descriptionController.text = "";
          showDialog(
            context: context,
            builder: (BuildContext buildContext) {
              return AlertDialog(
                title: const Text("Adicionar Tarefa:"),
                content: TextField(
                  controller: _descriptionController,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  ),
                  TextButton(
                    onPressed: () async {
                      await taskRepository
                          .addTask(Task(_descriptionController.text, false));
                      if (context.mounted) Navigator.of(context).pop();
                      setState(() {});
                      debugPrint(_descriptionController.text);
                    },
                    child: const Text("Salvar"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas não concluídas",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: onlyNotDoneTasks,
                    onChanged: (bool value) {
                      onlyNotDoneTasks = value;
                      loadTasks();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  var task = _tasks[index];
                  return Dismissible(
                    onDismissed: (DismissDirection direction) async {
                      await taskRepository.removeTask(task.id);
                      loadTasks();
                    },
                    key: Key(task.id),
                    child: ListTile(
                      title: Text(task.description),
                      trailing: Switch(
                          value: task.isDone,
                          onChanged: (bool isDone) async {
                            await taskRepository.updateTask(task.id, isDone);
                            loadTasks();
                          }),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
