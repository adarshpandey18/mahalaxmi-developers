import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/provider/property_provider.dart';
import 'package:provider/provider.dart';

class AddPropertyMobile extends StatefulWidget {
  const AddPropertyMobile({super.key});

  @override
  State<AddPropertyMobile> createState() => _AddPropertyMobileState();
}

class _AddPropertyMobileState extends State<AddPropertyMobile> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for Text Fields
  final TextEditingController _propertyNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _squareFeetController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _whatsappNumberController =
      TextEditingController();
  final TextEditingController _imageLinkController = TextEditingController();
  // State for Dropdowns
  String? _selectedCategory;
  String? _selectedBhkConfig;

  // State for Amenities
  final List<String> _amenities = [];
  final List<String> _availableAmenities = [
    'Parking',
    'Gym',
    'Swimming Pool',
    'Security',
    'Power Backup'
  ];

  @override
  Widget build(BuildContext context) {
    var propertyProvider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Property Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Property Name
                TextFormField(
                  controller: _propertyNameController,
                  decoration: const InputDecoration(
                    labelText: 'Property Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Enter property name'
                      : null,
                ),
                const SizedBox(height: 16),

                // Description
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Provide a description'
                      : null,
                ),
                const SizedBox(height: 16),

                // Category
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Residential', 'Shop', 'Office']
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() {
                    _selectedCategory = value;
                  }),
                  validator: (value) =>
                      value == null ? 'Select a category' : null,
                ),
                const SizedBox(height: 16),

                // BHK Configuration
                DropdownButtonFormField<String>(
                  value: _selectedBhkConfig,
                  decoration: const InputDecoration(
                    labelText: 'BHK Configuration (if Residential)',
                    border: OutlineInputBorder(),
                  ),
                  items: ['1 BHK', '2 BHK', '3 BHK', '4 BHK']
                      .map((config) => DropdownMenuItem(
                            value: config,
                            child: Text(config),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() {
                    _selectedBhkConfig = value;
                  }),
                ),
                const SizedBox(height: 16),

                // Size and Pricing
                Column(
                  children: [
                    TextFormField(
                      controller: _squareFeetController,
                      decoration: const InputDecoration(
                        labelText: 'Square Feet',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Enter size' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(
                        labelText: 'Price (Optional)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Address and Geolocation
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Full Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Enter the address'
                      : null,
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _latitudeController,
                        decoration: const InputDecoration(
                          labelText: 'Latitude',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _longitudeController,
                        decoration: const InputDecoration(
                          labelText: 'Longitude',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Amenities
                const Text('Amenities',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _availableAmenities.map((amenity) {
                    return FilterChip(
                      label: Text(amenity),
                      selected: _amenities.contains(amenity),
                      onSelected: (selected) {
                        setState(() {
                          selected
                              ? _amenities.add(amenity)
                              : _amenities.remove(amenity);
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                // Contact Details
                TextFormField(
                  controller: _contactNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Contact Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Provide a contact number'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _whatsappNumberController,
                  decoration: const InputDecoration(
                    labelText: 'WhatsApp Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Provide a contact number'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _imageLinkController,
                  decoration: const InputDecoration(
                    labelText: 'Image Link',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Provide a image link'
                      : null,
                ),
                const SizedBox(
                  height: 20,
                ),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final property = {
                        'name': _propertyNameController.text,
                        'description': _descriptionController.text,
                        'category': _selectedCategory,
                        'bhkConfig': _selectedBhkConfig,
                        'squareFeet': _squareFeetController.text,
                        'price': _priceController.text,
                        'address': _addressController.text,
                        'latitude': _latitudeController.text,
                        'longitude': _longitudeController.text,
                        'amenities': _amenities,
                        'contactNumber': _contactNumberController.text,
                        'whatsappNumber': _whatsappNumberController.text,
                        'imageLink': _imageLinkController.text,
                      };
                      propertyProvider.addProperty(property, context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Property Added!')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
