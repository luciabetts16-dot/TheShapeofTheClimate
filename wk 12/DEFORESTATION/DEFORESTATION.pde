// --- CountryForest Class ---
class CountryForest {
  float x, y;           // position
  float sizeFactor;      // current size
  float targetSize;      // target size for animation
  color displayColor;    // current color
  float angleOffset;     // for drifting motion
  float speedFactor;     // how fast it pulses
  float baseX, baseY;    // center for floating
  
  CountryForest(float x_, float y_, float size_, color c) {
    baseX = x_;
    baseY = y_;
    x = x_;
    y = y_;
    sizeFactor = size_;
    targetSize = size_;
    displayColor = c;
    angleOffset = random(TWO_PI);
    speedFactor = random(0.01, 0.03);
  }
  
  void update() {
    // smooth pulsing
    float pulse = sin(frameCount * speedFactor + angleOffset) * targetSize * 0.3;
    sizeFactor = targetSize + pulse;
    
    // floating motion
    x = baseX + sin(frameCount * speedFactor + angleOffset) * 20;
    y = baseY + cos(frameCount * speedFactor + angleOffset) * 20;
  }
  
  void display() {
    noStroke();
    fill(displayColor, 200);
    ellipse(x, y, sizeFactor, sizeFactor);
  }
}

// --- Global Variables ---
CountryForest[] forests;
int numForests = 30;

void setup() {
  size(1000, 700);
  forests = new CountryForest[numForests];
  
  // randomly position circles around canvas center
  for (int i = 0; i < numForests; i++) {
    float angle = random(TWO_PI);
    float radius = random(50, 300);
    float px = width/2 + cos(angle) * radius;
    float py = height/2 + sin(angle) * radius;
    float sz = random(30, 120);
    
    // assign red/orange for loss, green for gain
    color c;
    if (random(1) < 0.7) { // majority losing forest
      c = color(255, random(100, 200), 0);  // red/orange
    } else {
      c = color(0, random(150, 255), 0);    // green
    }
    
    forests[i] = new CountryForest(px, py, sz, c);
  }
  
  frameRate(30);
}

void draw() {
  background(255); // white background
  
  // update and display each forest circle
  for (int i = 0; i < numForests; i++) {
    forests[i].update();
    forests[i].display();
  }
}
