import 'package:ngontak/app/database/schema.dart' as ngontak;
import 'package:realm/realm.dart';

final appDB = App(AppConfiguration("ngontak-ajofgnd"));

class Database {
  late final Realm realm;

  Future<void> initialize() async {
    final app = App(AppConfiguration("ngontak-ajofgnd"));
    final user = app.currentUser ?? await app.logIn(Credentials.anonymous());
    realm = Realm(Configuration.flexibleSync(user, [
      ngontak.User.schema,
      ngontak.Contact.schema
    ]));

    await addSubscription();
  }

  Future<void> addSubscription() async {
    final subscription = realm.subscriptions;
    subscription.update((mutableSubscription) {
      mutableSubscription.add(realm.all<ngontak.User>());
      mutableSubscription.add(realm.all<ngontak.Contact>());
    });

    await realm.subscriptions.waitForSynchronization();
  }
}
