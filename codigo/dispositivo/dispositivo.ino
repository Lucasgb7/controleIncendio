#include <FirebaseESP32.h>
#include <FirebaseESP32HTTPClient.h>
#include <FirebaseJson.h>
#include <jsmn.h>

#include "dht.h"

#define MQ 2
#define pinoDHT11 4
#define BTN 5
#define LedVermelho  18
#define LedVerde  19
#define BUZZER 21

#define HOST "controle-de-incendio.firebaseio.com"
#define DBKEY "aLFh7i8DxeQTiSBLyoFPKF1OjUIK3xETGZPVttUw"

#define WF_SSID "jonath-Inspiron-5558"
#define WF_PASSWORD "Be2ftpT0"

FirebaseData firebaseData;

dht DHT;

/*Configuracoes do dispositivo*/
int dispositivo = 1;

/*Variaveis para ativacao do alerta*/
int gas_threshold = 2000;
int temp_threshold = 20;
int humi_threshold = 80;
int atendido = 0;

/*Variaveis para controle do codigo*/
int mq_input = 0;
bool salvo = false;
char dispositivoStatus = '1'; // 1->ligado ; 2->acionado ; 0->desligado
int buzzer = 0;

void setup() {
  /*******************************/
  WiFi.begin(WF_SSID, WF_PASSWORD);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Connecting to WiFi..");
  }
  Serial.println("WiFi connected.");
  /*******************************/
  Firebase.begin(HOST, DBKEY);
  Firebase.reconnectWiFi(true);
  /********************************/

  pinMode(LedVermelho, OUTPUT);
  pinMode(LedVerde, OUTPUT);
  pinMode(BUZZER, OUTPUT);
  pinMode(MQ, INPUT);
  pinMode(BTN, INPUT);

  digitalWrite(LedVermelho, LOW);
  digitalWrite(LedVerde, HIGH);
  digitalWrite(BUZZER, LOW);

  Serial.begin(115200);

  Serial.println("DISPOSITIVO LIGADO!!!");
}

void loop() {
  if(dispositivoStatus == '1'){
    mq_input = analogRead(MQ);
    DHT.read11(pinoDHT11);
  
    /******************************/
    Serial.print("Gas: ");
    Serial.println(mq_input);
    Serial.print("Temperatura: ");
    Serial.print(DHT.temperature, 0);
    Serial.println("*C");
    Serial.print("Umidade: ");
    Serial.print(DHT.humidity, 0);
    Serial.println("%");
    /******************************/
  
    if(DHT.temperature > (temp_threshold*1.5)){
      do{
        salvo = enviarDados(mq_input, DHT.temperature, DHT.humidity);
      }while(!salvo);
      
      ativaAlarme();
    }else if(mq_input > (gas_threshold*1.5) && DHT.temperature > (temp_threshold*0.5)){
      do{
        salvo = enviarDados(mq_input, DHT.temperature, DHT.humidity);
      }while(!salvo);
      
      ativaAlarme();
    }else if (mq_input > gas_threshold && DHT.temperature > temp_threshold){
      do{
        salvo = enviarDados(mq_input, DHT.temperature, DHT.humidity);
      }while(!salvo);
      
      ativaAlarme();
    }

    /*Desligar Dispositivo*/
    if(digitalRead(BTN) == HIGH){
      dispositivoStatus = '0';
      digitalWrite(LedVerde, LOW);
    }
  }else{
    Serial.println("DISPOSITIVO DESLIGADO!!!");
    
    /*Ligar Dispositivo*/
    if(digitalRead(BTN) == HIGH){
      dispositivoStatus = '1';
      digitalWrite(LedVerde, HIGH);
    }
  }
  delay(200);
}

bool enviarDados(int fumaca, int temperatura, int umidade){
  FirebaseJson ocorrencia;  
  ocorrencia.addInt("dispositivo", dispositivo).addInt("temperatura", temperatura).addInt("densidade_fumaca", fumaca).addInt("umidade", umidade).addInt("atendido", atendido);
      
  if(Firebase.pushJSON(firebaseData, "/ocorrencias", ocorrencia)){
    Serial.println(firebaseData.dataPath());
    Serial.println(firebaseData.pushName());
    return true;
  }else{
    Serial.println(firebaseData.errorReason());
    return false;
  }
}

void ativaAlarme(){
  digitalWrite(LedVerde, LOW);
  dispositivoStatus = '2';

  bool sair = true;
  while(sair){
    /*Alarmes Locais*/
    if(buzzer == 0){
      digitalWrite(BUZZER, HIGH);
      buzzer = 1;
    }else{
      digitalWrite(BUZZER, LOW);
      buzzer = 0;
    }
    digitalWrite(LedVermelho, HIGH);
    
    /*Desativa alarme*/
    if(digitalRead(BTN) == HIGH){
      digitalWrite(BUZZER, LOW);
      digitalWrite(LedVermelho, LOW);
      dispositivoStatus = '0';
      sair = false;
      delay(2000);
    }
  }
}
