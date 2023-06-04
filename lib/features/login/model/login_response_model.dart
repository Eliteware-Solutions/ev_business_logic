
import 'dart:convert';

class LoginResponseData {
  final bool success;
  final String message;
  final LoginData data;
  LoginResponseData({
    required this.success,
    required this.message,
    required this.data,
  });

  LoginResponseData copyWith({
    bool? success,
    String? message,
    LoginData? data,
  }) {
    return LoginResponseData(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'success': success});
    result.addAll({'message': message});
    result.addAll({'data': data.toMap()});

    return result;
  }

  factory LoginResponseData.fromMap(Map<String, dynamic> map) {
    return LoginResponseData(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: LoginData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseData.fromJson(String source) =>
      LoginResponseData.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginResponseData(success: $success, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponseData &&
        other.success == success &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ data.hashCode;
}

class LoginData {
  final String? id;

  final String? email;
  final String? token;
  final String? role;
  final String? defaultEv;

  const LoginData({
    this.id,
    this.email,
    this.token,
    this.role,
    this.defaultEv,
  });

  LoginData copyWith({
    String? role,
    String? id,
    String? email,
    String? token,
    String? defaultEv,
  }) {
    return LoginData(
      role: role ?? this.role,
      id: id ?? this.id,
      email: email ?? this.email,
      token: token ?? this.token,
      defaultEv: defaultEv ?? this.defaultEv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'token': token,
      'role': role,
      'default_ev': defaultEv,
    };
  }

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      defaultEv: map['default_ev'] != null ? map['default_ev'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginData.fromJson(String source) =>
      LoginData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginData(id: $id,  email: $email,  token: $token)';
  }
}
