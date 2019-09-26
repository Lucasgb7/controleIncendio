#include <FirebaseESP32.h>
#include <FirebaseESP32HTTPClient.h>
#include <FirebaseJson.h>
#include <jsmn.h>

#include "dht.h"

#define MQ 2
#define pinoDHT11 4
#define BTN 19
#define LED  18
#define BUZZER 5

#define HOST "controle-de-incendio.firebaseio.com"
#define DBKEY "aLFh7i8DxeQTiSBLyoFPKF1OjUIK3xETGZPVttUw"

#define WF_SSID "CORNAO"
#define WF_PASSWORD "corno123"

FirebaseData firebaseData;

dht DHT;

int gas_threshold = 2000;
int temp_threshold = 50;
int humi_threshold = 50;
int mq_input = 0;
int cont = 0;

void setup() {
  /*******************************/
  WiFi.begin(WF_SSID, WF_PASSWORD);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Connecting to WiFi..");
  }
  /*******************************/
  Firebase.begin(HOST, DBKEY);
  Firebase.reconnectWiFi(true);
  /********************************/

  pinMode(LED, OUTPUT);
  pinMode(BUZZER, OUTPUT);
  pinMode(MQ, INPUT);
  pinMode(BTN, INPUT);

  Serial.begin(115200);
}

void loop() {
  mq_input = analogRead(MQ);
  DHT.read11(pinoDHT11);
  
  Serial.print("Gas: ");
  Serial.println(mq_input);
  Serial.print("Temperatura: ");
  Serial.print(DHT.temperature, 0);
  Serial.println("*C");
  Serial.print("Umidade: ");
  Serial.print(DHT.humidity, 0);
  Serial.println("%");

  if(digitalRead(BTN) == HIGH){
      digitalWrite(LED, HIGH);
  }else{
    digitalWrite(LED, LOW);
  }
  
  if ((mq_input > gas_threshold && DHT.temperature > temp_threshold && DHT.humidity > humi_threshold) || true){
    if(cont == 0){
      FirebaseJson ocorrencia;
      
      ocorrencia.addString("local", "UNIVALI").addInt("temperatura", DHT.temperature);
      
      if(Firebase.pushJSON(firebaseData, "/ocorrencias", ocorrencia)){
        Serial.println(firebaseData.dataPath());
        Serial.println(firebaseData.pushName());
        Serial.println(firebaseData.dataPath() + "/"+ firebaseData.pushName());
        cont += 1;
      } else {
        Serial.println(firebaseData.errorReason());
      }
      
    }
    
    //digitalWrite(BUZZER, HIGH); 
    Serial.println("TA PEGANDO FOGO BIXO!!!!");
  }else{
    //digitalWrite(BUZZER, LOW);
    Serial.println("Ta suave...");
  }
  
  delay(100);
} 
