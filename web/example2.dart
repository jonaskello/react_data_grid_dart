library example2;

import 'package:react/react.dart';
import 'react_data_grid.dart';

typedef Example2Type(dynamic key);

var _example2 = registerComponent(() => new _Example2());

Example2Type example2 = ([key]) => _example2({"key": key});

class _Example2 extends Component {

  final columns = [ new ReactDataGridColumn(
      key: 'title',
      name: 'Title'
  )
  ];

  rowGetter(rowIndex) => rows[rowIndex];

  var rows;

  _Example2() {
    rows = [];
    for (var i = 1; i < 1000; i++) {
      rows.add({
        'title': 'Title ' + i.toString(),
      });
    }
  }

  render() =>
      div({}, [
        span({}, "Example2"),
        reactDataGrid(columns: columns, rowGetter: rowGetter, rowsCount: rows.length, minHeight: 500)
      ]);
}