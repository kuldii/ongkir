import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.rajaongkir.com/starter/cost");
  final response = await http.post(
    url,
    body: {
      "origin": "501",
      "destination": "114",
      "weight": "1700",
      "courier": "jne",
    },
    headers: {
      "key": "0ae702200724a396a933fa0ca4171a7e",
      "content-type": "application/x-www-form-urlencoded",
    },
  );

  print(response.body);
}
