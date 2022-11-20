import 'package:flutter/material.dart';
import 'package:global_management/feature/global_management/global_manage_view.dart';

class GlobalManageDetailView extends StatefulWidget {
  const GlobalManageDetailView({Key? key}) : super(key: key);

  @override
  State<GlobalManageDetailView> createState() => _GlobalManageDetailViewState();
}

class _GlobalManageDetailViewState extends State<GlobalManageDetailView> {
  int _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, GlobalNavigationModel<int>(_currentValue));
        },
        child: const Text('Save'),
      ),
      appBar: AppBar(
        title: Text(_currentValue.toString()),
      ),
      body: TextField(
        maxLength: 1,
        onChanged: (value) {
          final numberValue = int.tryParse(value);
          if (numberValue == null) return;
          setState(() {
            _currentValue = numberValue;
          });
        },
      ),
    );
  }
}
