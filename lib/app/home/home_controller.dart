import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  ObservableList<String> tasks = ObservableList();

  @action
  void setTask(String task) {
    tasks.add(task);
  }

  @computed
  ObservableList<String> get getTasks {
    return tasks;
  }
}