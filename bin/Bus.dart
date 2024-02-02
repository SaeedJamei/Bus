import 'Chair.dart';

abstract class Bus{
  final String name;
  final bool isVip;
  final int id;
  List<Chair>chairList = [];
  Bus({required this.name , required this.isVip , required this.id});
  void displayChair();
}