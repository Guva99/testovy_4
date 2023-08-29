import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testovy_zadanie4/core/service/shared_preference.dart';
import 'package:testovy_zadanie4/feature/profile_screen/UI/state/profile_state_page.dart';

final authManagerProvider = Provider(
  (ref) => ProfileManager(
    authPageState: ref.watch(profilePageStateProvider.notifier),
  ),
);

class ProfileManager {
  ProfileManager({
    required this.authPageState,
  });

  final ProfilePageStateHolder authPageState;

  Future<void> email() async {
    final prefs = await SharedPreferences.getInstance();
    final email = SharedPrefsRawProvider(prefs).getString(SharedKeyWords.email) ?? 'Почта';
    authPageState.setEmail(email);
  }

  Future<void> nick() async {
    final prefs = await SharedPreferences.getInstance();
    final nick = SharedPrefsRawProvider(prefs).getString(SharedKeyWords.userNick) ?? 'Ник';
    authPageState.setNick(nick);
  }
}
