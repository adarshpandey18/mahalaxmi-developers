import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/categories/property%20details/property_details.dart';
import 'package:mahalaxmi_developers/utils/constants/colors/app_colors.dart';
import 'package:provider/provider.dart';

import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/provider/categories_provider.dart';
import 'package:mahalaxmi_developers/widgets/cateogry_tile.dart';
import 'package:mahalaxmi_developers/widgets/desktop_navbar.dart';

class CategoriesScreenDesktop extends StatelessWidget {
  const CategoriesScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var categoriesProvider = Provider.of<CategoriesProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Desktop Navbar
            DesktopNavbar(
              authProvider: authProvider,
              currentPage: 'Categories',
            ),
            const SizedBox(height: 20),

            // Main Content
            Expanded(
              child: Row(
                children: [
                  // Categories List
                  SizedBox(
                    width: 300,
                    child: ListView.builder(
                      itemCount: categoriesProvider.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                          iconData:
                              categoriesProvider.categoriesImagesLink[index],
                          title: categoriesProvider.categories[index],
                          onTap: () {
                            categoriesProvider.changeCategory(index);
                          },
                          selectedCategory: categoriesProvider.selectedCategory,
                        );
                      },
                    ),
                  ),

                  // Spacer
                  const VerticalDivider(width: 20),

                  // Properties Grid
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('properties')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text('Error loading properties.'));
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(
                              child: Text('No properties available.'));
                        }

                        final properties = snapshot.data!.docs;
                        final filteredProperties = properties.where((property) {
                          final data = property.data() as Map<String, dynamic>;
                          return data['category'] ==
                              categoriesProvider.selectedCategory;
                        }).toList();

                        return filteredProperties.isEmpty
                            ? const Center(
                                child: Text(
                                  'No properties found for the selected category.',
                                ),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 1.0,
                                ),
                                itemCount: filteredProperties.length,
                                itemBuilder: (context, index) {
                                  final property = filteredProperties[index];
                                  final propertyData =
                                      property.data() as Map<String, dynamic>;

                                  final imageLink = propertyData['imageLink'] ??
                                      'https://via.placeholder.com/150';
                                  final name =
                                      propertyData['name'] ?? 'Unknown';
                                  final description =
                                      propertyData['description'] ??
                                          'No description available.';
                                  final address = propertyData['address'] ??
                                      'No address available';
                                  final squareFeet =
                                      propertyData['squareFeet'] ??
                                          'No Square Feet available';

                                  return GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PropertyDetails(
                                            property: propertyData),
                                      ),
                                    ),
                                    child: Card(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                            ),
                                            child: Image.network(
                                              imageLink,
                                              height: 250,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  const Icon(Icons.image),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              name,
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.royalBlue,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              description,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              address,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.royalBlue,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              'Square Feet : $squareFeet',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.midnightBlue,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
