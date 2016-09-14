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

  getInitialState() => {'example': examples[0]};

  Example get example => this.state['example'];

  App() {
    rows = [];
    for (var i = 1; i < 1000; i++) {
      rows.add({
        'title': 'Title ' + i.toString(),
      });
    }
  }

  var examples = [
    new Example("Basic", "", example1),
    new Example(
        "Editable", "http://adazzle.github.io/react-data-grid/examples.html#/editable", example2)
  ];

  render() =>
      div({},
          h1({"style": {"margin": 20}}, "React Data Grid in Dart Example"),
          hr({"style": {"margin": 20}}),
//        span({}, this.state['exampleNo'].toString()),
          div({}, examples.map((example) =>
              span({"style": {"margin": 20}},
                  button({"onClick": (SyntheticMouseEvent e) => _changeExample(example)}, example.title),
                  ))),
      h3({"style": {"margin": 20}},
            a({"href": this.example.url}, this.example.title)),
          div({"style": {"margin": 20}},
              this.example.component())
      );

  _changeExample(Example example) {
    this.setState({"example": example});
  }

}

class Example {

  final String title;
  final String url;
  final dynamic component;

  Example(this.title, this.url, this.component);


}
