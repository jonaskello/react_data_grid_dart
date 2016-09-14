library example3;

import 'package:react/react.dart';
import 'react_data_grid.dart';
import 'utils.dart' as utils;

typedef Example3Type();

var _example3 = registerComponent(() => new _Example3());

Example3Type example3 = () => _example3();

class _Example3 extends Component {

  getInitialState() {
    return {'rows' : utils.createRows(1000)};
  }

  //Columns definition
  final columns = [
    new ReactDataGridColumn(key: 'id', name: 'ID', width: 80),
    new ReactDataGridColumn(key: 'task', name: 'Title', editable: true),
    new ReactDataGridColumn(key: 'priority', name: 'Priority', editable: true),
    new ReactDataGridColumn(key: 'issueType', name: 'Issue Type', editable: true),
    new ReactDataGridColumn(key: 'complete', name: '% Complete', editable: true),
    new ReactDataGridColumn(key: 'startDate', name: 'Start Date', editable: true),
    new ReactDataGridColumn(key: 'completeDate', name: 'Expected Complete', editable: true)
  ];

  rowGetter(rowIdx) => this.state['rows'][rowIdx];

  _handleRowUpdated(RowUpdateEvent e) {
    //merge updated row with current row and rerender by setting state
    final rows = this.state['rows'];
    rows[e.rowIdx].addAll(e.updated);
    this.setState({'rows':rows});
  }

  render() =>
          reactDataGrid(
              enableCellSelect: true,
              columns: columns,
              rowGetter: rowGetter,
              rowsCount: this.state['rows'].length,
              minHeight: 400,
              onRowUpdated: _handleRowUpdated);
}
