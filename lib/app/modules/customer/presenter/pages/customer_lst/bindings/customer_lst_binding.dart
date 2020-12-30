import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/repositories/customer_repository_interface.dart';
import '../../../../domain/usecases/customer_get_all/customer_get_all.dart';
import '../../../../domain/usecases/customer_get_all/customer_get_all_interface.dart';
import '../../../../external/datasources/customer_datasource.dart';
import '../../../../infra/datasources/customer_datasource_interface.dart';
import '../../../../infra/repositories/customer_repository.dart';
import '../customer_lst_controller.dart';
import '../customer_lst_store.dart';

class CustomerLstBinding {
  static final List<Bind> binds = [
    Bind.lazySingleton<ICustomerDatasource>((i) => CustomerDatasource(i.get())),
    Bind.lazySingleton<ICustomerRepository>((i) => CustomerRepository(i.get())),
    Bind.lazySingleton<ICustomerGetAll>((i) => CustomerGetAll(i.get())),
    Bind.lazySingleton((i) => CustomerLstStore()),
    Bind.lazySingleton((i) => CustomerLstController(i.get(), i.get())),
  ];
}
