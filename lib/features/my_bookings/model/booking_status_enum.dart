enum BookingStatus {
  all,
  confirmed,
  inProgress,
  canceled,
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
      case BookingStatus.canceled:
        return 'Canceled';
    }
  }
}