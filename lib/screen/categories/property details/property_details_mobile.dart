import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailsMobile extends StatelessWidget {
  final Map<String, dynamic> property;

  const PropertyDetailsMobile({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          property['name'],
          style: const TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image with Hero Animation
            Hero(
              tag: property['imageLink'],
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(
                  property['imageLink'],
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Property Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property['name'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    property['description'],
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  // Property Details Rows
                  _buildDetailRow(
                      FontAwesomeIcons.house, "Category", property['category']),
                  _buildDetailRow(FontAwesomeIcons.ruler, "Square Feet",
                      "${property['squareFeet']} sqft"),
                  _buildDetailRow(FontAwesomeIcons.bed, "BHK Configuration",
                      property['bhkConfig']),
                  _buildDetailRow(FontAwesomeIcons.locationArrow, "Address",
                      property['address']),

                  const SizedBox(height: 16),

                  // Amenities Section
                  const Text(
                    "Amenities",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        List.generate(property['amenities'].length, (index) {
                      return Chip(
                        label: Text(property['amenities'][index]),
                        backgroundColor: Colors.blueAccent.shade100,
                      );
                    }),
                  ),

                  const SizedBox(height: 16),

                  // Map Placeholder
                  const Text(
                    "Location",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // ================ MAP PLACEHOLDER ======================
                  // Container(
                  //   height: 200,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.grey[300],
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       "Map Placeholder",
                  //       style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Buttons for WhatsApp and Call
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // WhatsApp Button
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final whatsappUrl =
                        "https://wa.me/${property['whatsappNumber']}";
                    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                      await launchUrl(Uri.parse(whatsappUrl));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Unable to open WhatsApp")),
                      );
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.whatsapp),
                  label: const Text("WhatsApp"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                ),
              ),

              // Space between button
              const SizedBox(
                width: 30,
              ),

              // Call Button
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final telUrl = "tel:${property['contactNumber']}";
                    if (await canLaunchUrl(Uri.parse(telUrl))) {
                      await launchUrl(Uri.parse(telUrl));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Unable to make a call")),
                      );
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.phone),
                  label: const Text("Call"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget to Build Detail Row
  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 16),
          Text(
            "$title: ",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
