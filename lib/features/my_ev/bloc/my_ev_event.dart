// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_ev_bloc.dart';

abstract class MyEvEvent extends Equatable {
  const MyEvEvent();

  @override
  List<Object?> get props => [];
}

class InitiateEvEvent extends MyEvEvent {
  final String customerID;
  const InitiateEvEvent({required this.customerID});

  @override
  List<Object?> get props => [customerID];
}

class DeleteCustomerEv extends MyEvEvent {
  final String? evModelId;
  const DeleteCustomerEv(
    this.evModelId,
  );
  @override
  List<Object?> get props => [evModelId];
}

class MarkAsDefault extends MyEvEvent {
  final String? evModelId;
  const MarkAsDefault(
    this.evModelId,
  );
  @override
  List<Object?> get props => [evModelId];
}

class FromEditEv extends MyEvEvent {
  const FromEditEv(this.fromEditEv);
  final bool fromEditEv;
  @override
  List<Object?> get props => [fromEditEv];
}

class NewEVAdded extends MyEvEvent {
  final MyEvsDetails newEv;
  const NewEVAdded({
    required this.newEv,
  });
  @override
  List<Object?> get props => [newEv];
}

