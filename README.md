# flutter_view

## Description

The `flutter_view` promoting a clear separation of UI and logic, resulting in more organized and maintainable code. It offers a structured approach to creating both Stateless and Stateful widgets, complete with their respective logic classes.

## How to Use

Add this project as a dependency in your `pubspec.yaml` file.

### Example: Creating a Stateless Widget

In this example, we will create a simple Stateless widget for a home page using the `flutter_view` package. You will need to create two files: one for the View and another for the ViewLogic.

### Step 1: Create Two Files

**home_page_logic.dart** - Within this file, you will define the logic for the home page, enabling you to access the context from anywhere. It's important to name the logic class to match the view class name and append it with "Logic." We extend the logic class with `StatelessViewLogic`.

**home_page.dart** - This file serves as the View for the home page. It extends `StatelessView` with the generic type set to `HomePageLogic`. Within this file, you should implement two critical abstract methods: `viewLogicBuilder`, where you create an instance of the logic class (`HomePageLogic`), and `builder`, where you return the widget and gain access to the logic class, facilitating seamless interaction between the View and its associated logic.


### Step 2: Add Code to Each File

**home_page_logic.dart**

```dart
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
```

**home_page.dart**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_view/flutter_view.dart';

part 'home_page_logic.dart';

class HomePage extends StatelessView<HomePageLogic> {
  const HomePage({Key? key});

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
```

### Example: Creating a Stateful Widget

In this example, we will create a simple Stateful widget for a login page using the `flutter_view` package. You will need to create two files: one for the View and another for the ViewLogic.

### Step 1: Create Two Files

**login_page_logic.dart** - This file will contain the login page's logic, allowing you to manage state, access the context, and override methods such as `initState` and `dispose`. It's important to name the logic class to match the view class name and append it with "Logic". We extend the logic class with `StatefulViewLogic`.

**login_page.dart** - This file serves as the View for the login page and extends `StatefulView` with the generic type set to `LoginPageLogic`. Within this file, you should implement two crucial abstract methods: `viewLogicBuilder`, where you instantiate the logic class (`LoginPageLogic`), and `builder`, where you return the widget and gain access to the logic class, enabling seamless interaction between the View and its associated logic.

### Step 2: Add Code to Each File

**login_page_logic.dart**

```dart
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
```


**login_page.dart**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_view/flutter_view.dart';

part 'login_page_logic.dart';

class LoginPage extends StatefulView<LoginPageLogic> {
  const LoginPage({Key? key});

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
              labelText: "Username",
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: viewLogic.isLoginButtonEnabled ? viewLogic.onLogin : null,
            child: const Text("Sign in"),
          )
        ],
      ),
    );
  }
}
```