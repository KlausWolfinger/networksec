#include "DigiKeyboard.h"
void setup() {
  // don't need to set anything up to use DigiKeyboard
DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT); // meta+r
  delay(100);
  DigiKeyboard.println("powershell");
  delay(200);
  DigiKeyboard.sendKeyStroke(0);
  delay(1000);
  DigiKeyboard.println("notepad");
  delay(1000);
  }


void loop() {
  ;
  DigiKeyboard.println("... ab hier wirds brenylig ...");
  DigiKeyboard.delay(1000);
}
