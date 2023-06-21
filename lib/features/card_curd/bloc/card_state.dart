part of 'card_bloc.dart';

class CardState extends Equatable {
  final FormzStatus cardStatus;
  final List<PaymentDetail> paymentDetails;
  final String? error;
  final FormzStatus deleteStatus;
  final FormzStatus markAsDefault;
  final String? deleteId;
  final FormzStatus addCardStatus;
  final PaymentDetail? addedCard;

  const CardState({
    this.cardStatus = FormzStatus.pure,
    this.paymentDetails = const [],
    this.error = '',
    this.deleteStatus = FormzStatus.pure,
    this.markAsDefault = FormzStatus.pure,
    this.addCardStatus = FormzStatus.pure,
    this.deleteId,
    this.addedCard,
  });

  CardState copyWith(
          {FormzStatus? cardStatus,
          List<PaymentDetail>? paymentDetails,
          String? error,
          FormzStatus? deleteStatus,
          FormzStatus? addCardStatus,
          FormzStatus? markAsDefault,
          PaymentDetail? addedCard,
          String? deleteId}) =>
      CardState(
        cardStatus: cardStatus ?? this.cardStatus,
        paymentDetails: paymentDetails ?? this.paymentDetails,
        addedCard: addedCard ?? this.addedCard,
        error: error ?? '',
        deleteStatus: deleteStatus ?? FormzStatus.pure,
        markAsDefault: markAsDefault ?? FormzStatus.pure,
        addCardStatus: addCardStatus ?? FormzStatus.pure,
        deleteId: deleteId ?? '',
      );

  @override
  List<Object?> get props => [
        paymentDetails,
        cardStatus,
        deleteStatus,
        addedCard,
        deleteId,
        markAsDefault,
        addCardStatus,
      ];
}
