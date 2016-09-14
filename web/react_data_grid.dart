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

typedef OnGridSortType(String sortColumn, String sortDirection);

typedef ReactDataGridType({
List<ReactDataGridColumn> columns,
RowGetterType rowGetter,
int rowsCount,
int minHeight,
bool enableCellSelect,
OnRowUpdatedType onRowUpdated,
OnGridSortType onGridSort});

final _reactDataGrid = registerComponent(() => new _ReactDataGrid());

ReactDataGridType reactDataGrid = (
    {columns, rowGetter, rowsCount, minHeight, enableCellSelect, onRowUpdated, onGridSort}) =>
    _reactDataGrid({
      'columns':columns,
      'rowGetter':rowGetter,
      'rowsCount': rowsCount,
      'minHeight': minHeight,
      'enableCellSelect': enableCellSelect,
      'onRowUpdated': onRowUpdated,
      'onGridSort': onGridSort
    });

class _ReactDataGrid extends Component {

  get columns => props['columns'];

  get rowGetter => props['rowGetter'];

  get rowsCount => props['rowsCount'];

  get minHeight => props['minHeight'];

  get enableCellSelect => props['enableCellSelect'];

  get onRowUpdated => props['onRowUpdated'];

  get onGridSort => props['onGridSort'];

  render() {

    var props = new _ReactDataGridJsProps(
        columns: columns,
        rowGetter: allowInterop((i) => jsify(rowGetter(i))),
        rowsCount: rowsCount,
        minHeight: minHeight,
        enableCellSelect: enableCellSelect,
        onRowUpdated: allowInterop(_onRowUpdatedProxyFactory(onRowUpdated)),
        onGridSort: allowInterop(onGridSort));

    return _reactDataGridFactoryJs(props);
  }
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

  //external dynamic get onRowUpdated;

  //external dynamic get onGridSort;

  external factory _ReactDataGridJsProps({
  List columns,
  dynamic rowGetter,
  int rowsCount,
  int minHeight,
  bool enableCellSelect,
  dynamic onRowUpdated,
  dynamic onGridSort});

  /*
  rowHeight: React.PropTypes.number.isRequired,
    headerRowHeight: React.PropTypes.number,
    minHeight: React.PropTypes.number.isRequired,
    minWidth: React.PropTypes.number,
    enableRowSelect: React.PropTypes.oneOfType([React.PropTypes.bool, React.PropTypes.string]),
    onRowUpdated: React.PropTypes.func,
    rowGetter: React.PropTypes.func.isRequired,
    rowsCount: React.PropTypes.number.isRequired,
    toolbar: React.PropTypes.element,
    enableCellSelect: React.PropTypes.bool,
    columns: React.PropTypes.oneOfType([React.PropTypes.object, React.PropTypes.array]).isRequired,
    onFilter: React.PropTypes.func,
    onCellCopyPaste: React.PropTypes.func,
    onCellsDragged: React.PropTypes.func,
    onAddFilter: React.PropTypes.func,
    onGridSort: React.PropTypes.func,
    onDragHandleDoubleClick: React.PropTypes.func,
    onGridRowsUpdated: React.PropTypes.func,
    onRowSelect: React.PropTypes.func,
    rowKey: React.PropTypes.string,
    rowScrollTimeout: React.PropTypes.number,
    onClearFilters: React.PropTypes.func,
    contextMenu: React.PropTypes.element,
    cellNavigationMode: React.PropTypes.oneOf(['none', 'loopOverRow', 'changeRow']),
    onCellSelected: React.PropTypes.func,
    onCellDeSelected: React.PropTypes.func,
    onCellExpand: React.PropTypes.func,
    enableDragAndDrop: React.PropTypes.bool,
    onRowExpandToggle: React.PropTypes.func,
    draggableHeaderCell: React.PropTypes.func,
    getValidFilterValues: React.PropTypes.func,
    rowSelection: React.PropTypes.shape({
      enableShiftSelect: React.PropTypes.bool,
      onRowsSelected: React.PropTypes.func,
      onRowsDeselected: React.PropTypes.func,
      showCheckbox: React.PropTypes.bool,
      selectBy: React.PropTypes.oneOfType([
        React.PropTypes.shape({
          indexes: React.PropTypes.arrayOf(React.PropTypes.number).isRequired
        }),
        React.PropTypes.shape({
          isSelectedKey: React.PropTypes.string.isRequired
        }),
        React.PropTypes.shape({
          keys: React.PropTypes.shape({
            values: React.PropTypes.array.isRequired,
            rowKey: React.PropTypes.string.isRequired
          }).isRequired
        })
      ]).isRequired
    }),
    onRowClick: React.PropTypes.func,
    onGridKeyUp: React.PropTypes.func,
    onGridKeyDown: React.PropTypes.func,
    rowGroupRenderer: React.PropTypes.func,
    rowActionsCell: React.PropTypes.func

   */

}

@JS()
@anonymous
class ReactDataGridColumn {
  external String get key;

  external String get name;

  external int get width;

  external bool get editable;

  external bool get sortable;

  external factory ReactDataGridColumn({String key, String name, int width, bool editable, bool sortable});
}

