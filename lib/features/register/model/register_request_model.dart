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
      map['firstName'] = firstName;
    }
    if (lastName != null) {
      map['lastName'] = lastName;
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
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromJson(String source) =>
      RegisterRequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterRequestModel(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterRequestModel &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
