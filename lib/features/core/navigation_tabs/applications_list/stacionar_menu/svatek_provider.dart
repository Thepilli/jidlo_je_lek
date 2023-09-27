import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stacionar_app/shared/util/svatek_api.dart';

// Necessary for code-generation to work
part 'svatek_provider.g.dart';

@riverpod
Future<Svatek> svatek(SvatekRef ref) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response = await http.get(Uri.https('svatkyapi.cz', '/api/day'));
  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  // Finally, we convert the Map into an Activity instance.
  return Svatek.fromJson(json);
}
