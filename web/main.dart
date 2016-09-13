library main;

import 'dart:html';
import 'package:react/react_client.dart' as react_client;
import 'package:react/react_dom.dart' as react_dom;
import 'app.dart';

void main() {
  // This should be called once at the beginning of the application
  react_client.setClientConfiguration();
  react_dom.render(
      app(),
      querySelector('#output')
  );
}
