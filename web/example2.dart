library example2;

import 'package:react/react.dart';
import 'react_data_grid.dart';
import 'dart:math' as Math;

typedef Example2Type(dynamic key);

var _example2 = registerComponent(() => new _Example2());

Example2Type example2 = ([key]) => _example2({"key": key});

class _Example2 extends Component {

  //helper to generate a random date
  _randomDate(DateTime start, DateTime end) {
    final random = new Math.Random();
    return new DateTime.fromMillisecondsSinceEpoch(start.millisecondsSinceEpoch + (random.nextDouble() * (end.millisecondsSinceEpoch - start.millisecondsSinceEpoch)).round()).toString();
  }

  //helper to create a fixed number of rows
  _createRows(numberOfRows) {
    final random = new Math.Random();
    var _rows = [];
    for (int i = 1; i < numberOfRows; i++) {
      _rows.add({
        'id': i,
        'task': 'Task ' + i.toString(),
        'complete': Math.min(100, (random.nextDouble() * 110).round()),
        'priority' : ['Critical', 'High', 'Medium', 'Low'][((random.nextDouble() * 3).floor() + 1)],
        'issueType' : ['Bug', 'Improvement', 'Epic', 'Story'][((random.nextDouble() * 3) + 1).floor()],
        'startDate': _randomDate(new DateTime(2015, 3, 1), new DateTime.now()),
        'completeDate': _randomDate(new DateTime.now(), new DateTime(2016, 0, 1))
      });
    }
    return _rows;
  }

  getInitialState() {
    return {'rows' : _createRows(1000)};
  }

  //Columns definition
  final columns = [
    new ReactDataGridColumn(
        key: 'id',
        name: 'ID',
        width: 80
    ),
    new ReactDataGridColumn(
        key: 'task',
        name: 'Title',
        editable: true
    ),
    new ReactDataGridColumn(
        key: 'priority',
        name: 'Priority',
        editable: true
    ),
    new ReactDataGridColumn(
        key: 'issueType',
        name: 'Issue Type',
        editable: true
    ),
    new ReactDataGridColumn(
        key: 'complete',
        name: '% Complete',
        editable: true
    ),
    new ReactDataGridColumn(
        key: 'startDate',
        name: 'Start Date',
        editable: true
    ),
    new ReactDataGridColumn(
        key: 'completeDate',
        name: 'Expected Complete',
        editable: true
    )
  ];

  rowGetter(rowIdx) => this.state['rows'][rowIdx];

  _handleRowUpdated(e) {
    //merge updated row with current row and rerender by setting state
    //var rows = this.state['rows'];
    print(e);
    throw new Exception("TODO!");
    //Object.assign(rows[e.rowIdx], e.updated);
    //this.setState({'rows':rows});
  }

render() =>
      div({},
        span({}, "Example2"),
        reactDataGrid(
            enableCellSelect: true,
            columns: columns,
            rowGetter: rowGetter,
            rowsCount: this.state['rows'].length,
            minHeight: 500,
            onRowUpdated: _handleRowUpdated)
      );
}