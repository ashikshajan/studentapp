class ClassresponseModel {
  List<Classrooms>? classrooms;

  ClassresponseModel({this.classrooms});

  ClassresponseModel.fromJson(Map<String, dynamic> json) {
    if (json['classrooms'] != null) {
      classrooms = <Classrooms>[];
      json['classrooms'].forEach((v) {
        classrooms!.add(Classrooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (classrooms != null) {
      data['classrooms'] = classrooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classrooms {
  int? id;
  String? layout;
  String? name;
  int? size;

  Classrooms({this.id, this.layout, this.name, this.size});

  Classrooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    layout = json['layout'];
    name = json['name'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['layout'] = layout;
    data['name'] = name;
    data['size'] = size;
    return data;
  }
}
