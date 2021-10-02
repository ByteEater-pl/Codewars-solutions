namespace CodeWars
{
  class SnakesLadders
  {
    int turn;
    int[] pos = {0, 0};
    public string play (int die1, int die2)
    {
      var square = pos[turn];
      if (square == 100) return "Game over!";
      square += die1 + die2;
      var prx = $"Player {turn + 1} ";
      if (square == 100) return prx + "Wins!";
      if (square > 100) square = 200 - square;
      try { square =
        new System.Collections.Generic.SortedList<int, int> {
          {2, 38},
          {7, 14},
          {8, 31},
          {15, 26},
          {16, 6},      
          {21, 42},
          {28, 84},
          {36, 44},
          {46, 25},
          {49, 11},
          {51, 67},
          {62, 19},
          {64, 60},
          {71, 91},
          {74, 53},
          {78, 98},
          {87, 94},
          {89, 68},
          {92, 88},
          {95, 75},
          {99, 80}
        }[square]; }
      catch {};
      pos[turn] = square;
      if (die1 != die2) turn ^= 1;
      return prx + $"is on square {square}";
    }
  }
}
