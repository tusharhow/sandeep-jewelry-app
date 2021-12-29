class BannerModel {
  BannerModel({
    required this.data,
    required this.url,
    required this.status,
  });
  late final List<Data> data;
  late final String url;
  late final int status;

  BannerModel.fromJson(Map<String, dynamic> json) {
    data = json['data'].map<Data>((item) => Data.fromJson(item)).toList();
    url = json['url'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((v) => v.toJson()).toList();
    _data['url'] = url;
    _data['status'] = status;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.title,
    required this.type,
    required this.place,
    required this.startDate,
    required this.endDate,
    required this.categoryId,
    required this.subcategoryId,
    this.subsubcategoryId,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String userId;
  late final String title;
  late final String type;
  late final String place;
  late final String startDate;
  late final String endDate;
  late final String categoryId;
  late final String subcategoryId;
  late final Null subsubcategoryId;
  late final String image;
  late final String status;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    type = json['type'];
    place = json['place'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    subsubcategoryId = null;
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['title'] = title;
    _data['type'] = type;
    _data['place'] = place;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['category_id'] = categoryId;
    _data['subcategory_id'] = subcategoryId;
    _data['subsubcategory_id'] = subsubcategoryId;
    _data['image'] = image;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
