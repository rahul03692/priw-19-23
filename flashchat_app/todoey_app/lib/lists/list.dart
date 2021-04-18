class Lists{

  String name;
  bool done;

  Lists({this.name,this.done=false});

  void toggle(){
    done=!done;
  }
}