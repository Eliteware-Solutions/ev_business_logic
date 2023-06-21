// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'account_info_bloc.dart';

class AccountInfoState extends Equatable {
  final FormzStatus accInfoDataStatus;
  const AccountInfoState(
    {this.accInfoDataStatus =  FormzStatus.pure}
  );

  @override
  List<Object> get props => [accInfoDataStatus];

  @override
  bool get stringify => true;

  AccountInfoState copyWith({
    FormzStatus? accInfoDataStatus,
  }) {
    return AccountInfoState(accInfoDataStatus: 
      accInfoDataStatus ?? this.accInfoDataStatus,
    );
  }
}

