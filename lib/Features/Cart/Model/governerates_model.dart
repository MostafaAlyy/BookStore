class Governorate {
  int? id;
  String? governorateNameEn;

  Governorate({this.id, this.governorateNameEn});

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateNameEn = json['governorate_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['governorate_name_en'] = governorateNameEn;
    return data;
  }
}
