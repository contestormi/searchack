import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Hacks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  IntColumn get startDate => integer()();

  IntColumn get endDate => integer()();
}

@DriftDatabase(tables: [Hacks])
class HacksDatabase extends _$HacksDatabase {
  HacksDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  Stream<List<Hack>> getHacks({String title = ''}) {
    var selectTitle = title == '' ? '' : "WHERE title LIKE '%$title%'";
    final query = "SELECT * FROM hacks $selectTitle";
    return customSelect(
      query,
      readsFrom: {hacks},
    ).watch().map((rows) {
      return rows
          .map((row) => Hack(
                title: row.read<String>('title'),
                sponsorName: row.read<String>('sponsor_name'),
                companyOrganizer: row.read<String>('company_organizer'),
                prizeFundAmount: row.read<int>('prize_fund_amount'),
                description: row.read<String>('description'),
                address: row.read<String>('address'),
                startDate: row.read<int>('start_date'),
                endDate: row.read<int>('end_date'),
                id: row.read<int>('id'),
              ))
          .toList();
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
