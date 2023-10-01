class BookCategoric {
  int? id;
  String? name;
  int? productsCount;

  BookCategoric({this.id, this.name, this.productsCount});

  BookCategoric.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['products_count'] = productsCount;
    return data;
  }
}
