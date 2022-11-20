import 'package:flutter/material.dart';

import 'feature/global_management/global_manage_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: GlobalManageView());
  }
}
