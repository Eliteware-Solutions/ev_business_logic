import 'package:equatable/equatable.dart';

abstract class MyCardEvent extends Equatable {
  const MyCardEvent();

  @override
  List<Object?> get props => [];
}

class InitiateMyCardEvent extends MyCardEvent {
  final String customerID;
  const InitiateMyCardEvent({required this.customerID});

  @override
  List<Object?> get props => [customerID];
}

class DeleteCustomerCard extends MyCardEvent {
  final String? paymentId;
  const DeleteCustomerCard({
    this.paymentId,
  });
  @override
  List<Object?> get props => [paymentId];
}

class MarkAsDefault extends MyCardEvent {
  final String? paymentId;
  const MarkAsDefault({
    this.paymentId,
  });
  @override
  List<Object?> get props => [paymentId];
}
