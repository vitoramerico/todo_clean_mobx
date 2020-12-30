import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/routes/app_routes.dart';
import 'pages/customer_add/bindings/customer_add_binding.dart';
import 'pages/customer_add/customer_add_page.dart';
import 'pages/customer_lst/bindings/customer_lst_binding.dart';
import 'pages/customer_lst/customer_lst_page.dart';

class CustomerModule extends ChildModule {
  @override
  final List<Bind> binds = CustomerLstBinding.binds + CustomerAddBinding.binds;

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => CustomerLstPage()),
    ChildRoute(AppRoutes.DETAILS, child: (_, args) => CustomerAddPage()),
  ];
}
