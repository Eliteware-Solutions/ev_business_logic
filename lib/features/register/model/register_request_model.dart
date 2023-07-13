import 'dart:convert';

class RegisterRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  RegisterRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });
  RegisterRequestModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return RegisterRequestModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};
    if (firstName != null) {
      map['first_name'] = firstName;
    }
    if (lastName != null) {
      map['last_name'] = lastName;
    }
    if (email != null) {
      map['email'] = email;
    }
    if (password != null) {
      map['password'] = password;
    }
    return map;
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      firstName: map['first_name'] != null ? map['first_name'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }
  String toJson() => json.encode(toMap());
  factory RegisterRequestModel.fromJson(String source) =>
      RegisterRequestModel.fromMap(json.decode(source));
  @override
  String toString() {
    return 'RegisterRequestModel(first_name: $firstName, last_name: $lastName, email: $email, password: $password)';
  }
}
