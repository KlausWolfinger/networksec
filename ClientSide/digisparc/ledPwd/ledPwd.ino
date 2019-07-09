int ledPin = 1;
int rampTime = 2;
void setup() {
  // put your setup code here, to run once:

pinMode(ledPin, OUTPUT); //LED on Model A   
      
digitalWrite(ledPin, HIGH);
  delay(1000);               // wait for a second
  digitalWrite(ledPin, LOW); 
  delay(1000); 

  for(int i = 0; i<255; i++)
    {
      analogWrite(ledPin, i);
           
    }

}

void loop() {
  // put your main code here, to run repeatedly:
  //int i = 0;
  for(int i = 10; i<245; i++)
    {
      analogWrite(ledPin, i);
      delay(2);
           
    }
  for(int i = 245; i>0; i--)
    {
      analogWrite(ledPin, i);
      delay(2);     
    }  
    
}


