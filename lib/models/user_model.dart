class User {
  int? id;
  String? name;

  String? email;

  User({
    this.id,
    this.name,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    data['email'] = email;

    return data;
  }
}
