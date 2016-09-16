library custom_formatter_example;

import 'dart:js';

import 'package:react/react.dart';
import 'react_data_grid.dart';
import 'utils.dart' as utils;

typedef ExampleType();

var _example = registerComponent(() => new _Example());

ExampleType example = () => _example({});

class _Example extends Component {

  getInitialState() {
    var originalRows = utils.createRows(1000);
    var rows = new List.from(originalRows);
    //store the original rows array, and make a copy that can be used for modifying eg.filtering, sorting
    return {'originalRows' : originalRows, 'rows' : rows};
  }

  /*
  //Custom Formatter component
var PercentCompleteFormatter = React.createClass({
  render:function(){
    var percentComplete = this.props.value + '%';
    return (
      <div className="progress" style={{marginTop:'20px'}}>
        <div className="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style={{width:percentComplete}}>
        {percentComplete}
      </div>
      </div>);
    }
  });
   */

  //Columns definition
  final columns = [
    new ReactDataGridColumn(key: 'id', name: 'ID', width: 80),
    new ReactDataGridColumn(key: 'task', name: 'Title'),
    new ReactDataGridColumn(key: 'priority', name: 'Priority'),
    new ReactDataGridColumn(key: 'issueType', name: 'Issue Type'),
    new ReactDataGridColumn(
        key: 'complete', name: '% Complete', formatter: _PercentCompleteFormatter),
    new ReactDataGridColumn(key: 'startDate', name: 'Start Date'),
    new ReactDataGridColumn(key: 'completeDate', name: 'Expected Complete')
  ];

  rowGetter(rowIdx) => rows[rowIdx];

  List get originalRows => this.state['originalRows'];

  List get rows => this.state['rows'];

  render() =>
      reactDataGrid(
          columns: columns,
          rowGetter: rowGetter,
          rowsCount: this.rows.length,
          minHeight: 400);
}

var PercentCompleteFormatter = registerComponent(() => new _PercentCompleteFormatter());

class _PercentCompleteFormatter extends Component {

  render() =>
      div({}, "hello");

}
