//NOTE: dice will appear if their top-right corner is within (0,0) and (800, 750)
//size of one die? (Recommended: 100)
float lengthPerSide = 100;
//spacing of dice? (Recommended: 0)
float spacingBTDice = 0;
//you want chaos? (random size & spacing per click)
boolean ehSureWhyNot = false;

//DISGUSTING CODE UNDER THIS LINE
dice dice; //baby
void setup(){
 size(1000, 1000); 
 noLoop();
}

void draw(){
  background(220);
  //variable hell
  int sum = 0;
  int numOf1 = 0;
  int numOf2 = 0;
  int numOf3 = 0;
  int numOf4 = 0;
  int numOf5 = 0;
  int numOf6 = 0;
  int numOfDice = 0;
  int numOfRows = 0;
  int numPerRow = 0;
  for(int y = 50; y<=750; y+=(dice.sideLength+dice.spacing)){
  numOfRows++;
  numPerRow++;
  for(int x = 100; x <= 800; x+=(dice.sideLength+dice.spacing)){
  dice = new dice(x, y, lengthPerSide, spacingBTDice);
  dice.show();
  dice.roll();
 if(dice.rollAmount == 1){
 sum++;
 numOf1++;
 }
 else if (dice.rollAmount == 2){
 sum+=2;
 numOf2++;
 }
 else if (dice.rollAmount == 3){
 sum+=3;
 numOf3++;
 }
 else if (dice.rollAmount == 4){
 sum+=4;
 numOf4++;
 }
 else if (dice.rollAmount == 5){
 sum+=5;
 numOf5++;
 }
 else if (dice.rollAmount == 6){
 sum+=6;
 numOf6++;
}
numOfDice++;
}
}
textAlign(LEFT);
textSize(20);
text("Number of Dice with 1: " + numOf1, 25, 880);
text("Number of Dice with 2: " + numOf2, 25, 905);
text("Number of Dice with 3: " + numOf3, 25, 930);
text("Number of Dice with 4: " + numOf4, 325, 880);
text("Number of Dice with 5: " + numOf5, 325, 905);
text("Number of Dice with 6: " + numOf6, 325, 930);
textSize(30);
text("Total Sum: " + sum, 650, 890);
textSize(25);
text("Total Number of Dice: " + numOfDice + ", " + numOfRows + " rows by " + numPerRow + " columns", 25, 970);
textSize(15);
text("Side Length: " + lengthPerSide + " pixels", 650, 910);
text("Spacing: " + spacingBTDice + " pixels", 650, 930);
text("Average per roll: " + sum/numOfDice, 650, 950);
}

void mousePressed(){
  redraw();
  //easter egg here!!!!
  if (ehSureWhyNot == true){
  lengthPerSide = (float)(Math.random()*250)+1;
  spacingBTDice = (float)(Math.random()*200);
  }
}

class dice {
  float sideLength, myX, myY, spacing;
  int rollAmount;
  dice(float xPos, float yPos, float side, float space){
    myX = xPos;
    myY = yPos;
    sideLength = side;
    spacing = space;
    rollAmount = (int)(Math.random()*6)+1;
  }
  
  void roll(){
    int position = (int)(Math.random()*2)+1;
    fill(0, 0, 0);
    //# of ellipse draw lines are very unoptimized but idc :p
    if (rollAmount == 1){
    ellipse(myX+(sideLength/2),myY+(sideLength/2),sideLength/8, sideLength/8);
    }
    else if (rollAmount == 2){
    if(position == 1){
    ellipse(myX+(3*sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    }
    if(position == 2){
    ellipse(myX+(sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(3*sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    }
    }
    else if (rollAmount == 3){
    if(position == 1){
    ellipse(myX+(3*sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/2),myY+(sideLength/2),sideLength/8, sideLength/8);
    }
    if(position == 2){
    ellipse(myX+(sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(3*sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/2),myY+(sideLength/2),sideLength/8, sideLength/8);
    }
    }
    else if (rollAmount == 4){
    ellipse(myX+(sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(3*sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(3*sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    }
    else if (rollAmount == 5){
    ellipse(myX+(sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(3*sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(3*sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/2),myY+(sideLength/2),sideLength/8, sideLength/8);
    }
    else{
     if(position == 1){
    ellipse(myX+(sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(3*sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(3*sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/4),myY+(sideLength/2),sideLength/8, sideLength/8);
    ellipse(myX+(3*sideLength/4),myY+(sideLength/2),sideLength/8, sideLength/8);
     }
    else{
    ellipse(myX+(sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(3*sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(3*sideLength/4),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/4),myY+(sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/2),myY+(sideLength/4),sideLength/8, sideLength/8);
    ellipse(myX+(sideLength/2),myY+(3*sideLength/4),sideLength/8, sideLength/8);
    }
    }
  }
  
  void show(){
   fill(255, 255, 255);
   rect(myX, myY, sideLength, sideLength); 
  }
}
