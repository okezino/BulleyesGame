class GameModel{
  static const SLIDER_START = 50;
  static const SCORE_START = 0;
  static const ROUND_START = 1;

  GameModel(this.target,[
    this.current = SLIDER_START, this.round = ROUND_START, this.totalScore = SCORE_START
  ]);

int target;
int totalScore;
int round;
int current;

}