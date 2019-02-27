import 'package:flutter/material.dart';
import 'package:tictactoe/dashboard.library.dart';
import 'package:tictactoe/models/dashboardModel.dart';

class DashboardGame extends StatefulWidget {

  @override
  _DashboardGameState createState() => _DashboardGameState();
}

class _DashboardGameState extends State<DashboardGame> {
  String _actualSign = '';
  DashboardModel model = DashboardModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: makeDashboardTable()
      ),
    );
  }

  Table makeDashboardTable() {
    BorderSide borderSide = BorderSide(width: 2.0, color: Colors.blue);
    return Table(
        children: [
          TableRow(children: [
            makeDashboardCell(Border(
              right: borderSide,
              bottom: borderSide
            ),0,0),
            makeDashboardCell(Border(
              left: borderSide,
              right: borderSide,
              bottom: borderSide
            ),0,1),
            makeDashboardCell(Border(
              left: borderSide,
              bottom: borderSide
            ),0,2)
          ]),
          TableRow(children: [
            makeDashboardCell(Border(
              top: borderSide,
              right: borderSide,
              bottom: borderSide
            ),1,0),
            makeDashboardCell(Border(
              top: borderSide,
              left: borderSide,
              right: borderSide,
              bottom: borderSide
            ),1,1),
            makeDashboardCell(Border(
              top: borderSide,
              left: borderSide,
              bottom: borderSide
            ),1,2)
          ]),
          TableRow(children: [
            makeDashboardCell(Border(
              top: borderSide,
              right: borderSide,
            ),2,0),
            makeDashboardCell(Border(
              top: borderSide,
              left: borderSide,
              right: borderSide,
            ),2,1),
            makeDashboardCell(Border(
              top: borderSide,
              left: borderSide,
            ),2,2)
          ]),
        ]
      );
  }

  GestureDetector makeDashboardCell(Border border, int row, int col) {
    final String nextSign = (_actualSign == 'O' || _actualSign == '') ? 'X' : 'O';
    final String text = model.dashboard[row][col];
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        decoration: BoxDecoration(border: border),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
      ),
      onTap: () {
        setState(() {
          if (model.dashboard[row][col] == '') {
            model.markCell(row, col, _actualSign);
            _actualSign = nextSign;
            model.winner = DashboardLibrary.setWinnerIfIsFinishedGame(row,col);
          }
        });
      },
    );
  }
}