import 'package:flutter/widgets.dart';

part 'stateless_view_logic.dart';

abstract class StatelessView<T extends StatelessViewLogic>
    extends StatelessWidget {
  const StatelessView({super.key});

  @override
  Widget build(BuildContext context) {
    final T viewLogic = viewLogicBuilder();

    viewLogic.context = context;

    return builder(context, viewLogic);
  }

  T viewLogicBuilder();

  Widget builder(BuildContext context, T viewLogic);
}
