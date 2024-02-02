import 'dart:io';

import 'OrdinaryBus.dart';
import 'Travel.dart';
import 'VipBus.dart';
import 'Bus.dart';

List<Bus>busList = [];
List<Travel>travelList = [];
int busId = 0;

void main(){
  while(true){
    print("""
    1-تعریف اتوبوس
    2-تعریف سفر
    3-پیش نمایش سفر های موجود
    4-رزرو بلیط
    5-خرید بلیط
    6-لغو بلیط
    7-گزارش یک سفر
    8-خروج
    """);
    String? userInput = stdin.readLineSync();
    while(userInput == ''){
      print('لطفا عدد مورد نظر را وارد کنید');
      userInput = stdin.readLineSync();
    }
    switch(userInput){
      case '1':{
        print('نام اتوبوس را وارد کنید\n0-انصراف');
        String? busName = stdin.readLineSync();
        while(busName == ''){
          print('نام اتوبوس را وارد کنید\n0-انصراف');
          busName = stdin.readLineSync();
        }
        if(busName == '0'){
          break;
        }
        print("""
        نوع اتوبوس را مشخص کنید
        1-معمولی
        2-vip
        0-انصراف
        """);
        String? busKind = stdin.readLineSync();
        while(busKind !='0' && busKind != '1' && busKind != '2'){
          print("""
          نوع اتوبوس را مشخص کنید
          1-معمولی
          2-vip
          0-انصراف
          """);
          busKind = stdin.readLineSync();
        }
        switch(busKind){
          case '1':{
            OrdinaryBus newOrdinaryBus = OrdinaryBus(name: busName!,id: ++busId);
            busList.add(newOrdinaryBus);
            print('اتوبوس با موفقیت ثبت شد');
          }
          break;
          case '2':{
            VipBus newVipBus = VipBus(name: busName! , id: ++busId);
            busList.add(newVipBus);
            print('اتوبوس با موفقیت ثبت شد');
          }
          break;
          case '0':{
            break;
          }
        }
      }
      break;
      case '2':{
        print("""
        نوع اتوبوس را مشخص کنید
        1-معمولی
        2-vip
        0-انصراف
        """);
        String? busKind = stdin.readLineSync();
        while(busKind !='0' && busKind != '1' && busKind != '2'){
          print("""
          نوع اتوبوس را مشخص کنید
          1-معمولی
          2-vip
          0-انصراف
          """);
          busKind = stdin.readLineSync();
        }
        switch(busKind){
          case '1':{
            List<Bus> newList = [];
            newList.addAll(busList.where((element) => element.isVip == false));
            for(int i = 0; i<newList.length;i++){
              print('${i+1}-${newList[i].name}');
            }
            print('0-انصراف');
            String? busIndex = stdin.readLineSync();
            while(busIndex == '' || int.tryParse(busIndex!) == null){
              print('لطفا عدد مورد نظر را درست وارد کنید');
              busIndex = stdin.readLineSync();
            }
            int busIndexInt = int.parse(busIndex);
            while(busIndexInt<0 || busIndexInt>newList.length){
              print('لطفا عدد مورد نظر را درست وارد کنید');
              busIndex = stdin.readLineSync();
              while(busIndex == '' || int.tryParse(busIndex!) == null) {
                print('لطفا عدد مورد نظر را درست وارد کنید');
                busIndex = stdin.readLineSync();
              }
              busIndexInt = int.parse(busIndex);
            }
            if(busIndexInt == 0){
              break;
            }
            Bus myBus = newList[busIndexInt-1];
            print('مبدا\n0-انصراف');
            String? mabdaa = stdin.readLineSync();
            while(mabdaa == ''){
              print('مبدا\n0-انصراف');
              mabdaa = stdin.readLineSync();
            }
            if(mabdaa == '0'){
              break;
            }
            print('مقصد\n0-انصراف');
            String? maqsad = stdin.readLineSync();
            while(maqsad == ''){
              print('مقصد\n0-انصراف');
              maqsad = stdin.readLineSync();
            }
            if(maqsad == '0'){
              break;
            }
            print('قیمت\n0-انصراف');
            String? qeymat = stdin.readLineSync();
            while(qeymat == '' || int.tryParse(qeymat!)==null){
              print('قیمت\n0-انصراف');
              qeymat = stdin.readLineSync();
            }
            if(qeymat == '0'){
              break;
            }
            int qeymatInt = int.parse(qeymat).abs();
            travelList.add(Travel(bus: myBus, origin: mabdaa!, destination: maqsad!, price: qeymatInt));
            print('سفر مورد نظر ثبت شد');
            for(int i = 0 ; i < busList.length ; i++){
              if(busList[i].id == myBus.id){
                busList.removeAt(i);
              }
            }
          }
          break;
          case '2':
            List<Bus> newList = [];
            newList.addAll(busList.where((element) => element.isVip == true));
            for(int i = 0; i<newList.length;i++){
              print('${i+1}-${newList[i].name}');
            }
            print('0-انصراف');
            String? busIndex = stdin.readLineSync();
            while(busIndex == '' || int.tryParse(busIndex!) == null){
              print('لطفا عدد مورد نظر را درست وارد کنید');
              busIndex = stdin.readLineSync();
            }
            int busIndexInt = int.parse(busIndex);
            while(busIndexInt<0 || busIndexInt>newList.length){
              print('لطفا عدد مورد نظر را درست وارد کنید');
              busIndex = stdin.readLineSync();
              while(busIndex == '' || int.tryParse(busIndex!) == null) {
                print('لطفا عدد مورد نظر را درست وارد کنید');
                busIndex = stdin.readLineSync();
              }
              busIndexInt = int.parse(busIndex);
            }
            if(busIndexInt == 0){
              break;
            }
            Bus myBus = newList[busIndexInt-1];
            print('مبدا\n0-انصراف');
            String? mabdaa = stdin.readLineSync();
            while(mabdaa == ''){
              print('مبدا\n0-انصراف');
              mabdaa = stdin.readLineSync();
            }
            if(mabdaa == '0'){
              break;
            }
            print('مقصد\n0-انصراف');
            String? maqsad = stdin.readLineSync();
            while(maqsad == ''){
              print('مقصد\n0-انصراف');
              maqsad = stdin.readLineSync();
            }
            if(maqsad == '0'){
              break;
            }
            print('قیمت\n0-انصراف');
            String? qeymat = stdin.readLineSync();
            while(qeymat == '' || int.tryParse(qeymat!)==null){
              print('قیمت\n0-انصراف');
              qeymat = stdin.readLineSync();
            }
            if(qeymat == '0'){
              break;
            }
            int qeymatInt = int.parse(qeymat).abs();
            travelList.add(Travel(bus: myBus, origin: mabdaa!, destination: maqsad!, price: qeymatInt));
            print('سفر مورد نظر ثبت شد');
            for(int i=0 ; i < busList.length ; i++){
              if(busList[i].id == myBus.id){
                busList.removeAt(i);
              }
          }
          break;
          case '0':{
            break;
          }
        }
      }
      break;
      case '3':{
        int travelNumber = travelDisplay();
        if(travelNumber == 0){
          break;
        }
        else{
          travelList[travelNumber-1].bus.displayChair();
        }
      }
      break;
      case '4':{
        int travelNumber = travelDisplay();
        if(travelNumber == 0) {
          break;
        }
        travelList[travelNumber-1].bus.displayChair();
        print('0-انصراف');
        String? chairNumber = stdin.readLineSync();
        travelList[travelNumber-1].reserve(chairNumber);
      }
      break;
      case '5':{
        int travelNumber = travelDisplay();
        if(travelNumber == 0) {
          break;
        }
        travelList[travelNumber-1].bus.displayChair();
        print('0-انصراف');
        String? chairNumber = stdin.readLineSync();
        travelList[travelNumber-1].buy(chairNumber);
      }
      break;
      case '6':{
        int travelNumber = travelDisplay();
        if(travelNumber == 0) {
          break;
        }
        travelList[travelNumber-1].bus.displayChair();
        print('0-انصراف');
        String? chairNumber = stdin.readLineSync();
        travelList[travelNumber-1].cancel(chairNumber);
      }
      break;
      case '7':{
        int travelNumber = travelDisplay();
        if(travelNumber == 0) {
          break;
        }
        Travel newTravel = travelList[travelNumber-1];
        print('درامد خالص:${newTravel.income} - تعداد صندلی خالی:${newTravel.emptyChair}'
            ' - تعداد کنسلی رزروها:${newTravel.cancelReservationCount} -'
            ' تعداد کنسلی خریدها:${newTravel.cancelBuyCount}');
      }
      break;
      case '8':{
        exit(0);
      }
      default:{
        print('لطفا عدد مورد نظر را درست وارد کنید');
      }
    }
  }
}

int travelDisplay(){
  for(int i = 0 ; i < travelList.length ; i++){
    print('${i+1} - اتوبوس:${travelList[i].bus.name} - ${travelList[i].bus.isVip ? 'vip':'ordinary'} - مبدا:${travelList[i].origin} - مقصد:${travelList[i].destination} - قیمت:${travelList[i].price}');
  }
  print('0-انصراف');
  String? travelNumber = stdin.readLineSync();
  while(travelNumber == '' || int.tryParse(travelNumber!) == null){
    print('شماره سفر را درست وارد کنید');
    travelNumber = stdin.readLineSync();
  }
  int travelNumberInt = int.parse(travelNumber);
  while(travelNumberInt < 0 || travelNumberInt > travelList.length){
    print('شماره سفر را درست وارد کنید');
    travelNumber = stdin.readLineSync();
    while(travelNumber == '' || int.tryParse(travelNumber!) == null){
      print('شماره سفر را درست وارد کنید');
      travelNumber = stdin.readLineSync();
    }
    travelNumberInt = int.parse(travelNumber);
  }
  return travelNumberInt;
}
