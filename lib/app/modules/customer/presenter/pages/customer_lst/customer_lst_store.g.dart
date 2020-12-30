// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_lst_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomerLstStore on _CustomerLstStoreBase, Store {
  final _$lstCustomerAtom = Atom(name: '_CustomerLstStoreBase.lstCustomer');

  @override
  List<CustomerEntity> get lstCustomer {
    _$lstCustomerAtom.reportRead();
    return super.lstCustomer;
  }

  @override
  set lstCustomer(List<CustomerEntity> value) {
    _$lstCustomerAtom.reportWrite(value, super.lstCustomer, () {
      super.lstCustomer = value;
    });
  }

  final _$stateAtom = Atom(name: '_CustomerLstStoreBase.state');

  @override
  ListState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ListState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$paginationFilterAtom =
      Atom(name: '_CustomerLstStoreBase.paginationFilter');

  @override
  PaginationFilter get paginationFilter {
    _$paginationFilterAtom.reportRead();
    return super.paginationFilter;
  }

  @override
  set paginationFilter(PaginationFilter value) {
    _$paginationFilterAtom.reportWrite(value, super.paginationFilter, () {
      super.paginationFilter = value;
    });
  }

  final _$lastPageAtom = Atom(name: '_CustomerLstStoreBase.lastPage');

  @override
  bool get lastPage {
    _$lastPageAtom.reportRead();
    return super.lastPage;
  }

  @override
  set lastPage(bool value) {
    _$lastPageAtom.reportWrite(value, super.lastPage, () {
      super.lastPage = value;
    });
  }

  final _$_CustomerLstStoreBaseActionController =
      ActionController(name: '_CustomerLstStoreBase');

  @override
  void setLstCustomer(List<CustomerEntity> v) {
    final _$actionInfo = _$_CustomerLstStoreBaseActionController.startAction(
        name: '_CustomerLstStoreBase.setLstCustomer');
    try {
      return super.setLstCustomer(v);
    } finally {
      _$_CustomerLstStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(ListState v) {
    final _$actionInfo = _$_CustomerLstStoreBaseActionController.startAction(
        name: '_CustomerLstStoreBase.setState');
    try {
      return super.setState(v);
    } finally {
      _$_CustomerLstStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaginationFilter(PaginationFilter v) {
    final _$actionInfo = _$_CustomerLstStoreBaseActionController.startAction(
        name: '_CustomerLstStoreBase.setPaginationFilter');
    try {
      return super.setPaginationFilter(v);
    } finally {
      _$_CustomerLstStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastPage(bool v) {
    final _$actionInfo = _$_CustomerLstStoreBaseActionController.startAction(
        name: '_CustomerLstStoreBase.setLastPage');
    try {
      return super.setLastPage(v);
    } finally {
      _$_CustomerLstStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lstCustomer: ${lstCustomer},
state: ${state},
paginationFilter: ${paginationFilter},
lastPage: ${lastPage}
    ''';
  }
}
