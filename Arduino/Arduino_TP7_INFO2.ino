const int pulsador1 = 7;
const int pulsador2 = 8;

const int led1 = 12;
const int led2 = 13;

boolean controlPC1 = false;
boolean controlPC2 = false;

void setup() {
  pinMode(pulsador1, INPUT_PULLUP);
  pinMode(pulsador2, INPUT_PULLUP);

  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);

  Serial.begin(9600);
}

void loop() {

  int estadoP1 = digitalRead(pulsador1);
  int estadoP2 = digitalRead(pulsador2);

  // Recibimos órdenes desde Processing
  while (Serial.available() > 0) {
    char comando = Serial.read();

    if (comando == 'A') controlPC1 = true;
    if (comando == 'a') controlPC1 = false;

    if (comando == 'B') controlPC2 = true;
    if (comando == 'b') controlPC2 = false;
  }

  // Calculamos el estado real de los LEDs
  int estadoL1 = (!estadoP1 || controlPC1) ? 1 : 0;
  int estadoL2 = (!estadoP2 || controlPC2) ? 1 : 0;

  digitalWrite(led1, estadoL1);
  digitalWrite(led2, estadoL2);

  // Enviamos los cuatro estados a Processing
  Serial.print(estadoP1);
  Serial.print(",");
  Serial.print(estadoP2);
  Serial.print(",");
  Serial.print(estadoL1);
  Serial.print(",");
  Serial.println(estadoL2);

  delay(50);
}