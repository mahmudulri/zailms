import 'package:get/get.dart';

import 'currency_model.dart';
import 'currency_network.dart';

class CurrencyController extends GetxController {
  @override
  void onInit() {
    fetchTheCurrency();
    super.onInit();
  }

  var isLoading = false.obs;

  var myCurrency = CurrencyModel().obs;

  Future<void> fetchTheCurrency() async {
    try {
      isLoading(true);
      var currency = await CurrencyApi.fetchCurrency().then((value) {
        myCurrency.value = value!;
        isLoading(false);

        // print(myCurrency);
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
