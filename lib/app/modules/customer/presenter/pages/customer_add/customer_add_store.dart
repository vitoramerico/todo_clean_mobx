import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/customer_entity.dart';

part 'customer_add_store.g.dart';

class CustomerAddStore = _CustomerAddStoreBase with _$CustomerAddStore;

abstract class _CustomerAddStoreBase extends Disposable with Store {
  final formKey = GlobalKey<FormState>();

  final tecId = TextEditingController();
  final tecName = TextEditingController();
  final tecDocumentNumber = TextEditingController();
  final tecEmailAddress = TextEditingController();
  final tecAddressStreet = TextEditingController();
  final tecAddressNumber = TextEditingController();
  final tecAddressNeighborhood = TextEditingController();
  final tecAddressCity = TextEditingController();
  final tecAddressState = TextEditingController();
  final tecAddressZipCode = TextEditingController();

  late List<ReactionDisposer> _disposers;

  @observable
  String id = '';
  @action
  void setId(String v) => id = v;

  @observable
  String name = '';
  @action
  void setName(String v) => name = v;

  @observable
  DateTime birthDate = DateTime.now();
  @action
  void setBirthDate(DateTime v) => birthDate = v;

  @observable
  String documentNumber = '';
  @action
  void setDocumentNumber(String v) => documentNumber = v;

  @observable
  String emailAddress = '';
  @action
  void setEmailAddress(String v) => emailAddress = v;

  @observable
  String addressStreet = '';
  @action
  void setAddressStreet(String v) => addressStreet = v;

  @observable
  String addressNumber = '';
  @action
  void setAddressNumber(String v) => addressNumber = v;

  @observable
  String addressNeighborhood = '';
  @action
  void setAddressNeighborhood(String v) => addressNeighborhood = v;

  @observable
  String addressCity = '';
  @action
  void setAddressCity(String v) => addressCity = v;

  @observable
  String addressState = '';
  @action
  void setAddressState(String v) => addressState = v;

  @observable
  String addressZipCode = '';
  @action
  void setAddressZipCode(String v) => addressZipCode = v;

  @observable
  bool loadingZipCode = false;
  @action
  void setLoadingZipCode(bool v) => loadingZipCode = v;

  CustomerEntity get customer => CustomerEntity(
        id,
        name,
        birthDate,
        documentNumber,
        addressStreet,
        addressNumber,
        addressNeighborhood,
        addressCity,
        addressState,
        addressZipCode,
        emailAddress,
      );

  set customer(CustomerEntity value) {
    setId(value.id);
    setName(value.name);
    setBirthDate(value.birthDate);
    setDocumentNumber(value.documentNumber);
    setEmailAddress(value.emailAddress);
    setAddressStreet(value.addressStreet);
    setAddressNumber(value.addressNumber);
    setAddressNeighborhood(value.addressNeighborhood);
    setAddressCity(value.addressCity);
    setAddressState(value.addressState);
    setAddressZipCode(value.addressZipCode);
  }

  _CustomerAddStoreBase() {
    setupReactions();
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    tecId.dispose();
    tecName.dispose();
    tecDocumentNumber.dispose();
    tecEmailAddress.dispose();
    tecAddressStreet.dispose();
    tecAddressNumber.dispose();
    tecAddressNeighborhood.dispose();
    tecAddressCity.dispose();
    tecAddressState.dispose();
    tecAddressZipCode.dispose();
  }

  void setupReactions() {
    _disposers = [
      reaction((_) => id, (String v) => tecId.value = tecId.value.copyWith(text: v)),
      reaction((_) => name, (String v) => tecName.value = tecName.value.copyWith(text: v)),
      reaction((_) => documentNumber,
          (String v) => tecDocumentNumber.value = tecDocumentNumber.value.copyWith(text: v)),
      reaction(
          (_) => emailAddress, (String v) => tecEmailAddress.value = tecEmailAddress.value.copyWith(text: v)),
      reaction((_) => addressStreet,
          (String v) => tecAddressStreet.value = tecAddressStreet.value.copyWith(text: v)),
      reaction((_) => addressNumber,
          (String v) => tecAddressNumber.value = tecAddressNumber.value.copyWith(text: v)),
      reaction((_) => addressNeighborhood,
          (String v) => tecAddressNeighborhood.value = tecAddressNeighborhood.value.copyWith(text: v)),
      reaction(
          (_) => addressCity, (String v) => tecAddressCity.value = tecAddressCity.value.copyWith(text: v)),
      reaction(
          (_) => addressState, (String v) => tecAddressState.value = tecAddressState.value.copyWith(text: v)),
      reaction((_) => addressZipCode,
          (String v) => tecAddressZipCode.value = tecAddressZipCode.value.copyWith(text: v)),
    ];
  }
}
