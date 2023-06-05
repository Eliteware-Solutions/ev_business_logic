part of 'my_ev_bloc.dart';

class MyEvState extends Equatable {
  final List<MyEvsDetails> listOfEv;
  final FormzStatus myEvStatus;
  final FormzStatus deleteStatus;
  final FormzStatus markStatus;
  final String? selectedForDelete;
  final String? msg;
  final String? error;
  final User? user;
  final bool? fromEditEv;

  const MyEvState({
    this.listOfEv = const [],
    this.myEvStatus = FormzStatus.pure,
    this.deleteStatus = FormzStatus.pure,
    this.markStatus = FormzStatus.pure,
    this.selectedForDelete,
    this.msg,
    this.error,
    this.user,
    this.fromEditEv = false,
  });

  MyEvState copyWith({
    List<MyEvsDetails>? listOfEv,
    FormzStatus? myEvStatus,
    FormzStatus? deleteStatus,
    FormzStatus? markStatus,
    String? selectedForDelete,
    String? msg,
    String? error,
    User? user,
    bool? fromEditEv,
  }) {
    return MyEvState(
      listOfEv: listOfEv ?? this.listOfEv,
      myEvStatus: myEvStatus ?? this.myEvStatus,
      deleteStatus: deleteStatus ?? FormzStatus.pure,
      markStatus: markStatus ?? FormzStatus.pure,
      selectedForDelete: selectedForDelete ?? this.selectedForDelete,
      msg: msg ?? this.msg,
      error: error ?? this.error,
      user: user ?? this.user,
      fromEditEv: fromEditEv ?? this.fromEditEv,
    );
  }

  @override
  List<Object?> get props {
    return [
      listOfEv,
      myEvStatus,
      deleteStatus,
      markStatus,
      selectedForDelete,
      msg,
      error,
      user,
      fromEditEv,
    ];
  }
}
