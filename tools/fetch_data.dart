import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

const headerIfNotModifiedSince = 'if-modified-since';

final endpoints = {
  File('./assets/nrdb/cycles.json'): Uri.parse('https://netrunnerdb.com/api/2.0/public/cycles'),
  File('./assets/nrdb/packs.json'): Uri.parse('https://netrunnerdb.com/api/2.0/public/packs'),
  File('./assets/nrdb/sides.json'): Uri.parse('https://netrunnerdb.com/api/2.0/public/sides'),
  File('./assets/nrdb/factions.json'): Uri.parse('https://netrunnerdb.com/api/2.0/public/factions'),
  File('./assets/nrdb/types.json'): Uri.parse('https://netrunnerdb.com/api/2.0/public/types'),
  File('./assets/nrdb/cards.json'): Uri.parse('https://netrunnerdb.com/api/2.0/public/cards'),
  File('./assets/nrdb/formats.json'):
      Uri.parse('https://raw.githubusercontent.com/North101/netdeck_data/master/data/formats.json'),
  File('./assets/nrdb/mwl.json'):
      Uri.parse('https://raw.githubusercontent.com/North101/netdeck_data/master/data/mwl.json'),
  File('./assets/nrdb/rotations.json'):
      Uri.parse('https://raw.githubusercontent.com/North101/netdeck_data/master/data/rotations.json'),
};

Future<DateTime?> fetchLastModified(File file) async {
  if (!await file.exists()) return null;

  final data = json.decode(await file.readAsString());
  return DateTime.parse(data['last_updated'] as String);
}

Future<void> writeFile(File file, String contents) async {
  await file.writeAsString(contents);
}

Future<void> updateData(File file, Uri endpoint) async {
  final lastModified = await fetchLastModified(file);

  final response = await http.get(endpoint, headers: {
    if (lastModified != null) headerIfNotModifiedSince: lastModified.toIso8601String(),
  });
  print(endpoint);
  if (response.statusCode == 304) {
    print('> Unchanged');
    return;
  } else if (response.statusCode != 200) {
    print('> Unknown Error: ${response.statusCode}');
    return;
  }
  if (lastModified != null) {
    final data = json.decode(response.body);
    final lastUpdated = DateTime.parse(data['last_updated'] as String);
    if (!lastUpdated.isAfter(lastModified)) {
      print('> Unchanged');
      return;
    }
  }

  print('> Updated');
  await writeFile(file, response.body);
}

void main() async {
  for (final e in endpoints.entries) {
    await updateData(e.key, e.value);
  }
}
