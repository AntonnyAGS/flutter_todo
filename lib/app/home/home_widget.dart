import 'package:first_project/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeWidget> {
  final controller = HomeController();

  final taskInputController = TextEditingController(text: '');

  void _onAddTaskPressed() {
    if (taskInputController.text.isNotEmpty) {
      controller.setTask(taskInputController.text);
      taskInputController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(title: const Text('ToDo App')),
          body: Center(
            child: Padding(
              child: Column(
                children: [
                  _buildInputTaskLine(context),
                  Expanded(
                      child: Observer(
                          builder: (_) => ListView.builder(
                              itemCount: controller.getTasks.length,
                              itemBuilder: (ctx, index) => Observer(
                                  builder: (_) =>
                                      Text(controller.getTasks[index])))))
                ],
              ),
              padding: const EdgeInsets.all(16.0),
            ),
          ),
        ));
  }

  Widget _buildInputTaskLine(BuildContext context) {
    return Row(children: [
      Flexible(
          flex: 1,
          child: TextField(
            controller: taskInputController,
          )),
      const SizedBox(width: 16),
      SizedBox(
          height: 48,
          child: ElevatedButton(
              child: const Text('Criar'), onPressed: _onAddTaskPressed))
    ]);
  }
}
