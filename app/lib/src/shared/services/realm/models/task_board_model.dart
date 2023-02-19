part of 'task_model.dart';

@RealmModel()
class _TaskBoardModel {
  @PrimaryKey()
  late Uuid id;
  late String title;
  late List<_TaskModel> tasks;
  bool enable = true;
}
