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
num rowHeight, // isRequired,
num headerRowHeight,
num minHeight, // isRequired,
num minWidth,
dynamic enableRowSelect, // oneOfType(bool, string),
OnRowUpdatedType onRowUpdated,
RowGetterType rowGetter, // isRequired,
num rowsCount, // isRequired,
dynamic toolbar, //: React.PropTypes.element,
bool enableCellSelect,
List<ReactDataGridColumn> columns, // oneOfType([object, array]).isRequired,
Function onFilter,
Function onCellCopyPaste,
Function onCellsDragged,
Function onAddFilter,
OnGridSortType onGridSort,
Function onDragHandleDoubleClick,
Function onGridRowsUpdated,
Function onRowSelect,
String rowKey,
num rowScrollTimeout,
Function onClearFilters,
dynamic contextMenu, // React.PropTypes.element,
dynamic cellNavigationMode, //oneOf(['none', 'loopOverRow', 'changeRow']),
Function onCellSelected,
Function onCellDeSelected,
Function onCellExpand,
bool enableDragAndDrop,
Function onRowExpandToggle,
Function draggableHeaderCell,
Function getValidFilterValues,
dynamic rowSelection,
Function onRowClick,
Function onGridKeyUp,
Function onGridKeyDown,
Function rowGroupRenderer,
Function rowActionsCell
});

final _reactDataGrid = registerComponent(() => new _ReactDataGrid());

ReactDataGridType reactDataGrid = ({
rowHeight,
headerRowHeight,
minHeight,
minWidth,
enableRowSelect,
onRowUpdated,
rowGetter,
rowsCount,
toolbar,
enableCellSelect,
columns,
onFilter,
onCellCopyPaste,
onCellsDragged,
onAddFilter,
onGridSort,
onDragHandleDoubleClick,
onGridRowsUpdated,
onRowSelect,
rowKey,
rowScrollTimeout,
onClearFilters,
contextMenu,
cellNavigationMode,
onCellSelected,
onCellDeSelected,
onCellExpand,
enableDragAndDrop,
onRowExpandToggle,
draggableHeaderCell,
getValidFilterValues,
rowSelection,
onRowClick,
onGridKeyUp,
onGridKeyDown,
rowGroupRenderer,
rowActionsCell
}) =>
    _reactDataGrid({
    'rowHeight': rowHeight,
    'headerRowHeight': headerRowHeight,
    'minHeight': minHeight,
    'minWidth': minWidth,
    'enableRowSelect': enableRowSelect,
    'onRowUpdated': onRowUpdated,
    'rowGetter': rowGetter,
    'rowsCount': rowsCount,
    'toolbar': toolbar,
    'enableCellSelect': enableCellSelect,
    'columns': columns,
    'onFilter': onFilter,
    'onCellCopyPaste': onCellCopyPaste,
    'onCellsDragged': onCellsDragged,
    'onAddFilter': onAddFilter,
    'onGridSort': onGridSort,
    'onDragHandleDoubleClick': onDragHandleDoubleClick,
    'onGridRowsUpdated': onGridRowsUpdated,
    'onRowSelect': onRowSelect,
    'rowKey': rowKey,
    'rowScrollTimeout': rowScrollTimeout,
    'onClearFilters': onClearFilters,
    'contextMenu': contextMenu,
    'cellNavigationMode': cellNavigationMode,
    'onCellSelected': onCellSelected,
    'onCellDeSelected': onCellDeSelected,
    'onCellExpand': onCellExpand,
    'enableDragAndDrop': enableDragAndDrop,
    'onRowExpandToggle': onRowExpandToggle,
    'draggableHeaderCell': draggableHeaderCell,
    'getValidFilterValues': getValidFilterValues,
    'rowSelection': rowSelection,
    'onRowClick': onRowClick,
    'onGridKeyUp': onGridKeyUp,
    'onGridKeyDown': onGridKeyDown,
    'rowGroupRenderer': rowGroupRenderer,
    'rowActionsCel': rowActionsCell
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

  external factory _ReactDataGridJsProps({
  num rowHeight, // isRequired,
  num headerRowHeight,
  num minHeight, // isRequired,
  num minWidth,
  dynamic enableRowSelect, // oneOfType(bool, string),
  Function onRowUpdated,
  Function rowGetter, // isRequired,
  num rowsCount, // isRequired,
  dynamic toolbar, //: React.PropTypes.element,
  bool enableCellSelect,
  List columns, // oneOfType([object, array]).isRequired,
  Function onFilter,
  Function onCellCopyPaste,
  Function onCellsDragged,
  Function onAddFilter,
  Function onGridSort,
  Function onDragHandleDoubleClick,
  Function onGridRowsUpdated,
  Function onRowSelect,
  String rowKey,
  num rowScrollTimeout,
  Function onClearFilters,
  dynamic contextMenu, // React.PropTypes.element,
  dynamic cellNavigationMode, //oneOf(['none', 'loopOverRow', 'changeRow']),
  Function onCellSelected,
  Function onCellDeSelected,
  Function onCellExpand,
  bool enableDragAndDrop,
  Function onRowExpandToggle,
  Function draggableHeaderCell,
  Function getValidFilterValues,
  dynamic rowSelection,
/*
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
   */
  Function onRowClick,
  Function onGridKeyUp,
  Function onGridKeyDown,
  Function rowGroupRenderer,
  Function rowActionsCell

  });


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

