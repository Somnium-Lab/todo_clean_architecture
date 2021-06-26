// ignore: implementation_imports
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/add-todo-controller.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/add-todo-state-machine.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/view/mobile/add-todo-mobile-view.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/view/mobile/error-todo-mobile-view.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/view/mobile/loading-view.dart';

class AddTodoView extends View {
  @override
  State<StatefulWidget> createState() => AddTodoViewState();
}

class AddTodoViewState
    extends ResponsiveViewState<AddTodoView, AddTodoController> {
  AddTodoViewState() : super(new AddTodoController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<AddTodoController>(
        builder: (builder, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      print('Mobile view : $currentStateType');

      switch (currentStateType) {
        case AddTodoInitState:
          return AddTodoMobileView(addTodoController: controller);

        case AddTodoLoadingState:
          return LoadingView(addTodoController: controller);

        case AddTodoErrorState:
          return ErrorTodoMobileView(addTodoController: controller);

        default:
          throw Exception(
              "Unknown Exception : $currentStateType : AddTodoView");
      }
    });
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}
