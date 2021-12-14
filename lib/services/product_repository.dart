import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/banner.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<BannerModel> getBannerProducts() async {
    final response =
        await http.get(Uri.parse("${AppConfig.BASE_URL}/api/banner"));
    return productMiniResponseFromJson(response.body);
  }
}
