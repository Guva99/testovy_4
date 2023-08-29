import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state_page.freezed.dart';

@freezed
class ProfilePageState with _$ProfilePageState {
  const factory ProfilePageState({

    required String nick,
    required String email,
  }) = _ProfilePageState;
}

final profilePageStateProvider = StateNotifierProvider<ProfilePageStateHolder, ProfilePageState>(
      (ref) => ProfilePageStateHolder(),
);

class ProfilePageStateHolder extends StateNotifier<ProfilePageState> {
  ProfilePageStateHolder()
      : super(
    const ProfilePageState(
       email: '',
       nick: '',
    ),
  );

  String get nick => state.nick;

  String get email => state.email;


  void setNick(String nick) => state = state.copyWith(
    nick: nick,
  );

  void setEmail(String email) => state = state.copyWith(
    email: email,
  );


}
