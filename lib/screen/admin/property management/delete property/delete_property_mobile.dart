import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/provider/property_provider.dart';
import 'package:provider/provider.dart';

class DeletePropertyMobile extends StatelessWidget {
  const DeletePropertyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    var propertyProvider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Property'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('properties').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading properties.'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No properties available.'));
          }

          final properties = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: properties.length,
            itemBuilder: (context, index) {
              final property = properties[index];
              final propertyId = property.id;
              final propertyData = property.data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: propertyData['imageLink'] != null
                      ? Image.network(
                          propertyData['imageLink'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.home),
                  title: Text(propertyData['name'] ?? 'No Name'),
                  subtitle: Text(propertyData['address'] ?? 'No Address'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () =>
                        propertyProvider.deleteProperty(propertyId, context),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
