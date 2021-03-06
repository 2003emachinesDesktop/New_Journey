
class GameWorld
{
  int worldSize=300;
  int[][] worldCoord;
  
  String columns[];
  String rows[];
  
  PImage tile1;
  PImage tile2;
  PImage tile3;
  PImage tile4;
  PImage tile5;
  PImage tree1;
  PImage tree2;
  PImage cave1;
  PImage cave2;
  
  
  boolean d;
  boolean p;
  
  int x;
  int y;
  
  GameWorld()
  {
  }
  
  void Load()
  {
    tile1=loadImage("data/graphics/tile1.png");
    tile2=loadImage("data/graphics/tile2.png");
    tile3=loadImage("data/graphics/tile3.png");
    tile4=loadImage("data/graphics/tile4.png");
    tile5=loadImage("data/graphics/tile5.png");
    tree1=loadImage("data/graphics/tree.png");
    tree2=loadImage("data/graphics/tree2.png");
    cave1=loadImage("data/graphics/cave_tile1.png");
    cave2=loadImage("data/graphics/cave_tile2.png");
    
  
    rows = loadStrings(input);
    
    columns=splitTokens(rows[1]);
    
    worldCoord=new int[rows.length][columns.length];
    
    for(int a=0; a<rows.length; a++)
    {
      columns=splitTokens(rows[a]);
    
      for(int b=0; b<columns.length; b++)
      {
         worldCoord[a][b]=Integer.parseInt(columns[b]);
      }
    }
  }
  
  void Update()
  {
     background(0,y,y/3);
    
     x++;
  
     if(d==false && p==false)                //dawn
     {
       if(x/60==1)
       {
          y++;
      
          x=0;
      
         if(y==255)
         {
           d=true;
           p=true;
         }
       }
     }
     if(d==true && p==true)                  //day
     {
       if(x/60==10)
       {
         x=0;
      
         p=false;
       }
     }
     if(d==true && p==false)                //twilight
     {
       if(x/60==1)
       {
         y--;
      
         x=0;
      
         if(y==0)
         {
           d=false;
           p=true;
         }
       }
     }  
     if(d==false && p==true)                //night
     {
       if(x/60==10)
       {
         x=0;
      
         p=false;
       }
     }
   }
  
  
  
  
  void Draw()
  {
    translate(-spriteXPos,-spriteYPos);

    for(int i=0; i<rows.length; i++)
    {
      for(int k=0; k<columns.length; k++)
      {
        if(worldCoord[i][k]==0)
        {
        }
        
        if(worldCoord[i][k]==1)
        {
        }
        
        if(worldCoord[i][k]==2)
        {
        }
        
        if(worldCoord[i][k]==3)
        {
        }
        
        if(worldCoord[i][k]==4)
        {
        }
        
        if(worldCoord[i][k]==5)
        {
          image(tile1,i*100,k*100);
        }
        
        if(worldCoord[i][k]==6)
        {
          image(tile2,i*100,k*100);
        }
        
        if(worldCoord[i][k]==7)
        {
          image(tile3,i*100,k*100);
        }
        
        if(worldCoord[i][k]==8)
        {
          image(tile4,i*100,k*100);
        }
        
        if(worldCoord[i][k]==9)
        {
          image(tile5,i*100,k*100);
        }
        
        if(worldCoord[i][k]==12)
        {
          image(cave1,i*100,k*100);
          
          
          if(spriteXPos+Width/2>i*100 && spriteXPos+Width/2<i*100+100)
          {
            if(spriteYPos+Height/2>k*100 && spriteYPos+Height/2<k*100+100)
            {
              CaveState=true;
            }
          }
        }
        
        if(worldCoord[i][k]==13)
        {
          image(cave2,i*100,k*100);
          
          if(spriteXPos+Width/2>i*100 && spriteXPos+Width/2<i*100+100)
          {
            if(spriteYPos+Height/2>k*100 && spriteYPos+Height/2<k*100+100)
            {
              CaveState=true;
            }
          }
        }
      }
    }
    
      
    for(int i=0; i<rows.length; i++)
    {
      for(int k=0; k<columns.length; k++)
      {
        if(worldCoord[i][k]==10)
        {
          image(tree1,i*100,k*100);   
        }
        
        if(worldCoord[i][k]==11)
        {
          image(tree2,i*100,k*100);
        }
      }
    }
  }
}


/*
class CreateWorld
{ 
  PrintWriter saveFile;
  
  import at.mukprojects.console.*;

  Console console;

  int arrayWidth=300;
  int arrayHeight=298;

  int[][] map;
  
  CreateWorld()
  {
    
  }
  

  void Create()
  {
    //size(1000,600);
    background(0);
  
    //console=new Console(this);
    //console.start();
    //showConsole=true;
 
    map=new int[arrayWidth][arrayHeight];

    background(0);
    //console.draw(0,0,width,height);


    int newLine=0;
    
    
    println(" _    _                    ________                                       ");
    println("| \  | |  ___  ___    ___  |__  __|                              ___  _  _");
    println("|  \ | | / __\ \  \/\/  /    |  |  ____   _   _  _____  ______  / __\ || ||");
    println("| | \  | | |_-  |  __  |   __|  | | [] | | |_| | |  /-| |  -  | | |_- __/ |");
    println("|_|  \_| \___/  \_/  \_/   \____/ |____| \_____| |_|    |_| |_| \___/ |___/");
    
    
    
    println("New Journey game world creation tool");
    println("Beta Version 0.1.0");
    println("Please Wait...");
    //println("......");
    //println("......");
    println("Creating File...");
    saveFile=createWriter("game.txt");
    
    println("Creating A Awesome World...");
    //println("......");
    //println("......");
    //println("......");
    for(int a=0; a<arrayWidth; a++)
    {
      for(int b=0; b<arrayHeight; b++)
      {
        map[a][b]=int(random(13));
        saveFile.print(map[a][b]+" ");
        newLine++;
        
        if(newLine==arrayWidth-1)
        {
          map[a][b]=int(random(13));
          saveFile.println(map[a][b]+" ");
          newLine=0;
        }
      }
    }
  
    println("Saving File...");
    saveFile.flush();
    saveFile.close();
    println("File Saved...");
    println("You can now safely close this tool.");
    }
  }
  */



class Sprite
{
  PImage sprite;
  PImage sprite2;
  
  int oldSpriteY;
  int gravity=4;
  
  int yVelocity;
  int jumpHeight=-25;
  
  
  Sprite()
  {
  }


  void Load()
  {
    sprite=loadImage("data/graphics/guy.png");
    sprite2=loadImage("data/graphics/guy2.png");
  }


  void Update()
  {
    translate(width/2-45,height/2-98);
    
    yVelocity+=gravity;
    spriteYPos+=yVelocity;
  
    if(spriteYPos>oldSpriteY)
    {
      spriteYPos=oldSpriteY;
    }
    
     if(keyPressed==true)
    {
      if(key=='w')
      {
        gravity=0;
        yVelocity=0;
        
        spriteYPos-=20;
        oldSpriteY=spriteYPos;
        keyPressed=false;
      }
      if(key=='s')
      {
        gravity=0;
        yVelocity=0;
        
        spriteYPos+=20;
        oldSpriteY=spriteYPos;
        keyPressed=false;
      }
      if(key=='a')
      {
        spriteXPos-=20;
        keyPressed=false;
      }
      if(key=='d')
      {
        spriteXPos+=20;
        keyPressed=false;
      }
      if(key==' ')
      {
        spriteYPos=oldSpriteY;
        
        gravity=4;
        yVelocity=0;
        
        yVelocity=jumpHeight;
        keyPressed=false;
      }
      
      if(key=='q')
      {
        textFont(font2);
        text("The WASD keys control player movement", width-300,20);
        text("The Space key makes the player jump",width-300,50);
        text("The ESC key will close the game",width-300,80);
        text("The P key will pause/unpause the game",width-300,110);
      }
      if(key==CODED)
      {
        if(keyCode==SHIFT)
        {
          //spriteAttack();
        }
      }
    }
    
    if(spriteXPos<0)
    {
      spriteXPos=0;
    }
    if(spriteXPos>worldSize*100)
    {
      spriteXPos=worldSize*100;
    }
    if(spriteYPos<0)
    {
      spriteYPos=0;
    }
    if(spriteYPos>worldSize*100)
    {
      spriteYPos=worldSize*100;
    }
  }
  
  /*
  if(spriteAlive==true)
  {
    if(changing==true)
    {
      image(spriteR,XPos,YPos);
      changing=false;
      println(changing);
    }
    if(changing==false)
    {
      image(spriteL,XPos,YPos);
      changing=true;
      println(changing);
    }
  }
  */

  void Draw()
  {
    
    if(health>0)
    { 
      image(sprite,spriteXPos,spriteYPos);
    }
    if(health==0)
    {
      translate(width/2,height/2);  
      image(sprite2,spriteXPos,spriteYPos);
    }
  }
}



class Monsters
{
  int monsterWVal;
  int monsterXPos;
  int monsterYPos;
  int monsterZPos;
  
  PImage monster1;
  PImage monster2;
  PImage monster3;
  PImage monster4;
  
  float monsterRate=.06;
  
  int veiwSize=250;
  int monsterOffsetX;
  int monsterOffsetY;
  
  
  int Width=100;
  int Height=200;
  
  boolean InSight;
  boolean Following;
  boolean Collision;
  
  int increment;
  
  Monsters(int w, int x,int y,int z)
  {
    monsterWVal=w;
    monsterXPos=x;
    monsterYPos=y;
    monsterZPos=z;
  }
  
  void Load()
  {
    monster1=loadImage("data/graphics/monster1.png");
    monster2=loadImage("data/graphics/monster2.png");
    monster3=loadImage("data/graphics/monster3.png");
    monster4=loadImage("data/graphics/monster4.png");
 
    InSight=false;
    Collision=false;
  }
  
  void Update()
  {
    increment++;
  
    if(increment>31)
    {
      increment=0;
      println(health);
    }
    
    if(mousePressed==true)
    {
      if(health==0)
      {
        health=8;
        mousePressed=false;
      }
    }
    
    monsterOffsetX=monsterXPos-120;
    monsterOffsetY=monsterYPos-120;

    if(spriteXPos+Width>monsterOffsetX && spriteXPos<monsterOffsetX+veiwSize)
    {
      if(spriteYPos+Height>monsterOffsetY && spriteYPos<monsterOffsetY+veiwSize)
      {
        InSight=true;
      }
    }
    
     
     if(InSight==true)
     {
       float targetX=spriteXPos;
       float dx=targetX-monsterXPos;
       monsterXPos+=dx*monsterRate;
       
       float targetY=spriteYPos;
       float dy=targetY-monsterYPos;
       monsterYPos+=dy*monsterRate;
       
       
      if(dx>veiwSize || dx<-veiwSize)
      {
        InSight=false;
      }
    
      if(dy>veiwSize|| dy<-veiwSize)
      {
        InSight=false;
      }
     }
     
     
     if(InSight==false)
     {
       if(monsterZPos>monsterXPos)
       {
         monsterXPos++;
       }
       if(monsterZPos<monsterXPos)
       {
         monsterXPos--;
       }
       if(monsterZPos==monsterXPos)
       {
         monsterZPos=int(random(width-100));
       }
     }
       
     if(Collision==true)
     {
       if(increment==30)
       {
         health--;
        
         if(health<0)
         {
           health=0; 
         }
         Collision=false;
         }
       }   
    }

  
  void  Draw()
  {
    for(int i=0;i<monsters.length;i++)
    {
      if(monsterWVal==0)
      {
        image(monster1,monsterXPos,monsterYPos);
      }
      if(monsterWVal==1)
      {
        image(monster2,monsterXPos,monsterYPos);
      }
      if(monsterWVal==2)
      {
        image(monster3,monsterXPos,monsterYPos);
      }
      if(monsterWVal==3)
      {
        image(monster4,monsterXPos,monsterYPos);
      }
    }
  }
}



class Caves
{
  int posX=20;
  int posY=20;

  int size=300;

  int x=75;
  int y=75;

  int oldX=x;
  int oldY=y;
  
  PImage caveGuy;
  PImage caveImage;

  String[] saveFile;

  boolean run=true;
  boolean collision=false;

  color colour1=color(18);
  color colour6=color(75);

  Genorator NewCave;

  
  Caves()
  {
  }
  

  void Load()
  {
    saveFile=loadStrings("data/cave/cave_save_file.txt");
    
    caveGuy=loadImage("data/cave/cave_guy.png");
    caveImage=loadImage("data/cave/cave_background.png");
  
    collision=false;
  
    NewCave=new Genorator();
  
    strokeWeight(0);
    noStroke();
  }


  void Run()
  {
    background(colour1);
    if(collision==true)
    {
      if(x>=oldX)
      {
        oldX=x;
      }
      if(y>=oldY)
      {
        oldY=y;
      }
      collision=false;
    }
  
  
    if(collision==false)
    {
      oldX=x;
      oldY=y;
    
      if(keyPressed==true)
      {
        if(key=='a')
        {
          x-=5;
          oldX=x;
        }
        if(key=='d')
        {
          x+=5;
          oldX=x;
        }
        if(key=='w')
        {
          y-=5;
          oldY=y;
        }
        if(key=='s')
        {
          y+=5;
          oldY=y; 
        }
      }
    }
  
  
  if(run==true)
  {
    for(String i: saveFile)
    {
      if(i.equals("0"))
      {
        fill(75);
        
        rect(posX,posY,size/3,size/3);
        
        posX+=size/3;
        posY+=size/6-size/10;
      }
      
      if(i.equals("1"))
      {
        fill(75);
        
        rect(posX,posY,size,size/5);
        
        posX+=size;
      }
      
      if(i.equals("2"))
      {
        fill(75);
        
        rect(posX,posY,size/5,size);
        
        posY+=size;
      }
      
      if(i.equals("3"))
      {
        fill(75);
        
        rect(posX,posY-size/2,size,size/5);
        
        posX+=size;
        posY-=size/2;
      }
      
      if(i.equals("4"))
      {
        fill(75);
        
        rect(posX-size,posY,size,size/5);
        
        posX-=size;
        posY-=size/2;
      }
      
      if(i.equals("5"))
      {
        fill(75);
        
        rect(posX-size/2,posY+size/5,size/5,size);
        
        posX-=size/2;
        posY+=size;
      }
      
      if(i.equals("6"))
      {
        fill(75);
        
        rect(posX-size/2,posY-size,size/5,size);
        
        posX-=size/2;
        posY-=size;
      }
     }
   }
   
     
    color colour2=get(x,y);
    color colour3=get(x+size/15,y+size/10);
    color colour4=get(x+size/15,y);
    color colour5=get(x,y+size/10);
  
    if(colour2==colour1 || colour3==colour1 || colour4==colour1 ||colour5==colour1)
    {
      if((key=='w') && (colour2==colour1 || colour4==colour1))
      {
        collision=true;
        y+=5;
      }
      if((key=='s') && (colour3==colour1 || colour5==colour1))
      {
        collision=true;
        y-=5;
      }
      if((key=='a') && (colour2==colour1 || colour5==colour1))
      {
         collision=true;
         x+=5;
      }
      if((key=='d') && (colour3==colour1 || colour4==colour1))
      {
         collision=true;
         x-=5;
      }
     }
     
     if(colour2==colour6 || colour3==colour6 || colour4==colour6 ||colour5==colour6)
     {
       if((key=='a') && (colour2==colour1 || colour5==colour1))
       {
         CaveState=false;
         GameState=true;
       }
     }
    
    
     posX=20;
     posY=20;
    
    
    fill(74);
    rect(x,y,size/15,size/10);
    image(caveGuy,x+1,y+1);
 
    if(mousePressed==true)
    {
      NewCave.CreateCave();
    }
  }
}



class Genorator
{
  
  PrintWriter saveFile;
  
  int limit=10;
  int amount=7;
  
  void CreateCave()
  {
    saveFile=createWriter("/data/cave/cave_save");
    
    saveFile.println(0);
    saveFile.println(1);
    saveFile.println(1);
    
    for(int i=0;i<=limit;i++)
    {
      int x=0;
      x=int(random(1,amount));
      
      if(x==1)
      {
        saveFile.println(1);
      }
      
      if(x==2)
      {
        saveFile.println(2);
      }
      
      if(x==3)
      {
        saveFile.println(3);
        saveFile.println(2);
      }
      
      if(x==4)
      {
        saveFile.println(4);
        saveFile.println(2);
      }
      
      if(x==5)
      {
        saveFile.println(5);
        saveFile.println(1);
      }
      
      if(x==6)
      {
        saveFile.println(6);
        saveFile.println(1);
      }
      
    }
    
    saveFile.flush();
    saveFile.close();
    exit();
  }
}
            
