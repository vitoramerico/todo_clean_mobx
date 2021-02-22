import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/bottom_navigation_bar_widget.dart';
import 'components/pages_widget.dart';
import 'customer_add_controller.dart';

class CustomerAddPage extends StatefulWidget {
  @override
  _CustomerAddPageState createState() => _CustomerAddPageState();
}

class _CustomerAddPageState extends ModularState<CustomerAddPage, CustomerAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Cliente'),
        centerTitle: true,
      ),
      body: Form(
        key: store.store.formKey,
        child: PagesWidget(controller: store),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(controller: store),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: store.save,
      ),
    );
  }
}
