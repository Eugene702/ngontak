// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Contact extends _Contact with RealmEntity, RealmObjectBase, RealmObject {
  Contact(
    ObjectId _id,
    String name,
    String phone,
    DateTime createdAt, {
    User? user,
  }) {
    RealmObjectBase.set(this, '_id', _id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'phone', phone);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'user', user);
  }

  Contact._();

  @override
  ObjectId get _id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set _id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get phone => RealmObjectBase.get<String>(this, 'phone') as String;
  @override
  set phone(String value) => RealmObjectBase.set(this, 'phone', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  User? get user => RealmObjectBase.get<User>(this, 'user') as User?;
  @override
  set user(covariant User? value) => RealmObjectBase.set(this, 'user', value);

  @override
  Stream<RealmObjectChanges<Contact>> get changes =>
      RealmObjectBase.getChanges<Contact>(this);

  @override
  Stream<RealmObjectChanges<Contact>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Contact>(this, keyPaths);

  @override
  Contact freeze() => RealmObjectBase.freezeObject<Contact>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': _id.toEJson(),
      'name': name.toEJson(),
      'phone': phone.toEJson(),
      'createdAt': createdAt.toEJson(),
      'user': user.toEJson(),
    };
  }

  static EJsonValue _toEJson(Contact value) => value.toEJson();
  static Contact _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue _id,
        'name': EJsonValue name,
        'phone': EJsonValue phone,
        'createdAt': EJsonValue createdAt,
        'user': EJsonValue user,
      } =>
        Contact(
          fromEJson(_id),
          fromEJson(name),
          fromEJson(phone),
          fromEJson(createdAt),
          user: fromEJson(user),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Contact._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Contact, 'Contact', [
      SchemaProperty('_id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('phone', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('user', RealmPropertyType.object,
          optional: true, linkTarget: 'User'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class User extends _User with RealmEntity, RealmObjectBase, RealmObject {
  User(
    String _id,
    String name,
    String email,
    String picture, {
    Iterable<Contact> contacts = const [],
  }) {
    RealmObjectBase.set(this, '_id', _id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'picture', picture);
    RealmObjectBase.set<RealmList<Contact>>(
        this, 'contacts', RealmList<Contact>(contacts));
  }

  User._();

  @override
  String get _id => RealmObjectBase.get<String>(this, '_id') as String;
  @override
  set _id(String value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String get picture => RealmObjectBase.get<String>(this, 'picture') as String;
  @override
  set picture(String value) => RealmObjectBase.set(this, 'picture', value);

  @override
  RealmList<Contact> get contacts =>
      RealmObjectBase.get<Contact>(this, 'contacts') as RealmList<Contact>;
  @override
  set contacts(covariant RealmList<Contact> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<User>> get changes =>
      RealmObjectBase.getChanges<User>(this);

  @override
  Stream<RealmObjectChanges<User>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<User>(this, keyPaths);

  @override
  User freeze() => RealmObjectBase.freezeObject<User>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': _id.toEJson(),
      'name': name.toEJson(),
      'email': email.toEJson(),
      'picture': picture.toEJson(),
      'contacts': contacts.toEJson(),
    };
  }

  static EJsonValue _toEJson(User value) => value.toEJson();
  static User _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue _id,
        'name': EJsonValue name,
        'email': EJsonValue email,
        'picture': EJsonValue picture,
        'contacts': EJsonValue contacts,
      } =>
        User(
          fromEJson(_id),
          fromEJson(name),
          fromEJson(email),
          fromEJson(picture),
          contacts: fromEJson(contacts),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(User._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, User, 'User', [
      SchemaProperty('_id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.fullText),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('picture', RealmPropertyType.string),
      SchemaProperty('contacts', RealmPropertyType.object,
          linkTarget: 'Contact', collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
