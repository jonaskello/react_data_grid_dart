library main;

import 'dart:html';
import 'package:react/react_client.dart' as react_client;
import 'package:react/react_dom.dart' as react_dom;
//import 'react_data_grid.dart';
import 'app.dart';

void main() {
  // This should be called once at the beginning of the application
  react_client.setClientConfiguration();


  react_dom.render(
      app(),
      //reactDataGrid(columns: columns, rowGetter: rowGetter, rowsCount: rows.length, minHeight: 500),
      querySelector('#output')
  );
}
