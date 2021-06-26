import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/todo/domain/entity/todo-entity.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/update-todo-controller.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/update-todo-state-machine.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/view/mobile/error-todo-mobile-view.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/view/mobile/update-todo-mobile-view.dart';

class UpdateTodoView extends View {
  final UpdateTodoViewParams updateTodoViewParams;

  UpdateTodoView(this.updateTodoViewParams);

  @override
  State<StatefulWidget> createState() => UpdateTodoViewState();
}

class UpdateTodoViewState
    extends ResponsiveViewState<UpdateTodoView, UpdateTodoController> {
  UpdateTodoViewState() : super(new UpdateTodoController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<UpdateTodoController>(
        builder: (builder, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      print('Mobile view : $currentStateType');

      switch (currentStateType) {
        case UpdateTodoInitState:
          return UpdateTodoMobileView(
            updateTodoController: controller,
            task: widget.updateTodoViewParams.task,
          );

        case UpdateTodoErrorState:
          return ErrorUpdateTodoMobileView(updateTodoController: controller);

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

class UpdateTodoViewParams {
  final TodoEntity task;

  UpdateTodoViewParams(this.task);
}
