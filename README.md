# Lise Dart Chess Engine

Lise is Beginner chess engine re-written in Dart which uses mixture of opening book + negamax + minimax.
Lise can play well known opening pawn structures/ piece placement and plays intermediate middlegame/opening play and beginner endgame play.

## Remarks

[Dart chess](https://github.com/davecom/chess.dart) 
Engine uses dart chess library for legal chess move generation, chess rules checks, etc.

## Lise Acheivements:

- Beating Stockfish level 1

- drawing 3 times to beginner trained Maia Chess engine

## Engine Algorithm

Lise is a beginner engine, who has some sense of opening pawn structures and plays middlegame/endgame
like a beginner to intermediate player.

**Algorithms**

LiseChessEngine uses Minimax, Negamax and Opening book

**Opening Book**

White openings:

- Queens Gambit
- Kings Gambit
- g3 system
- london

Black Openings:

- French
- Caro can
- Slav
- KID
- Ownes Opening

**Negamax Algorithm**
[Chessprogramming.org](https://www.chessprogramming.org/Negamax)

- runs on depth 3, more the depth better move but slower search (not ideal for Discord)
- functions with eval function

**Eval function**

- takes account of chess board area and all legal moves
- gives white double the advantage compared to black to play as a defensive player as black, attacking player as white.

## Engine Upgrades

Lise is still being worked on, with intentions to add

- A full tablebase support for better endgame play
- more opening support
- support for playing white side
- support for tactics creation
- transition to NN for dynamic piece values

## Setup

- make sure to have dart installed
- git clone
- cd chess_enginelise
- enter command dart run

you will see lise playing itself a sample game of 4 moves.

## Lise Java

this is remake of Lise chess engine which was written in Java, can more learn about Java version [here](https://github.com/jalpp/LiseChessEngine)
