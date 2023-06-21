part of 'account_info_bloc.dart';

abstract class AccountInfoEvent extends Equatable {
  const AccountInfoEvent();

  @override
  List<Object> get props => [];
}
class LoadAccountInfo extends AccountInfoEvent{

}
