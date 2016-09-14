library utils;

import 'dart:math' as Math;

//helper to generate a random date
randomDate(DateTime start, DateTime end) {
  final random = new Math.Random();
  return new DateTime.fromMillisecondsSinceEpoch(start.millisecondsSinceEpoch +
      (random.nextDouble() * (end.millisecondsSinceEpoch - start.millisecondsSinceEpoch)).round())
      .toString();
}

//helper to create a fixed number of rows
createRows(numberOfRows) {
  final random = new Math.Random();
  var _rows = [];
  for (int i = 1; i < numberOfRows; i++) {
    _rows.add({
      'id': i,
      'task': 'Task ' + i.toString(),
      'complete': Math.min(100, (random.nextDouble() * 110).round()),
      'priority' : ['Critical', 'High', 'Medium', 'Low'][((random.nextDouble() * 3).floor() + 1)],
      'issueType' : ['Bug', 'Improvement', 'Epic', 'Story'][((random.nextDouble() * 3) + 1).floor()],
      'startDate': randomDate(new DateTime(2015, 3, 1), new DateTime.now()),
      'completeDate': randomDate(new DateTime.now(), new DateTime(2016, 0, 1))
    });
  }
  return _rows;
}
