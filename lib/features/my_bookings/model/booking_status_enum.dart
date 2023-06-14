enum BookingStatus {
  all,
  confirmed,
  inProgress,
  cancelled,
  expired,
  charging,
}

extension BookingStatusExtension on BookingStatus {
  String get stringValue {
    switch (this) {
      case BookingStatus.all:
        return 'All';
      case BookingStatus.confirmed:
        return 'Confirmed';
      case BookingStatus.inProgress:
        return 'In Progress';
      case BookingStatus.cancelled:
        return 'Cancelled';
      case BookingStatus.expired:
        return 'Expired';
      case BookingStatus.charging:
        return 'Charging';
    }
  }
}
