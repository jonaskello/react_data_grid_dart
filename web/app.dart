library app;

import 'package:react/react.dart';
import 'react_data_grid.dart';

typedef AppType();

var _app = registerComponent(() => new App());

AppType app = () =>
    _app({});

class App extends Component {

  final columns = [ new ReactDataGridColumn(
      key: 'title',
      name: 'Title'
  )
  ];

  rowGetter (rowIndex) => rows[rowIndex];

  var rows;

  App() {
    rows = [];
    for (var i = 1; i < 1000; i++) {
      rows.add({
        'title': 'Title ' + i.toString(),
      });
    }
  }

  render() =>
      div({}, [
        h1({}, "React Data Grid in Dart Example"),
        span({}, "This is an example"),
        reactDataGrid(columns: columns, rowGetter: rowGetter, rowsCount: rows.length, minHeight: 500)
      ]);
}