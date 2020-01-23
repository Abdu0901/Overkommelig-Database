//Abdullah, Jens og Magnus DDU. Overkommelig Database Project

//Import of libraries
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

//Color of the box stroke
int strokeColor = 0;
//Box Colors
int bRed = 150, bGreen = 150, bBlue = 150;
//Color of text
int textColor = 0;
//Text that will be displayed on the button
String buttonText;

//Defining variables needed for button check
boolean lastMousePressed = false;

//Define name of a button
Button LoadDatabaseButton;


void setup() {
  size(600, 600);
}

void draw() {
  //BackGround color of the screen
  background(255);

  //Title Box
  fill (0, 0, 255);
  rect(0, 0, width, 40);
  //Title of the program at the top of the screen
  fill(255);
  textSize(33); 
  textAlign(CENTER, TOP);
  text("Overkommelige Database", width/2, 0);

  //Calculating if mouse has just been pressed
  boolean mouseJustPressed = mousePressed & !lastMousePressed;
  lastMousePressed = mousePressed;

  //LoadDatabaseButton
  LoadDatabaseButton = new Button(25, 75, 100, 50, strokeColor, textColor, "Load Data", 15, 0, bRed, bGreen, bBlue);
  LoadDatabaseButton.Update();
  if (LoadDatabaseButton.isButtonPressed(mouseX, mouseY, mouseJustPressed, LoadDatabaseButton) == true) {
    println("LoadDatabaseButton has been pressed");
    getData();
  }
}

SQLite db;

void getData()
{
  db = new SQLite( this, "Overkommelige-Database.db" );  // open database file

  if ( db.connect() )
  {

    db.query("SELECT * FROM Bruger");

    while (db.next())
    {
      println( db.getInt("ID") );
      println( db.getString("Username") );
      println( db.getString("Password") );
    }
  }
}
