part of 'card_bloc.dart';

class CardState extends Equatable {
  final FormzStatus cardStatus;
  final List<PaymentDetail> paymentDetails;
  final String? error;
  final FormzStatus deleteStatus;
  final FormzStatus markAsDefault;
  final String? deleteId;

  const CardState({
    this.cardStatus = FormzStatus.pure,
    this.paymentDetails = const [],
    this.error = '',
    this.deleteStatus = FormzStatus.pure,
    this.markAsDefault = FormzStatus.pure,
    this.deleteId,
  });

  CardState copyWith({
    FormzStatus? cardStatus,
    List<PaymentDetail>? paymentDetails,
    String? error,
    FormzStatus? deleteStatus,
    FormzStatus? markAsDefault,
    String? deleteId
  }) =>
      CardState(
        cardStatus: cardStatus ?? this.cardStatus,
        paymentDetails: paymentDetails ?? this.paymentDetails,
        error: error ?? '',
        deleteStatus: deleteStatus ?? FormzStatus.pure,
        markAsDefault: markAsDefault ?? FormzStatus.pure,
        deleteId: deleteId ?? '',
      );

  @override
  List<Object?> get props => [paymentDetails, cardStatus,deleteStatus,deleteId,markAsDefault];
}
