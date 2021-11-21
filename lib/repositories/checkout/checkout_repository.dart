import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_bloc/repositories/checkout/base_checkout_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore _firebaseFirestore;
  CheckoutRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}
