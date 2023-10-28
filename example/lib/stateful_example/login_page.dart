import 'package:example/stateless_example/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view/flutter_view.dart';

part 'login_page_logic.dart';

class LoginPage extends StatefulView<LoginPageLogic> {
  const LoginPage({super.key});

  @override
  LoginPageLogic viewLogicBuilder() {
    return LoginPageLogic();
  }

  @override
  Widget builder(BuildContext context, LoginPageLogic viewLogic) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          TextField(
            controller: viewLogic.usernameController,
            onChanged: viewLogic.onUsernameTextChange,
            decoration: const InputDecoration(
              label: Text("Username"),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed:
                viewLogic.isLoginButtonEnabled ? viewLogic.onLogin : null,
            child: const Text("Sign in"),
          )
        ],
      ),
    );
  }
}
