import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/admin/property%20management/delete%20property/delete_property.dart';
import 'package:mahalaxmi_developers/services/property_service.dart';

class PropertyProvider extends ChangeNotifier {
  PropertyService _propertyService = PropertyService();

  addProperty(Map<String, dynamic> property, BuildContext context) async {
    await _propertyService.addProperty(property);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Property Added Successfully')),
    );
    notifyListeners();
  }

  deleteProperty(String propertyId, BuildContext context) async {
    await _propertyService.deleteProperty(propertyId);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Property Deleted Successfully')),
    );
    notifyListeners();
    
  }
}
