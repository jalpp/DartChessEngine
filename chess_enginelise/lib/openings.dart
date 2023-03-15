import "dart:math";


// White openings 

var queensGambit = ['d4', 'c4']; 
var kingsGambit = ['e4', 'f4'];
var london = ['d4', 'Nf3'];
var g3System = ['g3', 'Bg2'];

Random random = Random();
int openingPicker = random.nextInt(4);



// Black openings

var frenchOpening = ['e6', 'd5'];
var caro = ['c6', 'd5'];
var kingsIndianAttack = ['Nf6', 'g6'];
var owensOpen = ['b6', 'e6'];

// return opening moves based on random order

var whiteOpenings = [queensGambit, kingsGambit, london, g3System];
var blackOpenings = [frenchOpening, caro, kingsIndianAttack, owensOpen];


String getWhiteOpeningsMoves(int move_counter){
   return whiteOpenings[openingPicker][move_counter];
}

String getBlackOpeningsMoves(int move_counter){
    return blackOpenings[openingPicker][move_counter];
}

