import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/list_customer_widget.dart';
import 'customer_lst_controller.dart';

class CustomerLstPage extends StatefulWidget {
  @override
  _CustomerLstPageState createState() => _CustomerLstPageState();
}

class _CustomerLstPageState extends ModularState<CustomerLstPage, CustomerLstController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Clientes'),
        centerTitle: true,
      ),
      body: ListCustomerWidget(
        controller: controller,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: controller.openPageCustomerAdd,
      ),
    );
  }
}
