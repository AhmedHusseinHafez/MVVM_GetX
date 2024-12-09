class ItemModel {
  int? id;
  String? title;
  String? body;

  ItemModel({this.id, this.title, this.body});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
