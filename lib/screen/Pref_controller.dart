import 'package:shared_preferences/shared_preferences.dart';
enum prefKeys{
  counter,content
}
class PrefController{
  static final PrefController _instance=PrefController._internal();
  late SharedPreferences _sharedPreferances;
  factory PrefController(){
    return _instance;
  }
  PrefController._internal();
  Future<void> initPreController() async{
    _sharedPreferances=await SharedPreferences.getInstance();
  }
  void saveCounter({required int counter}){
    _sharedPreferances.setInt(prefKeys.counter.toString(), counter);
  }
  int get counter=>_sharedPreferances.getInt(prefKeys.counter.toString()) ?? 0;
  Future<bool> clearCounter() async{
   return await _sharedPreferances.clear();
  }
  void saveContent({required String content}){
    _sharedPreferances.setString(prefKeys.content.toString(), content);
  }
  String get content=>_sharedPreferances.getString(prefKeys.content.toString()) ??'استغفر الله العظيم';

}