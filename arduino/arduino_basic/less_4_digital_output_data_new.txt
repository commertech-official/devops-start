int ledPin = 13;
int switchPin = 7;
char* massages[] = {
    "Status: connected",
    "Status: Not connected"};

void setup() {
  // set pin 13 in output mode
  pinMode(ledPin, OUTPUT);
  // set pin 7 in input mode and set HIGH level
  pinMode(switchPin, INPUT_PULLUP);
  Serial.begin(9600);
}

void loop() {
  // if pin 7 in LOW status:
if (digitalRead(switchPin) == LOW) {
  // start flash fuction on 100 mks
  flash(100);
  Serial.println(massages[0]);
}
else
{
  // else start func, flash(500)
  flash(500);
}
   Serial.println(digitalRead(switchPin));
   Serial.println(massages[1]);
}

  // void flash on pin 13

void flash (int delayPeriod) {

  Serial.println(delayPeriod);
  digitalWrite(ledPin, HIGH);
  delay(delayPeriod);
  digitalWrite(ledPin, LOW);
  delay(delayPeriod);
  
}
