import 'package:collection/collection.dart';
import 'package:scoped_model/scoped_model.dart';

class DashboardModel extends Model {
  List<List<String>> _dashboard = [
    ['','',''],
    ['','',''],
    ['','',''],
  ];
  String _winner = '';

  List<List<String>> get dashboard => UnmodifiableListView(_dashboard);
  String get winner => _winner;

  set winner(String value) {
    _winner = value;
    // This call tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void markCell(int row, int col, String sign) {
    _dashboard[row][col] = sign;
    // This call tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void resetDashboard() {
    _dashboard = [
      ['','',''],
      ['','',''],
      ['','',''],
    ];
    // This call tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }
}