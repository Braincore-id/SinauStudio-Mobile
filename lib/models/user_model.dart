// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? name;
  String? email;
  String? password;
  String? userClass;
  String? role;
  UserModel({
    this.name,
    this.email,
    this.password,
    this.userClass,
    this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'code_class': userClass,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
      userClass: map['code_class'] as String,
    );
  }
}
