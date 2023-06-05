class RegisterRequestModel {
  RegisterRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? password;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterRequestModel(
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
      };
}
