import 'package:first_project/app/app_controller.dart';
import 'package:first_project/app/home/home_controller.dart';
import 'package:first_project/app/home/home_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds =>
      [Bind((i) => AppController()), Bind((i) => HomeController())];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (ctx, args) => const HomeWidget())];
}
