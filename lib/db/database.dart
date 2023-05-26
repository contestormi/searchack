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

  IntColumn get prizeFundAmount => integer()();

  TextColumn get sponsorName => text()();

  TextColumn get companyOrganizer => text()();

  TextColumn get address => text()();

  TextColumn get imageLink => text()();
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

  Stream<List<Hack>> getHacks({
    bool isStrict = false,
    String title = '',
    String sponsorName = '',
    String companyOrganizer = '',
    String description = '',
    String address = '',
    int prizeFundAmount = -1,
    int startDate = 0,
    int endDate = 0,
  }) {
    var selectTitle = title == '' ? '' : "WHERE title LIKE '%$title%'";

    String strict() {
      return isStrict ? 'AND' : 'OR';
    }

    String selectSponsorName() {
      if (sponsorName == '') {
        return '';
      } else if (sponsorName != '' && title != '') {
        return "${strict()} sponsor_name LIKE '%$sponsorName%'";
      } else {
        return "WHERE sponsor_name LIKE '%$sponsorName%'";
      }
    }

    String selectCompanyOrganizer() {
      if (companyOrganizer == '') {
        return '';
      } else if (companyOrganizer != '' && (title != '' || sponsorName != '')) {
        return "${strict()} company_organizer LIKE '%$companyOrganizer%'";
      } else {
        return "WHERE company_organizer LIKE '%$companyOrganizer%'";
      }
    }

    String selectDescription() {
      if (description == '') {
        return '';
      } else if (description != '' &&
          (title != '' || sponsorName != '' || companyOrganizer != '')) {
        return "${strict()} description LIKE '%$companyOrganizer%'";
      } else {
        return "WHERE description LIKE '%$companyOrganizer%'";
      }
    }

    String selectAddress() {
      if (address == '') {
        return '';
      } else if (address != '' &&
          (title != '' ||
              sponsorName != '' ||
              companyOrganizer != '' ||
              description != '')) {
        return "${strict()} address LIKE '%$companyOrganizer%'";
      } else {
        return "WHERE address LIKE '%$companyOrganizer%'";
      }
    }

    String selectPrizeFundAmount() {
      if (prizeFundAmount == -1) {
        return '';
      } else if (prizeFundAmount != -1 &&
          (title != '' ||
              sponsorName != '' ||
              companyOrganizer != '' ||
              description != '' ||
              address != '')) {
        return "${strict()} CAST(prize_fund_amount AS INT) = $prizeFundAmount";
      } else {
        return "WHERE CAST(prize_fund_amount AS INT) = $prizeFundAmount";
      }
    }

    String selectStartDate() {
      if (startDate == 0) {
        return '';
      } else if (startDate != 0 &&
          (title != '' ||
              sponsorName != '' ||
              companyOrganizer != '' ||
              description != '' ||
              address != '' ||
              prizeFundAmount != -1)) {
        return "${strict()} CAST(start_date AS INT) > $startDate";
      } else {
        return "WHERE CAST(start_date AS INT) > $startDate";
      }
    }

    String selectEndDate() {
      if (endDate == 0) {
        return '';
      } else if (endDate != 0 &&
              (title != '' ||
                  sponsorName != '' ||
                  companyOrganizer != '' ||
                  description != '' ||
                  address != '' ||
                  prizeFundAmount != -1) ||
          startDate != 0) {
        return "${strict()} CAST(end_date AS INT) < $endDate";
      } else {
        return "WHERE CAST(end_date AS INT) < $endDate";
      }
    }

    final query =
        "SELECT * FROM hacks $selectTitle ${selectSponsorName()} ${selectCompanyOrganizer()} ${selectDescription()} ${selectAddress()} ${selectPrizeFundAmount()} ${selectStartDate()} ${selectEndDate()}";
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
                imageLink: row.read<String>('image_link'),
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
