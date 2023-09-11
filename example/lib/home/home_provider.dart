import 'package:alice_get_connect/alice_get_connect.dart';
import 'package:example/home/quote_model.dart';
import 'package:get/get.dart';

class HomeProvider extends GetConnect{
  final AliceGetConnect alice;

  HomeProvider(this.alice);

  @override
  void onInit() {
    super.onInit();
    allowAutoSignedCert = true;
    httpClient.baseUrl = 'https://dummyjson.com';
    httpClient.timeout = alice.timeout;
    httpClient.addRequestModifier(alice.requestInterceptor);
    httpClient.addResponseModifier(alice.responseInterceptor);
  }

  Future<QuoteModel> getRandomQuote() async{
    final response = await get('/quotes/random');
    if(response.isOk){
      try{
        return QuoteModel.fromJson(response.body);
      }catch(e){
        return Future.error(e.toString());
      }
    }
    return Future.error('Something wrong happened');
  }
}