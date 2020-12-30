import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/repositories/cep_repository_interface.dart';
import '../../../../domain/usecases/cep_get/cep_get.dart';
import '../../../../domain/usecases/cep_get/cep_get_interface.dart';
import '../../../../domain/usecases/customer_get_by_id/customer_get_by_id.dart';
import '../../../../domain/usecases/customer_get_by_id/customer_get_by_id_interface.dart';
import '../../../../domain/usecases/customer_save/customer_save.dart';
import '../../../../domain/usecases/customer_save/customer_save_interface.dart';
import '../../../../domain/usecases/customer_update/customer_update.dart';
import '../../../../domain/usecases/customer_update/customer_update_interface.dart';
import '../../../../external/datasources/cep_datasource.dart';
import '../../../../infra/datasources/cep_datasource_interface.dart';
import '../../../../infra/repositories/cep_repository.dart';
import '../customer_add_controller.dart';
import '../customer_add_store.dart';

class CustomerAddBinding {
  static final List<Bind> binds = [
    Bind.lazySingleton<ICepDatasource>((i) => CepDatasource(i.get())),
    Bind.lazySingleton<ICepRepository>((i) => CepRepository(i.get())),
    Bind.lazySingleton<ICustomerSave>((i) => CustomerSave(i.get())),
    Bind.lazySingleton<ICustomerUpdate>((i) => CustomerUpdate(i.get())),
    Bind.lazySingleton<ICustomerGetById>((i) => CustomerGetById(i.get())),
    Bind.lazySingleton<ICepGet>((i) => CepGet(i.get())),
    Bind.factory((i) => CustomerAddStore()),
    Bind.lazySingleton((i) => CustomerAddController(i.get(), i.get(), i.get(), i.get(), i.get(), i.args.data))
  ];
}
