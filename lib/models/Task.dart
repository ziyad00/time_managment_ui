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
    stopCount() {
      this.dates?.last["stop_time"]=DateTime.now();

    
  }
  calcCount() {
    var count = 0;
    for (var item in dates!) {
    if(item['stop_time'] !=null){
    count += item['stop_time']?.difference(item['start_time']!).inSeconds as int;
    }else {
      count += DateTime.now().difference(item['start_time']!).inSeconds as int;

    }

      
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
    return "Task (name: ${this.name} status: ${this.status} tags: ${this.tags} count: ${this.calcCount()} startDate: ${this.dates?.last['start_time']})";
  }
}