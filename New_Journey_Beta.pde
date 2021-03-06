        
PImage startScreen;
PImage menuScreen;
PImage loadingScreen;
PImage playScreen;
PImage newScreen;
PImage optionsScreen;

PFont font1;
PFont font2;

boolean GameStart=false;
boolean MenuStart=true;
boolean GameState=false;
boolean FileLoaded=false;
boolean GameLoaded=false;
boolean CaveState=false;

GameWorld World;
Sprite Player;
Caves Cave;
Monsters[] monsters=new Monsters[128];

final int worldSize=300;
final int tileSprite=100;

int spriteXPos=1000;
int spriteYPos;

int Width=100;
int Height=200;

int health=4;

String input;

int gameScreen=0;



void setup()
{
  size(1920,1080,JAVA2D);
  //fullScreen(JAVA2D);
  background(0,0,0);
  frameRate(60);

  startScreen=loadImage("data/graphics/start.png");
  menuScreen=loadImage("data/graphics/menu.png");
  loadingScreen=loadImage("data/graphics/loading.png");
  playScreen=loadImage("data/graphics/play.png");
  newScreen=loadImage("data/graphics/new.png");
  optionsScreen=loadImage("data/graphics/options.png");
  
  World=new GameWorld();
  Player=new Sprite();
  Cave=new Caves();
  
  for(int l=0; l<monsters.length; l++)
  {
    int w=int(random(4));
    int x=int(random(worldSize*100-100));
    int y=int(random(worldSize*100-200));
    int z=int(random(worldSize*100-100));
    
    monsters[l]=new Monsters(w,x,y,z);
  }

  gameScreen=0;
}



void draw()
{

  if(gameScreen==0)
  {
    StartGame();
  }


  if(gameScreen==1)
  {
    Menu();
  }

  if(gameScreen==2)
  {
    LoadGame();
  }
  
  if(gameScreen==3)
  { 
    int runOnce;
    runOnce=0;

    if(runOnce==0)
    {
      NewGame();
      runOnce=1;

      if(runOnce==1)
      {
        gameScreen=1;
      }
    }   
  }

  if(gameScreen==4)
  {
    GameControls();
  }

  if(gameScreen==5)
  {
    PauseGame();
  }

  if(gameScreen==6)
  {
    RunGame();
  }

  if(keyPressed)
  {
    if(key==BACKSPACE)
    {
      println("menu");
      gameScreen=1;
      keyPressed=false;
    }
  }
}


void StartGame()
{
  cursor(WAIT);
  
  startScreen=loadImage("data/graphics/start.png");
  image(startScreen,0,0);

  font1=createFont("data/fonts/consolab.ttf",32);
  font2=createFont("data/fonts/consolab.ttf",10);
  textFont(font1);
  text("Press Any Key To Start",600,750);

  if((keyPressed==true) || (mousePressed==true))
  {
    gameScreen=1;
  }
}



void Menu()
{
  cursor(HAND);
  
  image(menuScreen,0,0);
  textFont(font2);
  text("BETA Version 0.2.0",20,height-40);
  

  if(mousePressed==true)
  {
    if(mouseX>770 && mouseX<1250)
    {
      if(mouseY>330 && mouseY<460)
      {
        //LoadGame();
        gameScreen=2;
        mousePressed=false;
      }
    

      if(mouseY>510 && mouseY<670)
      {
        //NewGame();
        gameScreen=3;
        mousePressed=false;
      }
    
      if(mouseY>720 && mouseY<850)
      {
        //GameControls();
        gameScreen=4;
        mousePressed=false;
      }
    
      if(mouseY>900 && mouseY<1030)
      {
        exit();
      }
    }
  }
}


void fileSelected(File selection) 
{
  if (selection == null) 
  {
    MenuStart=true;
    println("Nothing was selected, so nothing happens");
  } 
  else 
  {
    input = selection.getAbsolutePath();
    FileLoaded=true;
  }
}


void LoadGame()
{
   image(playScreen,0,0);
   cursor(ARROW);

   Player.Load();
  
   for(int l=0; l<monsters.length; l++)
   {
      monsters[l].Load();
   }
        
   selectInput("Select A Game Save:", "fileSelected");
        
   GameStart=true;
   //MenuStart=false;

   gameScreen=6;
}


void RunGame()
{
  
  if(GameLoaded == false && FileLoaded==true) 
  {
    World.Load();
    GameLoaded = true;
    GameState=true;
  }
  
  if(GameStart==true)
  {
    if(GameState==true)
    {
      World.Update();
      Player.Update();
  
      for(Monsters l: monsters)
      {
        l.Update();
      }
  
      World.Draw();
      Player.Draw();
  
      for(Monsters l: monsters)
      {
        l.Draw();
      }
    }
    
    if(CaveState==true)
    {
      GameState=false;
    
      Cave.Load();
    
      if(CaveState==true)
      {
        Cave.Run();
      }
    }
  }
  
  if(keyPressed==true)
  {
    if(key=='p' && GameState==true)
    {
      println("Paused");
      translate(0,0);
      text("Game Paused",50,50);
      GameState=false;
      //PauseGame();
      gameScreen=5;
      
      keyPressed=false;
    }
  }

  /*  
  if(keyPressed==true)
  { 
    if(key=='p' && GameState==false)
    {
      println("Started");
      GameState=true;
      
      translate(0,0);
      text("Game Running",50,50);
      
      keyPressed=false;
    }
  }
  */
}


void NewGame()
{
  image(newScreen,0,0);
  textFont(font1);

  /*
  //int runOnce=0;
  int runOnce;
  runOnce=0;

  println(runOnce);
  

  if(runOnce==0)
  {
    */
    //println("starting");
    exec("data/world/create_world.sh");
    //println("running");

    //gameScreen=3;
    //Menu();
    
    /*
    runOnce=1;
    println(runOnce);
    
  }
  */
}

void GameControls()
{
   image(optionsScreen,0,0);
   text("Sorry! This Option Isnt Avaliable Right Now.",20,height-40);
   println("Sorry! This Option Isnt Avaliable Right Now.");
   //GameWorld.Controles();
        
   GameStart=false;
   MenuStart=false;
}

void PauseGame()
{
  if(keyPressed==true)
  {
    if(key=='p' && GameState==true)
    {
      println("Paused");
      GameState=false;
       
      translate(0,0);
      text("Game Paused",50,50);
      
      keyPressed=false;
    }
  }

   if(keyPressed==true)
  { 
    if(key=='p' && GameState==false)
    {
      println("Started");
      
      translate(0,0);
      text("Game Running",50,50);

      GameState=true;
      //void RunGame();
      gameScreen=6;

      keyPressed=false;
    }
  }
}
