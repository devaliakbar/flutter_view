part of 'home_page.dart';

class HomePageLogic extends StatelessViewLogic {
  void navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
