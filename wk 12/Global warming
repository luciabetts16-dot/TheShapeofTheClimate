// Abstract Climate Visualization - Color Flow
// Represents global warming visually through color and form.

float[][] anomalies = {
  {-2.9,-3.0,-2.8,-2.4,-2.0,-1.5,-1.0,-0.8,-1.2,-1.8,-2.3,-2.6},
  {-2.2,-2.1,-2.0,-1.5,-1.0,-0.5,-0.2,0.0,-0.3,-1.0,-1.8,-2.0},
  {-1.5,-1.3,-1.0,-0.5,0.0,0.3,0.6,0.8,0.7,0.2,-0.3,-1.0},
  {-1.0,-0.8,-0.5,0.0,0.5,0.8,1.0,1.2,1.0,0.5,0.0,-0.5},
  {-0.8,-0.7,-0.3,0.2,1.0,1.5,1.8,2.0,1.7,1.0,0.3,-0.5},
  {-0.7,-0.6,-0.2,0.5,1.3,1.8,2.2,2.4,2.1,1.3,0.5,-0.4}
};

int[] years = {1880, 1920, 1980, 2000, 2020, 2025};

void setup() {
  size(900, 600);
  noLoop();
  smooth();
}

void draw() {
  background(10, 10, 30); // deep space blue background

  translate(80, height - 100);
  scale(1, -1);

  float maxAnom = 3;
  float minAnom = -3;
  float plotWidth = width - 160;
  float plotHeight = height - 200;

  noFill();

  for (int i = 0; i < anomalies.length; i++) {
    // Map color: cool blues → warm oranges/reds
    float t = map(years[i], 1880, 2025, 0, 1);
    float r = lerp(30, 255, t);
    float g = lerp(120, 60, t);
    float b = lerp(200, 50, t);
    stroke(r, g, b, 120);
    strokeWeight(map(years[i], 1880, 2025, 1, 4));

    beginShape();
    for (int m = 0; m < 12; m++) {
      float x = map(m, 0, 11, 0, plotWidth);
      float y = map(anomalies[i][m], minAnom, maxAnom, 0, plotHeight);

      // add slight organic noise to make it feel alive
      y += noise(m * 0.3, years[i] * 0.02) * 40 - 20;

      curveVertex(x, y);
    }
    endShape();
  }

  // Optional: add warm glow overlay to express heat
  noStroke();
  for (int i = 0; i < 6; i++) {
    float alpha = map(i, 0, 5, 30, 0);
    fill(255, 100, 0, alpha);
    ellipse(plotWidth / 1.5, plotHeight / 2, 500 + i * 100, 300 + i * 80);
  }
}
