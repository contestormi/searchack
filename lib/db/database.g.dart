// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Hack extends DataClass implements Insertable<Hack> {
  final int id;
  final String title;
  final String sponsorName;
  final String companyOrganizer;
  final int prizeFundAmount;
  final String description;
  final String address;
  final int startDate;
  final int endDate;
  const Hack(
      {required this.id,
      required this.title,
      required this.sponsorName,
      required this.companyOrganizer,
      required this.prizeFundAmount,
      required this.description,
      required this.address,
      required this.startDate,
      required this.endDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['sponsor_name'] = Variable<String>(sponsorName);
    map['company_organizer'] = Variable<String>(companyOrganizer);
    map['prize_fund_amount'] = Variable<int>(prizeFundAmount);
    map['description'] = Variable<String>(description);
    map['address'] = Variable<String>(address);
    map['start_date'] = Variable<int>(startDate);
    map['end_date'] = Variable<int>(endDate);
    return map;
  }

  HacksCompanion toCompanion(bool nullToAbsent) {
    return HacksCompanion(
      id: Value(id),
      title: Value(title),
      sponsorName: Value(sponsorName),
      companyOrganizer: Value(companyOrganizer),
      prizeFundAmount: Value(prizeFundAmount),
      description: Value(description),
      address: Value(address),
      startDate: Value(startDate),
      endDate: Value(endDate),
    );
  }

  factory Hack.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Hack(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      sponsorName: serializer.fromJson<String>(json['sponsorName']),
      companyOrganizer: serializer.fromJson<String>(json['companyOrganizer']),
      prizeFundAmount: serializer.fromJson<int>(json['prizeFundAmount']),
      description: serializer.fromJson<String>(json['description']),
      address: serializer.fromJson<String>(json['address']),
      startDate: serializer.fromJson<int>(json['startDate']),
      endDate: serializer.fromJson<int>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'sponsorName': serializer.toJson<String>(sponsorName),
      'companyOrganizer': serializer.toJson<String>(companyOrganizer),
      'prizeFundAmount': serializer.toJson<int>(prizeFundAmount),
      'description': serializer.toJson<String>(description),
      'address': serializer.toJson<String>(address),
      'startDate': serializer.toJson<int>(startDate),
      'endDate': serializer.toJson<int>(endDate),
    };
  }

  Hack copyWith(
          {int? id,
          String? title,
          String? sponsorName,
          String? companyOrganizer,
          int? prizeFundAmount,
          String? description,
          String? address,
          int? startDate,
          int? endDate}) =>
      Hack(
        id: id ?? this.id,
        title: title ?? this.title,
        sponsorName: sponsorName ?? this.sponsorName,
        companyOrganizer: companyOrganizer ?? this.companyOrganizer,
        prizeFundAmount: prizeFundAmount ?? this.prizeFundAmount,
        description: description ?? this.description,
        address: address ?? this.address,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );
  @override
  String toString() {
    return (StringBuffer('Hack(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('sponsorName: $sponsorName, ')
          ..write('companyOrganizer: $companyOrganizer, ')
          ..write('prizeFundAmount: $prizeFundAmount, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, sponsorName, companyOrganizer,
      prizeFundAmount, description, address, startDate, endDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hack &&
          other.id == this.id &&
          other.title == this.title &&
          other.sponsorName == this.sponsorName &&
          other.companyOrganizer == this.companyOrganizer &&
          other.prizeFundAmount == this.prizeFundAmount &&
          other.description == this.description &&
          other.address == this.address &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class HacksCompanion extends UpdateCompanion<Hack> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> sponsorName;
  final Value<String> companyOrganizer;
  final Value<int> prizeFundAmount;
  final Value<String> description;
  final Value<String> address;
  final Value<int> startDate;
  final Value<int> endDate;
  const HacksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.sponsorName = const Value.absent(),
    this.companyOrganizer = const Value.absent(),
    this.prizeFundAmount = const Value.absent(),
    this.description = const Value.absent(),
    this.address = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  HacksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String sponsorName,
    required String companyOrganizer,
    required int prizeFundAmount,
    required String description,
    required String address,
    required int startDate,
    required int endDate,
  })  : title = Value(title),
        sponsorName = Value(sponsorName),
        companyOrganizer = Value(companyOrganizer),
        prizeFundAmount = Value(prizeFundAmount),
        description = Value(description),
        address = Value(address),
        startDate = Value(startDate),
        endDate = Value(endDate);
  static Insertable<Hack> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? sponsorName,
    Expression<String>? companyOrganizer,
    Expression<int>? prizeFundAmount,
    Expression<String>? description,
    Expression<String>? address,
    Expression<int>? startDate,
    Expression<int>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (sponsorName != null) 'sponsor_name': sponsorName,
      if (companyOrganizer != null) 'company_organizer': companyOrganizer,
      if (prizeFundAmount != null) 'prize_fund_amount': prizeFundAmount,
      if (description != null) 'description': description,
      if (address != null) 'address': address,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  HacksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? sponsorName,
      Value<String>? companyOrganizer,
      Value<int>? prizeFundAmount,
      Value<String>? description,
      Value<String>? address,
      Value<int>? startDate,
      Value<int>? endDate}) {
    return HacksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      sponsorName: sponsorName ?? this.sponsorName,
      companyOrganizer: companyOrganizer ?? this.companyOrganizer,
      prizeFundAmount: prizeFundAmount ?? this.prizeFundAmount,
      description: description ?? this.description,
      address: address ?? this.address,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (sponsorName.present) {
      map['sponsor_name'] = Variable<String>(sponsorName.value);
    }
    if (companyOrganizer.present) {
      map['company_organizer'] = Variable<String>(companyOrganizer.value);
    }
    if (prizeFundAmount.present) {
      map['prize_fund_amount'] = Variable<int>(prizeFundAmount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<int>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<int>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HacksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('sponsorName: $sponsorName, ')
          ..write('companyOrganizer: $companyOrganizer, ')
          ..write('prizeFundAmount: $prizeFundAmount, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

class $HacksTable extends Hacks with TableInfo<$HacksTable, Hack> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HacksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _sponsorNameMeta =
      const VerificationMeta('sponsorName');
  @override
  late final GeneratedColumn<String> sponsorName = GeneratedColumn<String>(
      'sponsor_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _companyOrganizerMeta =
      const VerificationMeta('companyOrganizer');
  @override
  late final GeneratedColumn<String> companyOrganizer = GeneratedColumn<String>(
      'company_organizer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _prizeFundAmountMeta =
      const VerificationMeta('prizeFundAmount');
  @override
  late final GeneratedColumn<int> prizeFundAmount = GeneratedColumn<int>(
      'prize_fund_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<int> startDate = GeneratedColumn<int>(
      'start_date', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<int> endDate = GeneratedColumn<int>(
      'end_date', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        sponsorName,
        companyOrganizer,
        prizeFundAmount,
        description,
        address,
        startDate,
        endDate
      ];
  @override
  String get aliasedName => _alias ?? 'hacks';
  @override
  String get actualTableName => 'hacks';
  @override
  VerificationContext validateIntegrity(Insertable<Hack> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('sponsor_name')) {
      context.handle(
          _sponsorNameMeta,
          sponsorName.isAcceptableOrUnknown(
              data['sponsor_name']!, _sponsorNameMeta));
    } else if (isInserting) {
      context.missing(_sponsorNameMeta);
    }
    if (data.containsKey('company_organizer')) {
      context.handle(
          _companyOrganizerMeta,
          companyOrganizer.isAcceptableOrUnknown(
              data['company_organizer']!, _companyOrganizerMeta));
    } else if (isInserting) {
      context.missing(_companyOrganizerMeta);
    }
    if (data.containsKey('prize_fund_amount')) {
      context.handle(
          _prizeFundAmountMeta,
          prizeFundAmount.isAcceptableOrUnknown(
              data['prize_fund_amount']!, _prizeFundAmountMeta));
    } else if (isInserting) {
      context.missing(_prizeFundAmountMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Hack map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Hack(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      sponsorName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}sponsor_name'])!,
      companyOrganizer: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}company_organizer'])!,
      prizeFundAmount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}prize_fund_amount'])!,
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      address: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      startDate: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}end_date'])!,
    );
  }

  @override
  $HacksTable createAlias(String alias) {
    return $HacksTable(attachedDatabase, alias);
  }
}

abstract class _$HacksDatabase extends GeneratedDatabase {
  _$HacksDatabase(QueryExecutor e) : super(e);
  late final $HacksTable hacks = $HacksTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [hacks];
}