import 'dart:io';

import 'Chair.dart';
import 'Status.dart';
import 'Bus.dart';

class OrdinaryBus extends Bus{
  OrdinaryBus({required super.name , required super.id}) : super(isVip: false){
    for(int i=0 ; i<44 ; i++){
      chairList.add(Chair(Status.empty));
    }
  }
  @override
  void displayChair() {
    for(int i = 0 ; i < 17 ; i=i+4){
      for(int j = 1 ; j < 5 ; j++){
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
    for(int i = 20 ; i < 23 ; i=i+2){
      for(int j = 1 ; j < 3 ; j++){
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
    for(int i = 24 ; i < 41 ; i=i+4){
      for(int j = 1 ; j < 5 ; j++){
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