library main;

import 'dart:html';
import 'package:react/react_client.dart' as react_client;
import 'package:react/react_dom.dart' as react_dom;
import 'my_grid.dart';
import 'react_data_grid.dart';

void main() {
  // This should be called once at the beginning of the application
  react_client.setClientConfiguration();

  final columns = [ new ReactDataGridColumn(
      key: 'title',
      name: 'Title'
  )
  ];

  var rows = [];
  for (var i = 1; i < 1000; i++) {
    rows.add({
      'title': 'Title ' + i.toString(),
    });
  }

  final rowGetter = (rowIndex) => rows[rowIndex];

  react_dom.render(
      myGrid(columns: columns, rowGetter: rowGetter, rowsCount: rows.length, minHeight: 500),
      querySelector('#output')
  );
}
