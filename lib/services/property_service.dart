import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyService {
  Future<void> addProperty(Map<String, dynamic> property) async {
    try {
      await FirebaseFirestore.instance.collection('properties').add({
        'name': property['name'],
        'description': property['description'],
        'category': property['category'],
        'bhkConfig': property['bhkConfig'],
        'squareFeet': property['squareFeet'],
        'price': property['price'],
        'address': property['address'],
        'latitude': property['latitude'],
        'longitude': property['longitude'],
        'amenities': property['amenities'],
        'contactNumber': property['contactNumber'],
        'whatsappNumber': property['whatsappNumber'],
        'imageLink': property['imageLink'],
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteProperty(String propertyId) async {
    try {
      await FirebaseFirestore.instance
          .collection('properties')
          .doc(propertyId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
