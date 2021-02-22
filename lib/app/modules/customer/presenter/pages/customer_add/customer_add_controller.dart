import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/components/my_snackbar.dart';
import '../../../domain/usecases/cep_get/cep_get_interface.dart';
import '../../../domain/usecases/customer_get_by_id/customer_get_by_id_interface.dart';
import '../../../domain/usecases/customer_save/customer_save_interface.dart';
import '../../../domain/usecases/customer_update/customer_update_interface.dart';
import 'customer_add_store.dart';

part 'customer_add_controller.g.dart';

class CustomerAddController = _CustomerAddControllerBase with _$CustomerAddController;

abstract class _CustomerAddControllerBase with Store {
  final ICustomerSave _customerSave;
  final ICustomerUpdate _customerUpdate;
  final ICustomerGetById _customerGetById;
  final ICepGet _cepGet;
  final CustomerAddStore store;

  final pageController = PageController();

  int get currentPage => pageController.page?.round() ?? 0;

  void changePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  _CustomerAddControllerBase(
    this._customerSave,
    this._customerUpdate,
    this._customerGetById,
    this._cepGet,
    this.store,
    String codigo,
  ) {
    _init(codigo);
  }

  void _init(String codigo) async {
    if (codigo == null) return;

    var result = await _customerGetById(codigo);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (customer) {
      store.customer = customer;
    });
  }

  Future<void> save() async {
    var isValid = store.formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    store.formKey.currentState?.save();

    if (store.id.isEmpty)
      await _save();
    else
      await _update();
  }

  Future<void> _save() async {
    var result = await _customerSave(store.customer);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (id) {
      MySnackBar.show(MySnackBarModel(msg: 'Cadastro realizado com sucesso'));
      Modular.to.pop(true);
    });
  }

  Future<void> _update() async {
    var result = await _customerUpdate(store.id, store.customer);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (_) {
      MySnackBar.show(MySnackBarModel(msg: 'Cadastro alterado com sucesso'));
      Modular.to.pop(true);
    });
  }

  void getCep() async {
    if (store.addressZipCode.isEmpty) return;

    store.setLoadingZipCode(true);

    var result = await _cepGet(store.addressZipCode);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (cepEntity) {
      store.setAddressStreet(cepEntity.logradouro);
      store.setAddressNeighborhood(cepEntity.bairro);
      store.setAddressCity(cepEntity.localidade);
      store.setAddressState(cepEntity.uf);
    });

    store.setLoadingZipCode(false);
  }
}
