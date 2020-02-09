Circle john = new Circle(200, 200, 25);
ArrayList<Enemy> enemies = new ArrayList<Enemy> ();
Coin c = new Coin();
int borderStroke = 10;
int score = 1;
boolean end = false;

void setup()
{
  sensor = new KetaiSensor(this);
  sensor.start();
  orientation(PORTRAIT);
  background(0, 204, 228);
  textAlign(CENTER, CENTER);
  textSize(36);
}

void draw()
{
  if (!end) {
    background(0, 204, 228);
    text("Accelerometer: \n" + 
      "x: " + nfp(accelerometerX, 1, 3) + "\n" +
      "y: " + nfp(accelerometerY, 1, 3) + "\n" +
      "z: " + nfp(accelerometerZ, 1, 3), 0, 0, width, height);
    john.update();
    noStroke();
    rect(0, 0, width, borderStroke);
    noStroke();
    rect(width - borderStroke, 0, borderStroke, height);
    noStroke();
    rect(0, height - borderStroke, width, borderStroke);
    noStroke();
    rect(0, 0, borderStroke, height);
  } else {
    john.outOfBounds();
  }
}

  void onAccelerometerEvent(float x, float y, float z)
  {
    accelerometerX = x;
    accelerometerY = y;
    accelerometerZ = z;
  }
