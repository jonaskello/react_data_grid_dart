@JS('')
library react_data_grid;

import "package:js/js.dart";
import 'package:react/react_client/react_interop.dart' as react_interop;

external dynamic get ReactDataGrid;
final reactDataGrid = react_interop.React.createFactory(ReactDataGrid);

@JS()
@anonymous
class ReactDataGridProps {
  external List<ReactDataGridColumn> get columns;
  external dynamic get rowGetter;
  external int get rowsCount;
  external int get minHeight;

  external factory ReactDataGridProps({List columns, dynamic rowGetter, int rowsCount, int minHeight});
}

@JS()
@anonymous
class ReactDataGridColumn {
  external String get key;
  external String get name;

  external factory ReactDataGridColumn({String key, String name});
}

