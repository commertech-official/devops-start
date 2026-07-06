int analogPin = A0;

void setup() {
    Serial.begin(9600);
}

void loop() {
    // read value voltage on A0 pin
    int u_Reading = analogRead(analogPin);
    // converting the read number
    // in range between 0 and 1023 in range between 0 and 5
    float u_volts = u_Reading / 204.6;
    // output data in serial port
    Serial.println(u_volts);
    delay(1000); 
}
