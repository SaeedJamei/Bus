import 'dart:io';

import 'Chair.dart';
import 'Status.dart';
import 'Bus.dart';

class VipBus extends Bus{
  VipBus({required super.name , required super.id}) : super(isVip:true){
    for(int i=0 ; i<30 ; i++){
      chairList.add(Chair(Status.empty));
    }
  }

  @override
  void displayChair() {
    for(int i = 0 ; i < 13 ; i=i+3){
      for(int j = 1 ; j < 4 ; j++){
        if(chairList[(i+j)-1].status == Status.rr){
          stdout.write('rr  ');
        }
        if(chairList[(i+j)-1].status == Status.bb){
          stdout.write('bb  ');
        }
        if(chairList[(i+j)-1].status == Status.empty) {
          if (i + j < 10) {
            stdout.write('0${i + j}  ');
          }
          else{
            stdout.write('${i+j}  ');
          }
        }
      }
      print('\n');
    }
    for(int i = 16 ; i < 19 ; i++){
      if(chairList[i-1].status == Status.rr){
        print('rr  \n');
      }
      if(chairList[i-1].status == Status.bb){
        print('bb  \n');
      }
      if(chairList[i-1].status == Status.empty) {
        print('$i  \n');
      }
    }
    for(int i = 18 ; i < 28 ; i=i+3){
      for(int j = 1 ; j < 4 ; j++){
        if(chairList[(i+j)-1].status == Status.rr){
          stdout.write('rr  ');
        }
        if(chairList[(i+j)-1].status == Status.bb){
          stdout.write('bb  ');
        }
        if(chairList[(i+j)-1].status == Status.empty) {
          stdout.write('${i+j}  ');
        }
      }
      print('\n');
    }
  }

}