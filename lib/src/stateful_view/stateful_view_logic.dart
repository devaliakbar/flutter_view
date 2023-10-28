part of 'stateful_view.dart';

abstract class StatefulViewLogic {
  late BuildContext context;

  State? _state;

  void initState() {}

  void dispose() {}

  void poseState(State state) {
    _state = state;
  }

  void setState() {
    // ignore: invalid_use_of_protected_member
    _state!.setState(() {});
  }
}
