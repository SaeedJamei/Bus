import 'Status.dart';

class Chair{
  Status status;
  Chair(this.status);
  void reservation() => status=Status.rr;
  void buy() => status = Status.bb;
  void cancel() => status = Status.empty;
}