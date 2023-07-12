import 'package:flutter/material.dart';

enum AvailabilityStatus {
  charging,
  available,
  unAvailable,
  preparing,
  finishing
}

extension AvailabilityStatusExtension on AvailabilityStatus {
  Color get color {
    switch (this) {
      case AvailabilityStatus.charging:
        return Colors.yellow;
      case AvailabilityStatus.available:
        return Colors.green;
      case AvailabilityStatus.unAvailable:
        return Colors.red;
      case AvailabilityStatus.preparing:
        return Colors.white;
      case AvailabilityStatus.finishing:
        return Colors.grey;
    }
  }
}

extension AvailabilityExtension on AvailabilityStatus {
  String get name {
    switch (this) {
      case AvailabilityStatus.charging:
        return 'Charging';
      case AvailabilityStatus.available:
        return 'Available';
      case AvailabilityStatus.unAvailable:
        return 'Unavailable';
      case AvailabilityStatus.preparing:
        return 'Preparing';
      case AvailabilityStatus.finishing:
        return 'Finishing';
    }
  }
}
