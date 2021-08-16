import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.rajaongkir.com/starter/province");
  final response = await http.get(
    url,
    headers: {
      "key": "0ae702200724a396a933fa0ca4171a7e",
    },
  );

  print(response.body);
}
