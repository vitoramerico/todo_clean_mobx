import 'package:mobx/mobx.dart';

import '../../../../../shared/states/list_state.dart';
import '../../../domain/entities/customer_entity.dart';
import 'utils/pagination_filter.dart';

part 'customer_lst_store.g.dart';

class CustomerLstStore = _CustomerLstStoreBase with _$CustomerLstStore;

abstract class _CustomerLstStoreBase with Store {
  @observable
  List<CustomerEntity> lstCustomer = [];
  @action
  void setLstCustomer(List<CustomerEntity> v) => lstCustomer = v;

  @observable
  ListState state = StartState();
  @action
  void setState(ListState v) => state = v;

  @observable
  PaginationFilter paginationFilter = PaginationFilter(1, 15);
  @action
  void setPaginationFilter(PaginationFilter v) => paginationFilter = v;

  int get limit => paginationFilter.limit;
  int get page => paginationFilter.page;

  @observable
  bool lastPage = false;
  @action
  void setLastPage(bool v) => lastPage = v;
}
