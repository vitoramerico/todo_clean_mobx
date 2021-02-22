import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/customer/presenter/customer_module.dart';
import 'shared/connect/custom_connect.dart';
import 'shared/connect/custom_connect_interface.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio()),
    Bind.lazySingleton<ICustomConnect>((i) => CustomConnect(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: CustomerModule(),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
