import 'package:example/stateful_example/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view/flutter_view.dart';

part 'home_page_logic.dart';

class HomePage extends StatelessView<HomePageLogic> {
  const HomePage({super.key});

  @override
  HomePageLogic viewLogicBuilder() {
    return HomePageLogic();
  }

  @override
  Widget builder(BuildContext context, HomePageLogic viewLogic) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: viewLogic.navigateToLogin,
          child: const Text("Log out"),
        ),
      ),
    );
  }
}
