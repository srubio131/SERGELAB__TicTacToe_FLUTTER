import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/dashboardGame.dart';
import 'package:tictactoe/models/dashboardModel.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  DashboardModel model = DashboardModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Tic-Tac-Toe'),
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Text("And the winner is... ${model.winner}"),
          DashboardGame(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          model.resetDashboard();
        }),
        tooltip: 'Refresh Dashboard',
        child: Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}