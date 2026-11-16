import processing.serial.*;

boolean[] estadoLED = {false, false};
boolean[] estadoEntrada = {false, false};

Serial puerto;

void setup() {
  size(600, 400);
  background(220);

  printArray(Serial.list());

  puerto = new Serial(this, "COM3", 9600);
}
void serialEvent(Serial puerto) {
  String dato = puerto.readStringUntil('\n');

  if (dato != null) {
    dato = trim(dato);

    String[] valores = split(dato, ',');

    if (valores.length == 4) {

      estadoEntrada[0] = valores[0].equals("0");
      estadoEntrada[1] = valores[1].equals("0");

      estadoLED[0] = valores[2].equals("1");
      estadoLED[1] = valores[3].equals("1");

    }
  }
}
void draw() {
  background(220);

  // Titulo
  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("CONTROL ARDUINO", 300, 40);

  // Titulos de los sectores
  textSize(18);
  text("ENTRADAS", 150, 90);
  text("SALIDAS", 450, 90);

  // Dibujar las entradas
  for (int i = 0; i < 2; i++) {
    fill(60);
    rect(50, 120 + i * 55, 140, 40);

    fill(255);
    textSize(14);
    textAlign(LEFT, CENTER);
    text("Pulsador " + (i + 1), 60, 140 + i * 55);

   if (estadoEntrada[i] == true) {
  fill(60, 200, 60);
} else {
  fill(220, 60, 60);
}

rect(200, 120 + i * 55, 70, 40);

fill(255);
textAlign(CENTER, CENTER);

if (estadoEntrada[i] == true) {
  text("HIGH", 235, 140 + i * 55);
} else {
  text("LOW", 235, 140 + i * 55);
}
  }

  // Dibujar las salidas
  for (int i = 0; i < 2; i++) {
    fill(60);
    rect(330, 120 + i * 55, 100, 40);

    fill(255);
    textAlign(LEFT, CENTER);
    text("LED " + (i + 1), 340, 140 + i * 55);

    // Comprobamos el estado del LED
    if (estadoLED[i] == true) {
      fill(60, 200, 60);
    } else {
      fill(220, 60, 60);
    }

    rect(440, 120 + i * 55, 100, 40);

    fill(255);
    textAlign(CENTER, CENTER);

    if (estadoLED[i] == true) {
      text("ON", 490, 140 + i * 55);
    } else {
      text("OFF", 490, 140 + i * 55);
    }
}
}
void mousePressed() {

  for (int i = 0; i < 2; i++) {

    if (mouseX >= 440 && mouseX <= 540 &&
        mouseY >= 120 + i * 55 &&
        mouseY <= 160 + i * 55) {

      estadoLED[i] = !estadoLED[i];

      if (i == 0) {
        puerto.write(estadoLED[i] ? 'A' : 'a');
      } else {
        puerto.write(estadoLED[i] ? 'B' : 'b');
      }
    }
  }
}
