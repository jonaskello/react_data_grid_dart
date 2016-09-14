library example3;

import 'package:react/react.dart';
import 'react_data_grid.dart';
import 'utils.dart' as utils;

typedef Example3Type();

var _example3 = registerComponent(() => new _Example3());

Example3Type example3 = () => _example3({});

class _Example3 extends Component {

  getInitialState() {
    var originalRows = utils.createRows(1000);
    var rows = new List.from(originalRows);
    //store the original rows array, and make a copy that can be used for modifying eg.filtering, sorting
    return {'originalRows' : originalRows, 'rows' : rows};
  }

  //Columns definition
  final columns = [
    new ReactDataGridColumn(key: 'id', name: 'ID', width: 80),
    new ReactDataGridColumn(key: 'task', name: 'Title', sortable: true),
    new ReactDataGridColumn(key: 'priority', name: 'Priority', sortable: true),
    new ReactDataGridColumn(key: 'issueType', name: 'Issue Type', sortable: true),
    new ReactDataGridColumn(key: 'complete', name: '% Complete', sortable: true),
    new ReactDataGridColumn(key: 'startDate', name: 'Start Date', sortable: true),
    new ReactDataGridColumn(key: 'completeDate', name: 'Expected Complete', sortable: true)
  ];

  rowGetter(rowIdx) => rows[rowIdx];

  List get originalRows => this.state['originalRows'];

  List get rows => this.state['rows'];

  _handleGridSort(String sortColumn, String sortDirection) {

    var comparer = (Map<String, Object> a, Map<String, Object> b) {
      if (sortDirection == 'ASC') {
        return (a[sortColumn].toString().compareTo(b[sortColumn].toString()) > 0) ? 1 : -1;
      } else if (sortDirection == 'DESC') {
        return (a[sortColumn].toString().compareTo(b[sortColumn].toString()) < 0) ? 1 : -1;
      }
    };
    var newRows;
    if (sortDirection == 'NONE') {
      newRows = new List.from(this.originalRows);
    } else {
      this.rows.sort(comparer);
      newRows = this.rows;
    }
    this.setState({'rows' : newRows});
  }

  render() =>
      reactDataGrid(
          onGridSort: _handleGridSort,
          columns: columns,
          rowGetter: rowGetter,
          rowsCount: this.rows.length,
          minHeight: 400);

}

/*

<ReactDataGrid
        onGridSort={this.handleGridSort}
        columns={columns}
        rowGetter={this.rowGetter}
        rowsCount={this.state.rows.length}
        minHeight={500}
        onRowUpdated={this.handleRowUpdated} />
 */