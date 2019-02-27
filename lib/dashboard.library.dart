import 'models/dashboardModel.dart';

class DashboardLibrary {

  static const int NUM_ROWS = 3;
  static const int NUM_COLS = 3;
  static const int TOTAL_CELLS = NUM_ROWS * NUM_COLS;

  static DashboardModel model = DashboardModel();

  /*void _checkIfWinner(int row, int col) {
    if (DashboardLibrary.dashboard[row][col] == '' && this.winner == '') {
      DashboardLibrary.dashboard[row][col] = (this.lastFigure === 'x') ? 'o' : 'x';
      this.lastFigure = this.dashboard[row][col];
      this.counter++;

      if (this.counter > 4) {
        // There isn't empty cells
        if (this.counter === this.TOTAL_CELLS) {
          this.winner = 'empate';
        // There is a winner
        } else if (this.isWinner(row, col)) {
          this.winner = DashboardLibrary.dashboard[row][col];
        }
      }
    }
  }*/

  static String setWinnerIfIsFinishedGame(int row, int col) {
    bool matchRow = true;
    bool matchCol = true;
    bool matchDiag = true;
    final String figure = model.dashboard[row][col];

    // Check same row
    for(int c = 0; c < NUM_COLS; c++ ) {
      if(model.dashboard[row][c] != figure) {
        matchRow = false;
        break;
      }
    }

    if (!matchRow) {
      // Check same col
      for(int r = 0; r < NUM_ROWS; r++ ) {
        if (model.dashboard[r][col] != figure) {
          matchCol = false;
          break;
        }
      }
    }
    
    if (!matchCol) {
      if ((row+col) % 2 == 0) {
        // Check diagonal left to right
        for(int r = 0; r < NUM_ROWS; r++ ) {
          if (model.dashboard[r][r] != figure) {
            matchDiag = false;
            break;
          }
        }
        if (!matchDiag) {
          // Check diagonal right to left
          int r = 2;
          for(int c = 0; c < NUM_COLS; c++ ) {
            if (model.dashboard[c][r] != figure) {
              matchDiag = false;
              break;
            }
            r--;
          }
        }
      } else {
        // Odd
        matchDiag = false;
      }
    }
    return (matchRow || matchCol || matchDiag) ? figure : '';
  }
  
}