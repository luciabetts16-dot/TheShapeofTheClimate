float seaLevel = 0;
int year = 1900;

void setup() {
  size(800, 600);
  noStroke();
}

void draw() {
  background(10, 20, 40);

  seaLevel = map(year, 1900, 2020, height * 0.75, height * 0.25);

  float t = map(year, 1900, 2020, 0, 1);
  float r = lerp(0, 255, t * 0.5);
  float g = lerp(80, 200, t);
  float b = lerp(180, 80, t);

  for (float y = seaLevel; y < height + 20; y += 10) {
    fill(r, g, b, 150);
    beginShape();
    for (float x = 0; x <= width; x += 10) {
      float yOffset = sin((x * 0.03) + millis() * 0.002 + y * 0.05) * 10;
      vertex(x, y + yOffset);
    }
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
  }

  fill(255);
  textAlign(CENTER);
  textSize(24);
  text("Sea Level Rise — " + year, width / 2, 40);

  if (frameCount % 10 == 0 && year < 2020) {
    year++;
  }
}
