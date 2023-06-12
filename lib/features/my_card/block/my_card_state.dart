import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/my_card/models/card_response.dart';
import 'package:ev_business_logic/features/my_ev/models/user_model.dart';
import 'package:formz/formz.dart';

class MyCardState extends Equatable {
  final List<CardData> listOfCard;
  final FormzStatus myCardStatus;
  final FormzStatus deleteStatus;
  final FormzStatus markStatus;

  final User? user;
  final String? msg;
  final String? error;

  const MyCardState({
    this.listOfCard = const [],
    this.myCardStatus = FormzStatus.pure,
    this.deleteStatus = FormzStatus.pure,
    this.markStatus = FormzStatus.pure,
    this.user,
    this.msg,
    this.error,
  });

  MyCardState copyWith({
    List<CardData>? listOfCard,
    FormzStatus? myCardStatus,
    FormzStatus? deleteStatus,
    FormzStatus? markStatus,
    User? user,
    String? selectedForDelete,
    String? msg,
    String? error,
  }) {
    return MyCardState(
      listOfCard: listOfCard ?? this.listOfCard,
      myCardStatus: myCardStatus ?? this.myCardStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      markStatus: markStatus ?? this.markStatus,
      msg: msg ?? this.msg,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props {
    return [
      listOfCard,
      myCardStatus,
      deleteStatus,
      markStatus,
      msg,
      error,
      user
    ];
  }
}
