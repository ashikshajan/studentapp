class ClassRoomDetailsResponseModel {
  int? id;
  String? layout;
  String? name;
  int? size;
  String? subject;

  ClassRoomDetailsResponseModel(
      {this.id, this.layout, this.name, this.size, this.subject});

  ClassRoomDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    layout = json['layout'];
    name = json['name'];
    size = json['size'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['layout'] = layout;
    data['name'] = name;
    data['size'] = size;
    data['subject'] = subject;
    return data;
  }
}
