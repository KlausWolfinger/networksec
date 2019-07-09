// SOS LED
// 3 x short, 3 times long, 3 times short
int shortTime = 200;  //millisec
int longTime = 500;  //millisec
int shortPause = 1000; // pause between flash
int longPause = 2000; // delay after SOS
int ledPin = 1;
int rampTime = 2;
void setup() {
  // put your setup code here, to run once:

pinMode(ledPin, OUTPUT); //LED on Model A   

}

void loop() {

for(int i = 0; i<3; i++)
    {
      digitalWrite(ledPin, HIGH);
      delay(shortTime);               // wait for a second
      digitalWrite(ledPin, LOW); 
      delay(shortTime);
           
    }
    delay(shortPause);
for(int i = 0; i<3; i++)
    {
      digitalWrite(ledPin, HIGH);
      delay(longTime);               // wait for a second
      digitalWrite(ledPin, LOW); 
      delay(longTime);
           
    }
    delay(shortPause);

for(int i = 0; i<3; i++)
    {
      digitalWrite(ledPin, HIGH);
      delay(shortTime);               // wait for a second
      digitalWrite(ledPin, LOW); 
      delay(shortTime);
           
    }    

 delay(longPause);
}
