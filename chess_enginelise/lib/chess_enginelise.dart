
import "package:chess/chess.dart";
import "dart:math";
import "./openings.dart" as openings;



// minimax prefers white player and looks for moves that minimize the worst move it can play
// use recursive appraoch to find the least worst moves


int minimax(Chess game, int depth, bool isBetterPlayer) {
  if (depth == 0 || game.game_over) {
    return evaluate(game);
  }
  
  int bestValue = isBetterPlayer ? -10000 : 10000;
  
  for (var move in game.moves()) {
    game.move(move);
    int value = minimax(game, depth - 1, !isBetterPlayer);
    game.undo();
    
    if (isBetterPlayer) {
      bestValue = max(bestValue, value);
    } else {
      bestValue = min(bestValue, value);
    }
  }
  
  return bestValue;
}



// use recursive minimax method to not select inverse "bad" moves

String findBestMoveMin(Chess game, int depth) {
  String bestMove = "";
  int bestValue = -10000;
  
  for (var move in game.moves()) {
    game.move(move);
    int value = minimax(game, depth - 1, false);
    game.undo();
    
    if (value > bestValue) {
      bestValue = value;
      bestMove = move;
    }
  }
  
  return bestMove;
}


// negamax approach looks at the opposite side and tries to counter that using recursion.
int negamax(Chess game, int depth, int alpha, int beta, bool isMaximizingPlayer) {
  if (depth == 0 || game.game_over) {
    return evaluate(game);
  }
  
  int bestValue = -10000;
  for (var move in game.moves()) {
    game.move(move);
    int value = -negamax(game, depth - 1, -beta, -alpha, !isMaximizingPlayer);
    game.undo();
    
    bestValue = max(bestValue, value);
    alpha = max(alpha, value);
    
    if (alpha >= beta) {
      break;
    }
  }
  
  return bestValue;
}


// eval function which takes account for the current game
int evaluate(Chess game) {

  // gives white double the advantage than black due to white's first move 
  int whiteValue = Random().nextInt(100);

  // gives white half the advantage compared to white due to not starting first
  int blackValue = Random().nextInt(50);

  // take account of space
  int space = game.moves().length;


  // decrease space when king attack to enfore forced defending moves
  if(game.king_attacked(game.turn)){
    space += -80;
  }   


  // remove space when in check, to either defend the king with pawns
  if(game.in_check == true){
    space += -20 + (whiteValue - blackValue);
  }

  // return overall eval

  
  return (whiteValue - blackValue) + space;
}


// use recursive negamax method to not select inverse "bad" moves

String findBestMove(Chess game, int depth) {
  String bestMove = "";
  int bestValue = -10000;
  
  for (var move in game.moves()) {
    game.move(move);
    int value = -negamax(game, depth - 1, -10000, 10000, false);
    game.undo();
    
    if (value > bestValue) {
      bestValue = value;
      bestMove = move;
    }
  }
  
  return bestMove;
}




// the main entry point for the engine, uses opening book (2 move book)
// for middlegame it plays minimax as white and negamax as black
String generatePlay(Chess game) {
  List<int> intPos = [];
  int depthWhite = 3;
  int depthBlack = 2;
  

  if(game.move_number < 2){
    if(game.turn == Chess.WHITE){
      return openings.getWhiteOpeningsMoves(game.move_number);
    }else{
      return openings.getBlackOpeningsMoves(game.move_number);
    }
  }{
  if (game.turn == Chess.WHITE) {
    return findBestMoveMin(game, depthWhite);
  } else {
    return findBestMove(game, depthBlack);
  }
  }
}


// used for running a sample game between the same engine

void runSampleGame() {
  var game = Chess();
  

    while(game.move_number <= 4 && !game.game_over){
    var move = generatePlay(game);
    
    // Make the move
    game.move(move);
    
    // Print the board and the move
    print(game.ascii);
    print("Move: $move\n");
    print(game.fen);

    }
 


}



