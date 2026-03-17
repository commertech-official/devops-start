int led = 13;
int brightness = 0;
int fadeAmout = 5;

void setup() {
  // put your setup code here, to run once:
    pinMode(led, OUTPUT); 
}

void loop() {
  // put your main code here, to run repeatedly:
    analogWrite(led, brightness);
    brightness = brightness + fadeAmout;

if (brightness == 0 || brightness == 250) {
    fadeAmout = -fadeAmout;
}

delay(30);
}
