

int windowSize = 1000;
int lines = 1;
int drawedLines = 0;
int betweenLines = 10;

void setup(){
  frameRate(60);
  size(1000, 1000);
}

void draw(){
  background(220,220,220);
  strokeWeight(2.5);
	drawedLines = 1;
  bottomLeftLine();
  bottomRightLine();
  topRightLine();
  topLeftLine();
	lines++;
}

void bottomLeftLine  () {
  for (int i = 1; i <= lines; i++) {
    if (drawedLines * betweenLines  <= 1000) { 
      checkLineColor();
      line(0, i * betweenLines , i * betweenLines , windowSize);
      drawedLines++;
    }
  }
}

void bottomRightLine  () {		
  if(lines * betweenLines + betweenLines >= 1000){
	  for (int i = 1; drawedLines <= lines ; i++) { 		
 	    checkLineColor();
 	    line(windowSize, (i * betweenLines), windowSize - (i * betweenLines), windowSize);
 	    drawedLines++;
      if (drawedLines * betweenLines + betweenLines >= 2000) {
        break;
      }  
    }
  }
}

void topRightLine() {
  if(lines * betweenLines + betweenLines >= 2000){
  	for (int i = 0; drawedLines <= (lines+1); i++) {
  		checkLineColor();
  	  line(windowSize, windowSize - (i * betweenLines + betweenLines), windowSize - (i * betweenLines + betweenLines), 0);
  	  drawedLines++;
      if (drawedLines * betweenLines + betweenLines >= 3000) { 
        break;
      }
    }
  }
}

void topLeftLine() {
  if(lines * betweenLines + betweenLines >= 3000){  
    for (int i = 0; drawedLines <= (lines+2); i++) {
      checkLineColor();
      line(windowSize- (i * betweenLines + betweenLines), 0, 0, (i * betweenLines + betweenLines));
      drawedLines++;
      if (drawedLines * betweenLines + betweenLines >= 4000) {
        lines = 0;
      }  
    }
  }
}

void checkLineColor() {
  if (drawedLines % 3 == 0) {
    stroke(0,0,0);
  }
  else {
    stroke(105,105,105);
  }
}
