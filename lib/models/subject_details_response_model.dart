class SubjectsDetailsResponseModel {
  int? credits;
  int? id;
  String? name;
  String? teacher;

  SubjectsDetailsResponseModel(
      {this.credits, this.id, this.name, this.teacher});

  SubjectsDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    credits = json['credits'];
    id = json['id'];
    name = json['name'];
    teacher = json['teacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['credits'] = credits;
    data['id'] = id;
    data['name'] = name;
    data['teacher'] = teacher;
    return data;
  }
}
