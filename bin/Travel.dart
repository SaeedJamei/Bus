import 'dart:io';

import 'Status.dart';
import 'Bus.dart';

class Travel{
  Bus bus;
  String origin;
  String destination;
  int price;
  double income;
  int emptyChair;
  int cancelReservationCount;
  int cancelBuyCount;
  Travel({required this.bus ,
  required this.origin ,
  required this.destination ,
  required this.price ,}) : income = 0,emptyChair = bus.chairList.length,
        cancelReservationCount = 0,cancelBuyCount = 0;


  void reserve(String? chairNumber){
    while(chairNumber == '' || int.tryParse(chairNumber!) == null){
      print('لطفا شماره صندلی را درست وارد کنید\n0-انصراف');
      chairNumber = stdin.readLineSync();
    }
    int chairNumberInt = int.parse(chairNumber);
    while(chairNumberInt < 0 || chairNumberInt > bus.chairList.length){
      print('لطفا شماره صندلی را درست وارد کنید\n0-انصراف');
      chairNumber = stdin.readLineSync();
      while(chairNumber == '' || int.tryParse(chairNumber!) == null){
        print('لطفا شماره صندلی را درست وارد کنید\n0-انصراف');
        chairNumber = stdin.readLineSync();
      }
      chairNumberInt = int.parse(chairNumber);
    }
    if(chairNumberInt == 0){
      return;
    }
    if(bus.chairList[chairNumberInt-1].status == Status.rr){
      print('این صندلی رزرو شده\nیک صندلی دیگر انتخاب کنید\n0-انصراف');
      String? newChairNumber = stdin.readLineSync();
      reserve(newChairNumber);
      return;
    }
    if(bus.chairList[chairNumberInt-1].status == Status.bb){
      print('این صندلی فروخته شده\nیک صندلی دیگر انتخاب کنید\n0-انصراف');
      String? newChairNumber = stdin.readLineSync();
      reserve(newChairNumber);
      return;
    }
    bus.chairList[chairNumberInt-1].reservation();
    income = income+((price*30)/100);
    emptyChair--;
    print('صندلی رزرو شد');
  }


  void buy(String? chairNumber){
    while(chairNumber == '' || int.tryParse(chairNumber!) == null){
      print('لطفا شماره صندلی را درست وارد کنید\n0-انصراف');
      chairNumber = stdin.readLineSync();
    }
    int chairNumberInt = int.parse(chairNumber);
    while(chairNumberInt < 0 || chairNumberInt > bus.chairList.length){
      print('لطفا شماره صندلی را درست وارد کنید\n0-انصراف');
      chairNumber = stdin.readLineSync();
      while(chairNumber == '' || int.tryParse(chairNumber!) == null){
        print('لطفا شماره صندلی را درست وارد کنید\n0-انصراف');
        chairNumber = stdin.readLineSync();
      }
      chairNumberInt = int.parse(chairNumber);
    }
    if(chairNumberInt == 0){
      return;
    }
    if(bus.chairList[chairNumberInt-1].status == Status.rr){
      print('این صندلی رزرو شده\nیک صندلی دیگر انتخاب کنید\n0-انصراف');
      String? newChairNumber = stdin.readLineSync();
      buy(newChairNumber);
      return;
    }
    if(bus.chairList[chairNumberInt-1].status == Status.bb){
      print('این صندلی فروخته شده\nیک صندلی دیگر انتخاب کنید\n0-انصراف');
      String? newChairNumber = stdin.readLineSync();
      buy(newChairNumber);
      return;
    }
    bus.chairList[chairNumberInt-1].buy();
    income = income+price;
    emptyChair--;
    print('صندلی فروخته شد');
  }

  void cancel(String? chairNumber){
    while(chairNumber == '' || int.tryParse(chairNumber!) == null){
      print('لطفا شماره صندلی را درست وارد کنید\n0-انصراف');
      chairNumber = stdin.readLineSync();
    }
    int chairNumberInt = int.parse(chairNumber);
    while(chairNumberInt < 0 || chairNumberInt > bus.chairList.length){
      print('لطفا شماره صندلی را درست وارد کنید\n0-انصراف');
      chairNumber = stdin.readLineSync();
      while(chairNumber == '' || int.tryParse(chairNumber!) == null){
        print('لطفا شماره صندلی را درست وارد کنید\n0-انصراف');
        chairNumber = stdin.readLineSync();
      }
      chairNumberInt = int.parse(chairNumber);
    }
    if(chairNumberInt == 0){
      return;
    }
    if(bus.chairList[chairNumberInt-1].status == Status.empty){
      print('این صندلی خالی است\nیک صندلی دیگر انتخاب کنید\n0-انصراف');
      String? newChairNumber = stdin.readLineSync();
      cancel(newChairNumber);
      return;
    }
    if(bus.chairList[chairNumberInt-1].status == Status.bb){
      cancelBuyCount++;
      income = income-((price*90)/100);
    }
    else{
      cancelReservationCount++;
      income = income-((price*24)/100);
    }
    bus.chairList[chairNumberInt-1].cancel();
    emptyChair++;
    print('صندلی خالی شد');
  }
}
