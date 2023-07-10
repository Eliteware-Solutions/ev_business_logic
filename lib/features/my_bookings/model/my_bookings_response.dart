import 'booking_status_enum.dart';

class MyBookingsResponse {
  bool? success;
  String? message;
  List<BookingData>? data;

  MyBookingsResponse({
    this.success,
    this.message,
    this.data,
  });

  factory MyBookingsResponse.fromJson(Map<String, dynamic> json) =>
      MyBookingsResponse(
        success: json['success'],
        message: json['message'],
        data: json['data'] == null
            ? []
            : List<BookingData>.from(
                json['data']!.map((x) => BookingData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BookingData {
  final String? id;
  final String? chargingStart;
  final String? chargingStop;
  final double? amount;
  final BookingStatus? bookingStatus;
  final String? idTag;
  final String? customer;
  final String? vehicle;
  final String? stationName;
  final String? tenant;
  final String? charger;
  final int? connector;
  final String? perUnitPrice;
  final DateTime? scheduleDatetime;
  final String? bookingType;
  final int? estimatedAmount;
  final double? estimatedUnits;
  final double? tariffPrice;
  final double? estimatedTime;
  final bool? isActive;
  final int? meterstart;
  final int? meterstop;
  final int? transactionId;

  BookingData({
    this.id,
    this.amount,
    this.bookingStatus,
    this.idTag,
    this.customer,
    this.vehicle,
    this.tenant,
    this.charger,
    this.connector,
    this.perUnitPrice,
    this.scheduleDatetime,
    this.bookingType,
    this.tariffPrice,
    this.stationName,
    this.estimatedAmount,
    this.estimatedUnits,
    this.estimatedTime,
    this.isActive,
    this.meterstart,
    this.meterstop,
    this.transactionId,
    this.chargingStart,
    this.chargingStop,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    BookingStatus getEnumData() {
      switch (json['booking_status'].toString().toUpperCase()) {
        case 'CHARGING':
          return BookingStatus.charging;
        case 'CONFIRMED':
          return BookingStatus.confirmed;
        case 'IN PROGRESS':
          return BookingStatus.inProgress;
        case 'CANCLED':
          return BookingStatus.cancelled;
        case 'EXPIRED':
          return BookingStatus.expired;
        case 'PROCESSING PAYMENT':
          return BookingStatus.processingPayment;
        case 'COMPLETED':
          return BookingStatus.completed;
        default:
          return BookingStatus.all;
      }
    }

    return BookingData(
      id: json['_id'],
      amount: json['amount'],
      bookingStatus: json['booking_status'] == null ? null : getEnumData(),
      idTag: json['idTag'],
      customer: json['customer'],
      vehicle: json['vehicle'],
      tariffPrice: json['tariff_price'],
      stationName: json['station_name'],
      tenant: json['tenant'],
      charger: json['charger'],
      connector: json['connector'],
      perUnitPrice: json['per_unit_price'],
      scheduleDatetime: json['schedule_datetime'] == null
          ? null
          : DateTime.parse(json['schedule_datetime']),
      bookingType: json['booking_type'],
      estimatedAmount: json['estimated_amount'],
      estimatedUnits: json['estimated_units']?.toDouble(),
      estimatedTime: json['estimated_time']?.toDouble(),
      isActive: json['is_active'],
      meterstart: json['meterstart'],
      meterstop: json['meterstop'],
      transactionId: json['transaction_id'],
      chargingStart: json['charging_start'],
      chargingStop: json['charging_stop'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'amount': amount,
        'booking_status': bookingStatus?.stringValue,
        'idTag': idTag,
        'customer': customer,
        'station_name': stationName,
        'tariff_price': tariffPrice,
        'vehicle': vehicle,
        'tenant': tenant,
        'charger': charger,
        'connector': connector,
        'per_unit_price': perUnitPrice,
        'schedule_datetime': scheduleDatetime?.toIso8601String(),
        'booking_type': bookingType,
        'estimated_amount': estimatedAmount,
        'estimated_units': estimatedUnits,
        'estimated_time': estimatedTime,
        'is_active': isActive,
        'meterstart': meterstart,
        'meterstop': meterstop,
        'transaction_id': transactionId,
        'charging_start': chargingStart,
        'charging_stop': chargingStop,
      };
}
