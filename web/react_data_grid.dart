@JS('')
library react_data_grid;

import 'dart:js_util';
import 'dart:js';
import 'dart:convert';
import "package:js/js.dart";
import 'package:react/react.dart';
import 'package:react/react_client/react_interop.dart' as react_interop;

// -- Dart wrapper definitions

typedef RowGetterType(rowIndex);

typedef OnRowUpdatedType(RowUpdateEvent e);

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
      div({}, _reactDataGridFactoryJs(new _ReactDataGridJsProps(
          columns: columns,
          rowGetter: allowInterop((i) => jsify(rowGetter(i))),
          rowsCount: rowsCount,
          minHeight: minHeight,
          enableCellSelect: enableCellSelect,
          onRowUpdated: allowInterop(_onRowUpdatedProxyFactory(onRowUpdated)))));


}

_onRowUpdatedProxyFactory(OnRowUpdatedType onRowUpdated) {
  return (dynamic e) {
    // Convert javascript object to a Dart Map
    Map e2 = _JsObjectToDartMap(e);
    onRowUpdated(new RowUpdateEvent(e2['rowIdx'], e2['updated'], e2['cellKey'], e2['key']));
  };
}

@JS("JSON.stringify")
external String stringify(obj);

Map<String, Object> _JsObjectToDartMap(arg) {
  String json = stringify(arg);
  return JSON.decode(json);
}

class RowUpdateEvent {
  final int rowIdx;
  final Map updated;
  final String cellKey;
  final String keyCode;

  RowUpdateEvent(this.rowIdx, this.updated, this.cellKey, this.keyCode);

}


// -- JS Interop definitions

external dynamic get ReactDataGrid;

final _reactDataGridFactoryJs = react_interop.React.createFactory(ReactDataGrid);


@JS()
@anonymous
class _ReactDataGridJsProps {
  external List<ReactDataGridColumn> get columns;

  external dynamic get rowGetter;

  external int get rowsCount;

  external int get minHeight;

  external factory _ReactDataGridJsProps({
  List columns, dynamic rowGetter, int rowsCount, int minHeight,
  bool enableCellSelect,
  dynamic onRowUpdated});
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

