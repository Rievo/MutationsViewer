import processing.pdf.*;

long[] chromosomeBasePairsSize = {247199719,242751149,199446827,191263063,180837866,170896993,158821424,146274826,140442298,131624737,131130853,132289534,114127980,106360585,100114055,88822254,78654742,76117153,63806651,62436224,46944323,49528953,154913754,57741652};
Table table;

float divisionSize;

float xorigin = 20;

Table cytTable;

boolean colFlag;

boolean pdfOrScreen = false; //True = pdf       False = Screen

void setup(){
  
  if(pdfOrScreen == false){
    size(1600,1000);
  }else{
   size(1600, 1000, PDF, "JP.pdf");
  }
   background(255);


   //Read mutationsFile
   table = loadTable("muts.tsv");
   
   //Read cytobands info
   cytTable = loadTable("cytCoor.tsv");
   
   colFlag = false;
   
   divisionSize = height / 24;
   noLoop();
}



void draw(){

  //Chromosoma names
  fill(0, 102, 153);
  textSize(17);
  for(int i = 0; i<24; i++){
    if(i == 22){
      text("X", 5, ((i+1)*divisionSize) -13);
    }else if(i == 23){
      text("Y", 5, ((i+1)*divisionSize) -13);
    }else{
    text(""+(i+1), 5, ((i+1)*divisionSize) -13);
    }
  }
  
  //Draw horizontal lines
  stroke(50,50,200);
  for(int i = 0; i<25; i++){
    line(0, i * divisionSize, width, i * divisionSize);
  }
  
  
  //Draw cytobands rectangle
  for(TableRow row : cytTable.rows()){
    int chr = row.getInt(0);
    long init = row.getLong(3);
    long end = row.getLong(4);
    
    float newHeight = divisionSize * chr;
    
    float xInit = init * width / chromosomeBasePairsSize[chr -1];
    float xEnd = end * width / chromosomeBasePairsSize[chr -1];
    
    //Alternate colors
    if(colFlag == false){
      fill(178,138,218,50);
      colFlag = true;
    }else{
      fill(178,218,138,50);
      colFlag = false;
    }
    rect(xInit, newHeight -10, xEnd-xInit, 20 );
    

    //Cytoband name
    textSize(10);
     if(colFlag == true){
      fill(198,158,225,200);
    }else{
      fill(30,60,30,200);
    }
    String name = row.getString(1) + row.getFloat(2);
    text(name, xInit + ((xEnd-xInit)/5), newHeight -13);
  }
  
  
  //Mutations lines
  stroke(0); //Black color
  strokeWeight(0.01);

  for(TableRow row : table.rows()){

    int chr = row.getInt(0);

    long pos = row.getLong(1);

    float newHeight = divisionSize * chr;

    float xcoordinate = pos * width / chromosomeBasePairsSize[chr-1];

    line(xcoordinate, newHeight -5, xcoordinate, newHeight+5);
  }
  
  println("End");


  if(pdfOrScreen == true){ //PDF
    saveFrame();
    exit();
  }else{ //Screen
  }
}
