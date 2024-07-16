import 'package:realm/realm.dart';
part 'schema.realm.dart';

@RealmModel()
class _Contact{
  @PrimaryKey()
  late ObjectId _id;

  @Indexed(RealmIndexType.fullText)
  late String name;

  @Indexed(RealmIndexType.fullText)
  late String phone;
  late DateTime createdAt;
  late _User? user;
}

@RealmModel()
class _User{
  @PrimaryKey()
  late String _id;

  @Indexed(RealmIndexType.fullText)
  late String name;

  late String email;
  late String picture;
  late List<_Contact> contacts;
}