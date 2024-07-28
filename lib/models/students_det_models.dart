class StudentDetailsResponseModel {
  int? age;
  String? email;
  int? id;
  String? name;

  StudentDetailsResponseModel({this.age, this.email, this.id, this.name});

  StudentDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['email'] = email;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
