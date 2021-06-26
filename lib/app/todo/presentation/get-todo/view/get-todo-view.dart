// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/get-todo-controller.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/get-todo-state-machine.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/view/mobile/error-todo-mobile-view.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/view/mobile/get-todo-mobile-view.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/view/mobile/loading-view.dart';

class GetTodoView extends View {
  @override
  State<StatefulWidget> createState() => GetTodoViewState();
}

class GetTodoViewState
    extends ResponsiveViewState<GetTodoView, GetTodoController> {
  GetTodoViewState() : super(new GetTodoController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<GetTodoController>(
        builder: (builder, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      final state = controller.getCurrentState();
      print('Mobile View : $currentStateType');

      switch (currentStateType) {
        case GetTodoInitializationState:
          return LoadingView(getTodoController: controller);

        case GetTodoInitializedState:
          GetTodoInitializedState getTodoInitializedState =
              state as GetTodoInitializedState;
          return GetTodoMobileView(
            getTodoController: controller,
            getTodoInitializedState: getTodoInitializedState,
          );

        case GetTodoErrorState:
          return ErrorTodoMobileView(getTodoController: controller);

        default:
          throw Exception(
              "Unknown Exception : $currentStateType : GetTodoView");
      }
    });
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}
