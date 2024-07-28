class SubjectsResponseModel {
  List<Subjects>? subjects;

  SubjectsResponseModel({this.subjects});

  SubjectsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subjects != null) {
      data['subjects'] = subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subjects {
  int? credits;
  int? id;
  String? name;
  String? teacher;

  Subjects({this.credits, this.id, this.name, this.teacher});

  Subjects.fromJson(Map<String, dynamic> json) {
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
