class Task {
  final String? name;
  bool status =true;
  final List? tags;
  final List<Map<String,DateTime>>? dates = [];
  Task({this.name, this.tags});
    
  addCount() {
      this.dates?.add(
        {
          "start_time":DateTime.now(),
          }
        );

    
  }
  calcCount() {
    var count = 0;
    for (var item in dates!) {
    count += DateTime.now().difference(item['start_time']!).inMilliseconds as int;


      
    }
    return count;
    
  }
  
  Task.fromJsonMap(Map map):
  name= map['task']['name'],
  status= map['task']['status'],
  tags= map['task']['tags'];
  //count=map['task']['count']['countedTime'];
   @override
  String toString() {
    return "Task (${this.name} ${this.status} ${this.tags} ${this.dates}}";
  }
}