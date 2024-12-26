import 'dart:core';
import 'dart:ffi';

class TaskObj {
  final Long taskId;
  final String title;
  final String subtitle;
  final String contents;
  final bool completed;
  final Long lastModifyTime;

  TaskObj(this.taskId, this.title, this.subtitle, this.contents, this.completed, this.lastModifyTime);
}