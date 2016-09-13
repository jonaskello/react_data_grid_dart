@JS('')
library react_data_grid;

import 'dart:js_util';
import "package:js/js.dart";
import 'package:react/react.dart';
import 'package:react/react_client/react_interop.dart' as react_interop;

// -- Dart wrapper definitions

typedef RowGetterType(rowIndex);
typedef OnRowUpdatedType(e);

typedef ReactDataGridType({List<
    ReactDataGridColumn> columns, RowGetterType rowGetter, int rowsCount, int minHeight, bool enableCellSelect,
OnRowUpdatedType onRowUpdated});

final _reactDataGrid = registerComponent(() => new _ReactDataGrid());

ReactDataGridType reactDataGrid = (
    {columns, rowGetter, rowsCount, minHeight, enableCellSelect, onRowUpdated}) =>
    _reactDataGrid({'columns':columns, 'rowGetter':rowGetter, 'rowsCount': rowsCount, 'minHeight': minHeight,
      'enableCellSelect': enableCellSelect, 'onRowUpdated':onRowUpdated});

class _ReactDataGrid extends Component {

  get columns => props['columns'];

  get rowGetter => props['rowGetter'];

  get rowsCount => props['rowsCount'];

  get minHeight => props['minHeight'];

  get enableCellSelect => props['enableCellSelect'];

  get onRowUpdated => props['onRowUpdated'];

  render() =>
      div({}, _reactDataGridFactoryJs(new ReactDataGridJsProps(
          columns: columns,
          rowGetter: allowInterop((i) => jsify(rowGetter(i))),
          rowsCount: rowsCount,
          minHeight: minHeight)));

}

// -- JS Interop definitions

external dynamic get ReactDataGrid;

final _reactDataGridFactoryJs = react_interop.React.createFactory(ReactDataGrid);

@JS()
@anonymous
class ReactDataGridJsProps {
  external List<ReactDataGridColumn> get columns;

  external dynamic get rowGetter;

  external int get rowsCount;

  external int get minHeight;

  external factory ReactDataGridJsProps({List columns, dynamic rowGetter, int rowsCount, int minHeight});
}

@JS()
@anonymous
class ReactDataGridColumn {
  external String get key;

  external String get name;

  external int get width;

  external bool get editable;

  external factory ReactDataGridColumn({String key, String name, int width, bool editable});
}

