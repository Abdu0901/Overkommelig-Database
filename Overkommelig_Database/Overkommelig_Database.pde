//Abdullah og Magnus DDU. Overkommelig Database Project

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
Button ButtonName;


void setup() {
  size(600, 600);
}

void draw() {
  //BackGround color of the screen
  background(255);

  //Calculating if mouse has just been pressed
  boolean mouseJustPressed = mousePressed & !lastMousePressed;
  lastMousePressed = mousePressed;

  //ButtonName
  ButtonName = new Button(100, 100, 100, 50, strokeColor, textColor, "Button Name", 15, 0, bRed, bGreen, bBlue);
  ButtonName.Update();
  if (ButtonName.isButtonPressed(mouseX, mouseY, mouseJustPressed, ButtonName) == true) {
    println("ButtonName has been pressed");
    getData();
  }
}

SQLite db;

void getData()
{
  db = new SQLite( this, "Overkommelige-Database.sqlite" );  // open database file

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
