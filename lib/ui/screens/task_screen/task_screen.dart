import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:task_list/themes/theme_data.dart';
import 'package:task_list/ui/components/custom_checkboxlisttile.dart';
import 'package:task_list/ui/screens/task_screen/task_view_model.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
        child: Scaffold(
            body: ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: const TaskWidget(),
    )));
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HeadWidget(),
        DividerWidget(),
        AddTaskTextFieldWidget(),
        TaksListViewWidget()
      ],
    );
  }
}

class TaksListViewWidget extends StatelessWidget {
  const TaksListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TaskViewModel>();
    return Expanded(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            itemCount: model.reversedTasks.length,
            padding: const EdgeInsets.symmetric(horizontal: 64),
            itemBuilder: (BuildContext context, int index) {
              final task = model.reversedTasks[index];
              return CustomCheckboxListTile(
                onChange: (bool? value) =>
                    model.onChangedCheckBox(value, index),
                value: task.isDone,
                bottomPading: 32,
                borderColor: Theme.of(context).colorScheme.borderColor,
                backgroundColor: Theme.of(context).colorScheme.borderColor,
                iconColor: Theme.of(context).colorScheme.iconColor,
                unSelectedBacgroundColor:
                    Theme.of(context).colorScheme.fillColor,
                title: Text(task.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1),
              );
            }),
      ),
    );
  }
}

class AddTaskTextFieldWidget extends StatelessWidget {
  const AddTaskTextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TaskViewModel>();
    return Visibility(
      visible: model.isAddTask,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: TextField(
              controller: model.nameTaskTextController,
              autofocus: true,
              onSubmitted: (String text) => model.onSubmitted(),
              style: Theme.of(context).textTheme.bodyText1,
              cursorColor: Theme.of(context).colorScheme.cursorColor,
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 64),
      child: Container(
        height: 1,
        color: Theme.of(context).colorScheme.borderColor,
      ),
    );
  }
}

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(64, 64, 64, 0),
      child: Row(
        children: const [
          HeaderTextWidget(),
          Spacer(),
          AddButtonWidget(),
        ],
      ),
    );
  }
}

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<TaskViewModel>();
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.backgroundButtonColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.borderColor,
          ),
        ),
        child: IconButton(
            onPressed: model.onPressAddButton,
            icon: Icon(
              Icons.add_rounded,
              color: Theme.of(context).colorScheme.iconColor,
            )));
  }
}

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Tasks", style: Theme.of(context).textTheme.headline1);
  }
}
