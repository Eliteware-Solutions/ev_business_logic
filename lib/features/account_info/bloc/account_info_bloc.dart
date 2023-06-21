import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_business_logic/features/account_info/repo/account_info_repo.dart';
import 'package:ev_business_logic/services/api_result_service.dart';
import 'package:formz/formz.dart';

part 'account_info_event.dart';
part 'account_info_state.dart';

class AccountInfoBloc extends Bloc<AccountInfoEvent, AccountInfoState> {
  AccountInfoBloc() : super(const AccountInfoState()) {
    AccountInfoRepo accountInfoRepo = AccountInfoRepo();
    on<LoadAccountInfo>((event, emit) async {
      try {
        emit(state.copyWith(
            accInfoDataStatus: FormzStatus.submissionInProgress));
        RepoResult? response = await accountInfoRepo.accountInfoData();
        await Future.delayed(const Duration(seconds: 2));
        if (response is RepoSuccess) {}
        emit(state.copyWith(accInfoDataStatus: FormzStatus.submissionSuccess));
        // TODO: implement event handler
      } catch (e) {
        emit(state.copyWith(accInfoDataStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
