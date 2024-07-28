class StudentsListResponseModel {
  List<Students>? students;

  StudentsListResponseModel({this.students});

  StudentsListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? age;
  String? email;
  int? id;
  String? name;

  Students({this.age, this.email, this.id, this.name});

  Students.fromJson(Map<String, dynamic> json) {
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
