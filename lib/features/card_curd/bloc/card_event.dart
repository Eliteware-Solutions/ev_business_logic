part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {}

class GetAllPaymentDetails extends CardEvent {
  final String customerId;
  GetAllPaymentDetails({required this.customerId});

  @override
  List<Object?> get props => [customerId];
}

class CreateCard extends CardEvent {
  final PaymentDetail paymentDetail;

  CreateCard({required this.paymentDetail});

  @override
  List<Object?> get props => [paymentDetail];
}

class CardDeleteEvent extends CardEvent {
  final String cardId;
  CardDeleteEvent({required this.cardId});

  @override
  List<Object?> get props => [cardId];
}

class CardMarkAsDefaultEvent extends CardEvent {
  final String cardId;
  CardMarkAsDefaultEvent({required this.cardId});

  @override
  List<Object?> get props => [cardId];
}
