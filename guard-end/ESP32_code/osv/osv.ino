#include <WiFi.h>
#include <ESP32Servo.h>
#include <ESPAsyncWebServer.h>

Servo yawS;
Servo pitchS;

const char* ssid = "Myphone";
const char* password = "aakriti@28";
const int ledPin = 2;  // GPIO pin number to which the LED is connected

AsyncWebServer server(80);
unsigned long lastUpdateTime = 0;  // Variable to track the last update time

void setup() {
  Serial.begin(115200);
  yawS.attach(25);
  pitchS.attach(26);
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, LOW);

  // Connect to Wi-Fi network
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }

  Serial.println("Connected to WiFi");
  Serial.println(WiFi.localIP());
  server.on("/updateData", HTTP_POST, [](AsyncWebServerRequest* request) {
    if (request->hasParam("data", true)) {
      unsigned long currentTime = millis();
      // Check if one second has elapsed since the last update
      if (currentTime - lastUpdateTime >= 10) {
        lastUpdateTime = currentTime;

        String data = request->getParam("data", true)->value();
        // Serial.print(data);
        int yaw = data.substring(0, 4).toInt();
        int pitch = data.substring(4, 8).toInt();
        Serial.print("\nReceived Yaw: ");
        Serial.print(yaw);
        Serial.print("\nReceived Pitch: ");
        Serial.print(pitch);
        if(yaw<0){
          yawS.write(-yaw);
          pitchS.write(pitch+90);
        }
        else{
          yawS.write(yaw);
          pitchS.write(pitch+90);
        }
      }
    }
    request->send(200);
  });

  server.begin();
}

void loop() {
}
