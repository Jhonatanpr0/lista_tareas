import 'package:flutter/material.dart';
import 'package:lista_tareas/app/model/task.dart';
import 'package:lista_tareas/app/view/components/shape.dart';
import 'package:lista_tareas/app/view/components/title_custom.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(),
          Expanded(child: _TaskList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 50),
        onPressed: () => _showNewTaskModal(context),
      ),
    );
  }
}

void _showNewTaskModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => _NewTaskModal(
      onTaskCreated: (Task task) {
        print(task.title);
      },
    ),
  );
}

class _NewTaskModal extends StatefulWidget {
  _NewTaskModal({
    required this.onTaskCreated,
  });

  final void Function(Task task) onTaskCreated;

  @override
  State<_NewTaskModal> createState() => _NewTaskModalState();
}

class _NewTaskModalState extends State<_NewTaskModal> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 23),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleCustom('Nueva tarea'),
          const SizedBox(height: 26),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: 'Descripción de la tarea'),
          ),
          const SizedBox(height: 26),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                final task = Task(_controller.text);
                widget.onTaskCreated(task);
                Navigator.of(context).pop();
              }
            },
            child: const TitleCustom(
              'Guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class _TaskList extends StatefulWidget {
  const _TaskList({
    super.key,
  });

  @override
  State<_TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<_TaskList> {
  final taskList = <Task>[
    Task('Sacar al perro'),
    Task('Hacer la compra'),
    Task('Ir a la playa'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleCustom('Tareas'),
          const SizedBox(height: 13),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: taskList.length,
              itemBuilder: (_, index) => _TaskItem(
                taskList[index],
                onTap: () {
                  setState(() {
                    taskList[index].done = !taskList[index].done;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.primary,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Row(children: [Shape()]),
          Column(
            children: [
              const SizedBox(height: 100),
              Image.asset(
                'assets/images/tasks-list-image.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 16),
              const TitleCustom('Completa tus tareas', color: Colors.white),
              const SizedBox(height: 24)
            ],
          )
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {super.key, this.onTap});
  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
            child: Row(
              children: [
                Icon(
                  task.done
                      ? Icons.check_box_outline_blank
                      : Icons.check_box_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Text(task.title),
              ],
            ),
          )),
    );
  }
}
