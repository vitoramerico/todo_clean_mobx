import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../../../shared/states/list_state.dart';
import '../../../../domain/entities/customer_entity.dart';
import '../customer_lst_controller.dart';
import 'itens_customer_widget.dart';

class ListCustomerWidget extends StatelessWidget {
  final CustomerLstController controller;

  const ListCustomerWidget({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      var state = controller.store.state;

      if (state is ErrorState) {
        return _buildError(state.message);
      } else if (state is LoadingState) {
        return _buildLoading();
      } else if (state is EmptyState) {
        return _buildEmpty(context);
      } else if (state is SuccessState) {
        return _buildSuccess(controller.store.lstCustomer);
      } else {
        return Container();
      }
    });
  }

  Widget _buildSuccess(List<CustomerEntity> lstValue) => LazyLoadScrollView(
        onEndOfPage: controller.loadNextPage,
        isLoading: controller.store.lastPage,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return ItensCustomerWidget(
              customerEntity: lstValue[index],
              onPressed: (v) => controller.openPageCustomerAdd(value: v),
            );
          },
          itemCount: lstValue.length,
        ),
      );

  Widget _buildError(String error) => Center(
        child: Text(
          error,
          style: TextStyle(color: Colors.red),
        ),
      );

  Widget _buildEmpty(BuildContext context) => Center(
        child: Text(
          'Nenhum resultado encontrado :/',
          style: Theme.of(context).textTheme.headline5,
        ),
      );

  Widget _buildLoading() => Center(
        child: CircularProgressIndicator(),
      );
}
