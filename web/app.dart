library app;

import 'package:react/react.dart';
import 'react_data_grid.dart';
import 'example1.dart';
import 'example2.dart';

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

  rowGetter(rowIndex) => rows[rowIndex];

  var rows;

  getInitialState() => {'exampleNo': 1};

  int get exampleNo => this.state['exampleNo'];

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
        h1({"key": "header"}, "React Data Grid in Dart Example"),
//        span({"key": "span"}, this.state['exampleNo'].toString()),
        button({"key": "button1", "onClick": (SyntheticMouseEvent e) => _changeExample(1)}, "Example1"),
        button({"key": "button2", "onClick": (SyntheticMouseEvent e) => _changeExample(2)}, "Example2"),
        this.exampleNo == 1 ? example1({"key": "example1"}) : example2({"key": "example2"})
      ]);

  _changeExample(int exampleNo) {
    this.setState({"exampleNo": exampleNo});
    print(this.state);
  }

}