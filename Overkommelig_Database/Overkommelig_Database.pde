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

//Text that gets replaced with inputtet text in boxes and shown in them
String stringShowName = "Hehe boi";
String stringShowPassword = "Hehe boi";

//Defining variables needed for button check
boolean lastMousePressed = false;

//Define name of a button
Button LoadDatabaseButton;
Button AddNameButton;
Button AddPasswordButton;


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
  text("Overkommelige Database Chat", width/2, 0);

  //Calculating if mouse has just been pressed
  boolean mouseJustPressed = mousePressed & !lastMousePressed;
  lastMousePressed = mousePressed;

  //Text for Load database
  fill(0);
  textSize(20); 
  textAlign(LEFT, TOP);
  text("Load Database", 25, 75);

  //Load Database Button
  LoadDatabaseButton = new Button(25, 100, 100, 50, strokeColor, textColor, "Load Data", 15, 0, bRed, bGreen, bBlue);
  LoadDatabaseButton.Update();
  if (LoadDatabaseButton.isButtonPressed(mouseX, mouseY, mouseJustPressed, LoadDatabaseButton) == true) {
    println("LoadDatabaseButton has been pressed");
    getData();
  }

  //Text for Add a user 
  fill(0);
  textSize(20); 
  textAlign(CENTER, TOP);
  text("Add a user", width/2, 175);

  //Text for create name
  fill(0);
  textSize(20); 
  textAlign(LEFT, TOP);
  text("Create Name:", 25, 225);

  //Add a Name Button
  AddNameButton = new Button(25, 250, 250, 50, strokeColor, textColor, stringShowName, 15, 2, bRed, bGreen, bBlue);
  AddNameButton.Update();
  if (AddNameButton.isButtonPressed(mouseX, mouseY, mouseJustPressed, AddNameButton) == true) {
    println("AddNameButton has been pressed");
  }

  //Text for Add a password 
  fill(0);
  textSize(20); 
  textAlign(LEFT, TOP);
  text("Create Password:", 325, 225);

  //Add a Password Button
  AddPasswordButton = new Button(325, 250, 250, 50, strokeColor, textColor, stringShowPassword, 15, 2, bRed, bGreen, bBlue);
  AddPasswordButton.Update();
  if (AddPasswordButton.isButtonPressed(mouseX, mouseY, mouseJustPressed, AddPasswordButton) == true) {
    println("AddPasswordButton has been pressed");
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
