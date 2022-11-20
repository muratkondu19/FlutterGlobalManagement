// ignore_for_file: public_member_api_docs, sort_constructors_first
class GlobalModel {
  const GlobalModel(
    this.title,
    this.value,
  );
  final String title;
  final int value;

//Mock Items Listesi oluşturma
  static List<GlobalModel> mockItems = List.generate(10, (index) => GlobalModel('$index ----', index));
}
