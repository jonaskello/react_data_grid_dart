@JS('')
library my_grid;

import "package:js/js.dart";
import 'dart:js_util';

import 'package:react/react.dart';
import 'react_data_grid.dart';

// It would be faster to create the rows like this, but then we need to knwo everything about at compile-time
//@JS()
//@anonymous
//class MyRow {
//  external String get title;
//
//  external factory MyRow({String title});
//}

typedef RowGetterType(rowIndex);

typedef MyGridType({List<ReactDataGridColumn> columns, RowGetterType rowGetter, int rowsCount, int minHeight});

final _myGrid = registerComponent(() => new _MyGrid());

MyGridType myGrid = ({columns, rowGetter, rowsCount, minHeight}) =>
    _myGrid({'columns':columns, 'rowGetter':rowGetter, 'rowsCount': rowsCount, 'minHeight': minHeight});

class _MyGrid extends Component {

  get columns => props['columns'];
  get rowGetter => props['rowGetter'];
  get rowsCount => props['rowsCount'];
  get minHeight => props['minHeight'];

  render() =>
      div({}, reactDataGrid(new ReactDataGridProps(
          columns: columns,
          rowGetter: allowInterop((i) => jsify(rowGetter(i))),
          rowsCount: rowsCount,
          minHeight: minHeight)));

}

