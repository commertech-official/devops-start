int outputPin = 13;
int val;

void setup() {
  // put your setup code here, to run once:
    Serial.begin(9600);
    pinMode(outputPin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
    if (Serial.available()) {
        val = Serial.read();
        if (val == 'H') {
            digitalWrite(outputPin, HIGH);
        }
        if (val == 'L') {
            digitalWrite(outputPin, LOW);
        }
    }
}
