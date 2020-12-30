import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/routes/app_routes.dart';
import '../../../../../shared/states/list_state.dart';
import '../../../domain/entities/customer_entity.dart';
import '../../../domain/usecases/customer_get_all/customer_get_all_interface.dart';
import 'customer_lst_store.dart';
import 'utils/pagination_filter.dart';

part 'customer_lst_controller.g.dart';

class CustomerLstController = _CustomerLstControllerBase with _$CustomerLstController;

abstract class _CustomerLstControllerBase extends Disposable with Store {
  final ICustomerGetAll _customerGetAll;
  final CustomerLstStore store;

  List<ReactionDisposer> _disposers;

  _CustomerLstControllerBase(this._customerGetAll, this.store) {
    setupReactions();
    _changeFirstPage();
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
  }

  void setupReactions() {
    _disposers = [
      reaction((_) => store.paginationFilter, (PaginationFilter v) {
        _init();
      }),
    ];
  }

  Future<void> _init() async {
    var result = await _customerGetAll(store.page, store.limit);

    result.fold((error) {
      store.setState(ErrorState(error.message));
    }, (value) {
      if (value.isEmpty) store.setLastPage(true);

      store.lstCustomer.addAll(value);

      store.setState(store.lstCustomer.isEmpty ? EmptyState() : SuccessState());
    });
  }

  void openPageCustomerAdd({CustomerEntity value}) {
    Modular.to.pushNamed(AppRoutes.DETAILS, arguments: value?.id).then((value) {
      if (value != null && value) {
        _changeFirstPage();
      }
    });
  }

  void loadNextPage() => _changePaginationFilter(store.page + 1, store.limit);

  void _changeFirstPage() {
    store.setState(LoadingState());
    store.lstCustomer.clear();
    store.lastPage = false;
    _changePaginationFilter(1, 10);
  }

  void _changePaginationFilter(int page, int limit) {
    store.setPaginationFilter(PaginationFilter(page, limit));
  }
}
