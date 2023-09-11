import 'package:example/home/home_provider.dart';
import 'package:example/home/quote_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeProvider provider;

  HomeController(this.provider);

  final _isLoading = false.obs;
  final _quote = Rx<QuoteModel?>(null);

  bool get isLoading => _isLoading.value;
  QuoteModel? get quote => _quote.value;

  getRandomQuote() {
    _isLoading.value = true;
    provider.getRandomQuote().then((value) {
      _quote.value = value;
    }).onError((error, stackTrace) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Warning',
          message: error.toString(),
          duration: const Duration(seconds: 2),
        ),
      );
    }).whenComplete(() => _isLoading.value = false);
  }

  @override
  void onInit() {
    getRandomQuote();
    super.onInit();
  }
}
