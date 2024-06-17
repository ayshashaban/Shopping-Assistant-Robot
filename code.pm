#include <SoftwareSerial.h>
#include <Servo.h>

#define Motor1IN1 8
#define Motor1IN2 9
#define Motor2IN3 12
#define Motor2IN4 13
#define pwm1 10 //variable out
#define pwm2 11 //variable out

Servo motor_1;
Servo motor_2;
Servo motor_3;
Servo motor_4;
Servo motor_5;
Servo motor_6;

int servo1 = 90;
int servo2 = 110;
int servo3 = 40;
int servo4 = 50;
int servo5 = 90;
int servo6 = 90;

int dataIn;

void setup() {
  Serial.begin(9600);

  pinMode (Motor1IN1, OUTPUT );
  pinMode (Motor1IN2, OUTPUT );
  pinMode (Motor2IN3, OUTPUT );
  pinMode (Motor2IN4, OUTPUT );
  pinMode (pwm1, OUTPUT );
  pinMode (pwm2, OUTPUT );

  motor_1.attach(2);
  motor_2.attach(3);
  motor_3.attach(4);
  motor_4.attach(5);
  motor_5.attach(6);
  motor_6.attach(7);
  delay(20);
  
  motor_1.write(servo1);
  motor_2.write(servo2);
  motor_3.write(servo3);
  motor_4.write(servo4);
  motor_5.write(servo5);
  motor_6.write(servo6);

}

void loop() {
  // Check for incoming data
  if (Serial.available() > 0) {
    dataIn = Serial.read();  
    
    switch(dataIn){

      case 0:
        while(dataIn==0){
           stop();
           if (Serial.available() > 0) 
              dataIn = Serial.read();
        }
        break;
      
      case 1:
        while(dataIn==1){
          forwardLeft();
          if (Serial.available() > 0) 
              dataIn = Serial.read();
        }
        break;
      
      case 2:
        while(dataIn==2){
          forward();
          if (Serial.available() > 0) 
              dataIn = Serial.read();
        }
        break;
      
      case 3:
        while(dataIn==3){
          forwardRight();
          if (Serial.available() > 0) 
              dataIn = Serial.read();
        }
        break;
      
      case 6:
        while(dataIn==6){
          backLeft(); // Fix the function name
          if (Serial.available() > 0) 
              dataIn = Serial.read();
        }
        break;

      case 7:
        while(dataIn==7){
          back();
          if (Serial.available() > 0) 
              dataIn = Serial.read();
        }
        break;

      case 8:
        while(dataIn==8){
          backRight(); // Fix the function name
          if (Serial.available() > 0) 
              dataIn = Serial.read();
        }
        break;
      
      case 4:
        while(dataIn==4){
          left();
          if (Serial.available() > 0) 
              dataIn = Serial.read();
        }
        break;

      case 5:
        while(dataIn==5){
          right ();
          if (Serial.available() > 0) 
              dataIn = Serial.read();
        }
        break;

        case 9:
        while(dataIn==9){
         rotateLeft();
          if (Serial.available() > 0) 
              dataIn = Serial.read();
        }
        break;

        case 10:
        while(dataIn==10){
         rotateRight();
          if (Serial.available() > 0) 
              dataIn = Serial.read();
        }
        break;

      case 16:
        while(dataIn==16){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo1>0){servo1 = servo1-1;} 
          motor_1.write(servo1);  
          delay(30);
        }
        break;

      case 17:
        while(dataIn==17){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo1<180){servo1 = servo1+1;}
          motor_1.write(servo1); 
          delay(30); 
        }
        break;

      case 18:
        while(dataIn==18){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo2>0){servo2 = servo2-1;}
          motor_2.write(servo2);
          delay(30);
        }
        break;

      case 19:
        while(dataIn==19){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo2<180){servo2 = servo2+1;}
          motor_2.write(servo2);  
          delay(30);
        }
        break;
      
      case 20:
        while(dataIn==20){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo3>0){servo3 = servo3-1;}
          motor_3.write(servo3);
          delay(30);
        }
        break;


      case 21:
        while(dataIn==21){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo3<180){servo3 = servo3+1;}
          motor_3.write(servo3);  
          delay(30);
        }
        break;


      case 22:
        while(dataIn==22){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo4<180){servo4 = servo4-1;}
          motor_4.write(servo4);
          delay(30);  
        }
        break;


      case 23:
        while(dataIn==23){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo4<180){servo4 = servo4+1;}
          motor_4.write(servo4);  
          delay(30);
        }
        break;


      case 24:
        while(dataIn==24){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo5<180){servo5 = servo5-1;}
          motor_5.write(servo5);  
          delay(30);
        }
        break;


      case 25:
        while(dataIn==25){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo5<180){servo5 = servo5+1;}
          motor_5.write(servo5);  
          delay(30);
        }
        break;


      case 26:
        while(dataIn==26){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo6<180){servo6 = servo6-1;}
          motor_6.write(servo6);  
          delay(30);
        }
        break;


      case 27:
        while(dataIn==27){
          if (Serial.available() > 0) {
            dataIn = Serial.read();}
          if(servo6<180){servo6 = servo6+1;}
          motor_6.write(servo6);  
          delay(30);
        }
        break;

      default:
        break;
    }
    }
  else{
    stop();
  }
}

void forward() {
  digitalWrite(Motor1IN1,HIGH);
  digitalWrite(Motor1IN2, LOW);
  digitalWrite(Motor2IN3, HIGH);
  digitalWrite(Motor2IN4, LOW);

  analogWrite(pwm1, 255);
  analogWrite(pwm2, 255);
}

void back() {
  digitalWrite(Motor1IN1, LOW);
  digitalWrite(Motor1IN2, HIGH);
  digitalWrite(Motor2IN3, LOW);
  digitalWrite(Motor2IN4, HIGH);

  analogWrite(pwm1, 255);
  analogWrite(pwm2, 255);
}

void left(){
  digitalWrite(Motor1IN1, HIGH); 
  digitalWrite(Motor1IN2, LOW); 
  digitalWrite(Motor2IN3, LOW); 
  digitalWrite(Motor2IN4, HIGH);

  analogWrite(pwm1, 255);
  analogWrite(pwm2, 255);
}

void right (){
  digitalWrite(Motor1IN1, LOW);
  digitalWrite(Motor1IN2, HIGH);
  digitalWrite(Motor2IN3, HIGH);
  digitalWrite(Motor2IN4, LOW); 

  analogWrite(pwm1, 255);
  analogWrite(pwm2, 255);
}

void forwardRight(){
  digitalWrite(Motor1IN1, LOW);
  digitalWrite(Motor1IN2, LOW);
  digitalWrite(Motor2IN3, HIGH);
  digitalWrite(Motor2IN4, LOW); 

  analogWrite(pwm1, 0);
  analogWrite(pwm2, 255);
}

void forwardLeft(){
  digitalWrite(Motor1IN1, HIGH); 
  digitalWrite(Motor1IN2, LOW); 
  digitalWrite(Motor2IN3, LOW); 
  digitalWrite(Motor2IN4, LOW);

  analogWrite(pwm1, 255);
  analogWrite(pwm2, 255);
}

void backRight(){
  digitalWrite(Motor1IN1, LOW);
  digitalWrite(Motor1IN2, LOW);
  digitalWrite(Motor2IN3, LOW);
  digitalWrite(Motor2IN4, HIGH); 

  analogWrite(pwm1, 255);
  analogWrite(pwm2, 255);
}

void backLeft(){
  digitalWrite(Motor1IN1, LOW); 
  digitalWrite(Motor1IN2, HIGH); 
  digitalWrite(Motor2IN3, LOW); 
  digitalWrite(Motor2IN4, LOW);

  analogWrite(pwm1, 255);
  analogWrite(pwm2, 255);
}

void rotateLeft(){
  digitalWrite(Motor1IN1, LOW); 
  digitalWrite(Motor1IN2, LOW); 
  digitalWrite(Motor2IN3, HIGH); 
  digitalWrite(Motor2IN4, LOW);

  analogWrite(pwm1, 255);
  analogWrite(pwm2, 255);
}

void rotateRight(){
  digitalWrite(Motor1IN1, HIGH); 
  digitalWrite(Motor1IN2, LOW); 
  digitalWrite(Motor2IN3, LOW); 
  digitalWrite(Motor2IN4, HIGH);

  analogWrite(pwm1, 255);
  analogWrite(pwm2, 255);
}

void stop() {
  digitalWrite(Motor1IN1, LOW);
  digitalWrite(Motor1IN2, LOW);
  digitalWrite(Motor2IN4, LOW);
  digitalWrite(Motor2IN3, LOW);
}
