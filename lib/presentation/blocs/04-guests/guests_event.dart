part of 'guests_bloc.dart';

sealed class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object> get props => [];
}

final class SetAllFilterEvent extends GuestsEvent {}

final class SetInvitedFilterEvent extends GuestsEvent {}

final class SetNotInvitedFilterEvent extends GuestsEvent {}

final class SetCustomFilterEvent extends GuestsEvent {
  final GuestsFilter customFilter;

  const SetCustomFilterEvent(this.customFilter);
}

final class AddGuestEvent extends GuestsEvent {
  final String guestName;

  const AddGuestEvent(this.guestName);
}
