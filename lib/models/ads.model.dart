class Ads {
  String? id;
  String? title;
  String? description;
  String? image;

  Ads();

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> adsData = {};
    adsData['id'] = id;
    adsData['title'] = title;
    adsData['description'] = description;
    adsData['image'] = image;
    return adsData;
  }
}
