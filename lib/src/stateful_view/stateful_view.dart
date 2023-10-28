import 'package:flutter/widgets.dart';

part 'stateful_view_logic.dart';

abstract class StatefulView<T extends StatefulViewLogic>
    extends StatefulWidget {
  const StatefulView({super.key});

  T viewLogicBuilder();

  Widget builder(BuildContext context, T viewLogic);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulView> createState() {
    final StatefulViewLogic viewLogic = viewLogicBuilder();
    return _State(viewLogic: viewLogic);
  }
}

class _State extends State<StatefulView> {
  final StatefulViewLogic viewLogic;

  _State({required this.viewLogic});

  @override
  void initState() {
    viewLogic.context = context;

    viewLogic.initState();
    viewLogic.poseState(this);

    super.initState();
  }

  @override
  void dispose() {
    viewLogic.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewLogic.context = context;

    return widget.builder(context, viewLogic);
  }
}
