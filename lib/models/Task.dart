class Task {
  final String name;
  final bool status;
  final List tags;
  final double count;
  Task.fromJsonMap(Map map):
  name= map['task']['name'],
  status= map['task']['status'],
  tags= map['task']['tags'],
  count=map['task']['count']['countedTime'];
}