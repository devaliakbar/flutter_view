part of 'login_page.dart';

class LoginPageLogic extends StatefulViewLogic {
  final TextEditingController usernameController = TextEditingController();
  bool isLoginButtonEnabled = false;

  @override
  void initState() {
    isLoginButtonEnabled = false;
  }

  @override
  void dispose() {
    usernameController.dispose();
  }

  void onUsernameTextChange(String value) {
    isLoginButtonEnabled = value.trim().isNotEmpty;

    setState();
  }

  void onLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
