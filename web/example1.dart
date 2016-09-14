library example1;

import 'package:react/react.dart';
import 'react_data_grid.dart';

typedef Example1Type(dynamic key);

var _example1 = registerComponent(() => new _Example1());

Example1Type example1 = ([key]) => _example1({"key": key});

class _Example1 extends Component {

  final columns = [
    new ReactDataGridColumn(key: 'id', name: 'ID'),
    new ReactDataGridColumn(key: 'title', name: 'Title'),
    new ReactDataGridColumn(key: 'count', name: 'Count'),
  ];

  rowGetter(rowIndex) => rows[rowIndex];

  var rows;

  _Example1() {
    rows = [];
    for (var i = 1; i < 1000; i++) {
      rows.add({
        'id': i,
        'title': 'Title ' + i.toString(),
        'count': i * 1000
      });
    }

  }

  render() =>
      reactDataGrid(columns: columns, rowGetter: rowGetter, rowsCount: rows.length, minHeight: 400);
}
