
import 'package:http/http.dart' as http;
import 'dart:convert';

String url="https://scarp-backend-priw.herokuapp.com/api/allUsers";
class ApiData{

  Future getApiData() async{
    Uri uri=Uri.parse(url);
    http.Response response=await http.get(uri);
    if(response.statusCode==200){
      String data=response.body;
      return json.decode(data);
    }
    else{
      print(response.statusCode);
      return [];
    }
  }
}
