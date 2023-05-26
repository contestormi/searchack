// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Hack extends DataClass implements Insertable<Hack> {
  final int id;
  final String title;
  final String description;
  final int startDate;
  final int endDate;
  final int prizeFundAmount;
  final String sponsorName;
  final String companyOrganizer;
  final String address;
  final String imageLink;
  const Hack(
      {required this.id,
      required this.title,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.prizeFundAmount,
      required this.sponsorName,
      required this.companyOrganizer,
      required this.address,
      required this.imageLink});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['start_date'] = Variable<int>(startDate);
    map['end_date'] = Variable<int>(endDate);
    map['prize_fund_amount'] = Variable<int>(prizeFundAmount);
    map['sponsor_name'] = Variable<String>(sponsorName);
    map['company_organizer'] = Variable<String>(companyOrganizer);
    map['address'] = Variable<String>(address);
    map['image_link'] = Variable<String>(imageLink);
    return map;
  }

  HacksCompanion toCompanion(bool nullToAbsent) {
    return HacksCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      startDate: Value(startDate),
      endDate: Value(endDate),
      prizeFundAmount: Value(prizeFundAmount),
      sponsorName: Value(sponsorName),
      companyOrganizer: Value(companyOrganizer),
      address: Value(address),
      imageLink: Value(imageLink),
    );
  }

  factory Hack.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Hack(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      startDate: serializer.fromJson<int>(json['startDate']),
      endDate: serializer.fromJson<int>(json['endDate']),
      prizeFundAmount: serializer.fromJson<int>(json['prizeFundAmount']),
      sponsorName: serializer.fromJson<String>(json['sponsorName']),
      companyOrganizer: serializer.fromJson<String>(json['companyOrganizer']),
      address: serializer.fromJson<String>(json['address']),
      imageLink: serializer.fromJson<String>(json['imageLink']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'startDate': serializer.toJson<int>(startDate),
      'endDate': serializer.toJson<int>(endDate),
      'prizeFundAmount': serializer.toJson<int>(prizeFundAmount),
      'sponsorName': serializer.toJson<String>(sponsorName),
      'companyOrganizer': serializer.toJson<String>(companyOrganizer),
      'address': serializer.toJson<String>(address),
      'imageLink': serializer.toJson<String>(imageLink),
    };
  }

  Hack copyWith(
          {int? id,
          String? title,
          String? description,
          int? startDate,
          int? endDate,
          int? prizeFundAmount,
          String? sponsorName,
          String? companyOrganizer,
          String? address,
          String? imageLink}) =>
      Hack(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        prizeFundAmount: prizeFundAmount ?? this.prizeFundAmount,
        sponsorName: sponsorName ?? this.sponsorName,
        companyOrganizer: companyOrganizer ?? this.companyOrganizer,
        address: address ?? this.address,
        imageLink: imageLink ?? this.imageLink,
      );
  @override
  String toString() {
    return (StringBuffer('Hack(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('prizeFundAmount: $prizeFundAmount, ')
          ..write('sponsorName: $sponsorName, ')
          ..write('companyOrganizer: $companyOrganizer, ')
          ..write('address: $address, ')
          ..write('imageLink: $imageLink')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, startDate, endDate,
      prizeFundAmount, sponsorName, companyOrganizer, address, imageLink);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hack &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.prizeFundAmount == this.prizeFundAmount &&
          other.sponsorName == this.sponsorName &&
          other.companyOrganizer == this.companyOrganizer &&
          other.address == this.address &&
          other.imageLink == this.imageLink);
}

class HacksCompanion extends UpdateCompanion<Hack> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int> startDate;
  final Value<int> endDate;
  final Value<int> prizeFundAmount;
  final Value<String> sponsorName;
  final Value<String> companyOrganizer;
  final Value<String> address;
  final Value<String> imageLink;
  const HacksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.prizeFundAmount = const Value.absent(),
    this.sponsorName = const Value.absent(),
    this.companyOrganizer = const Value.absent(),
    this.address = const Value.absent(),
    this.imageLink = const Value.absent(),
  });
  HacksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required int startDate,
    required int endDate,
    required int prizeFundAmount,
    required String sponsorName,
    required String companyOrganizer,
    required String address,
    required String imageLink,
  })  : title = Value(title),
        description = Value(description),
        startDate = Value(startDate),
        endDate = Value(endDate),
        prizeFundAmount = Value(prizeFundAmount),
        sponsorName = Value(sponsorName),
        companyOrganizer = Value(companyOrganizer),
        address = Value(address),
        imageLink = Value(imageLink);
  static Insertable<Hack> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? startDate,
    Expression<int>? endDate,
    Expression<int>? prizeFundAmount,
    Expression<String>? sponsorName,
    Expression<String>? companyOrganizer,
    Expression<String>? address,
    Expression<String>? imageLink,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (prizeFundAmount != null) 'prize_fund_amount': prizeFundAmount,
      if (sponsorName != null) 'sponsor_name': sponsorName,
      if (companyOrganizer != null) 'company_organizer': companyOrganizer,
      if (address != null) 'address': address,
      if (imageLink != null) 'image_link': imageLink,
    });
  }

  HacksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<int>? startDate,
      Value<int>? endDate,
      Value<int>? prizeFundAmount,
      Value<String>? sponsorName,
      Value<String>? companyOrganizer,
      Value<String>? address,
      Value<String>? imageLink}) {
    return HacksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      prizeFundAmount: prizeFundAmount ?? this.prizeFundAmount,
      sponsorName: sponsorName ?? this.sponsorName,
      companyOrganizer: companyOrganizer ?? this.companyOrganizer,
      address: address ?? this.address,
      imageLink: imageLink ?? this.imageLink,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<int>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<int>(endDate.value);
    }
    if (prizeFundAmount.present) {
      map['prize_fund_amount'] = Variable<int>(prizeFundAmount.value);
    }
    if (sponsorName.present) {
      map['sponsor_name'] = Variable<String>(sponsorName.value);
    }
    if (companyOrganizer.present) {
      map['company_organizer'] = Variable<String>(companyOrganizer.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (imageLink.present) {
      map['image_link'] = Variable<String>(imageLink.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HacksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('prizeFundAmount: $prizeFundAmount, ')
          ..write('sponsorName: $sponsorName, ')
          ..write('companyOrganizer: $companyOrganizer, ')
          ..write('address: $address, ')
          ..write('imageLink: $imageLink')
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
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
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
  final VerificationMeta _prizeFundAmountMeta =
      const VerificationMeta('prizeFundAmount');
  @override
  late final GeneratedColumn<int> prizeFundAmount = GeneratedColumn<int>(
      'prize_fund_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _imageLinkMeta = const VerificationMeta('imageLink');
  @override
  late final GeneratedColumn<String> imageLink = GeneratedColumn<String>(
      'image_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        startDate,
        endDate,
        prizeFundAmount,
        sponsorName,
        companyOrganizer,
        address,
        imageLink
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
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
    if (data.containsKey('prize_fund_amount')) {
      context.handle(
          _prizeFundAmountMeta,
          prizeFundAmount.isAcceptableOrUnknown(
              data['prize_fund_amount']!, _prizeFundAmountMeta));
    } else if (isInserting) {
      context.missing(_prizeFundAmountMeta);
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
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('image_link')) {
      context.handle(_imageLinkMeta,
          imageLink.isAcceptableOrUnknown(data['image_link']!, _imageLinkMeta));
    } else if (isInserting) {
      context.missing(_imageLinkMeta);
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
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      startDate: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}end_date'])!,
      prizeFundAmount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}prize_fund_amount'])!,
      sponsorName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}sponsor_name'])!,
      companyOrganizer: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}company_organizer'])!,
      address: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      imageLink: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}image_link'])!,
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
