class Hackathon {
  String? hackName;
  String? image;
  String? description;

  Hackathon({this.hackName, this.image, this.description});

  Hackathon.fromJson(Map<String, dynamic> json) {
    hackName = json['hackName'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hackName'] = hackName;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}
