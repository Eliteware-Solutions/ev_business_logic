import 'dart:convert';

class ChargingResponseModel {
  final bool success;
  final String message;
  ChargingResponseModel({
    required this.success,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'success': success});
    result.addAll({'message': message});

    return result;
  }

  factory ChargingResponseModel.fromMap(Map<String, dynamic> map) {
    return ChargingResponseModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChargingResponseModel.fromJson(String source) =>
      ChargingResponseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChargingResponseModel(success: $success, message: $message)';
}
