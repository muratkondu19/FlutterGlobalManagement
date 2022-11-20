import 'package:flutter/material.dart';
import 'package:global_management/feature/global_management/global_manage_detail_view.dart';
import 'package:global_management/feature/global_management/global_model.dart';

class GlobalManageView extends StatefulWidget {
  const GlobalManageView({Key? key}) : super(key: key);

  @override
  State<GlobalManageView> createState() => _GlobalManageViewState();
}

class _GlobalManageViewState extends State<GlobalManageView> {
  //late ->bu değerin kesin olarak geleceği anlamına gelir / initstate anında değer gelecek
  late List<GlobalModel> globalItems = [];
  @override
  void initState() {
    super.initState();
    globalItems = GlobalModel.mockItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: globalItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: () async {
                //Push ile ne gidip ne geleceği konusu generic olarak verilebilir.
                //GlobalNavigationModel ile String bir sonuö beklendiği belirtilmiştir
                final result = await Navigator.of(context)
                    .push<GlobalNavigationModel<int>>(MaterialPageRoute(builder: (context) => const GlobalManageDetailView()));

                if (result != null || (result?.isComplete ?? false)) {
                  //await işlemden sonra !mounted kullanımı önerilir
                  if (!mounted) return; //ekranda sabitlenmemişse anlamındadır, kullanıcınn ekranda olması beklenir
                  setState(() {
                    globalItems = GlobalModel.mockItems.where((element) => element.value <= result!.data).toList();
                  });
                }
              },
              title: Text(GlobalModel.mockItems[index].title),
            ),
          );
        },
      ),
    );
  }
}

class GlobalNavigationModel<T> {
  GlobalNavigationModel(this.data, {this.isComplete = true});
  final bool isComplete;
  final T data;
}
