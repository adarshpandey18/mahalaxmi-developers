import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/provider/categories_provider.dart';
import 'package:mahalaxmi_developers/widgets/cateogry_tile.dart';
import 'package:mahalaxmi_developers/widgets/desktop_navbar.dart';
import 'package:provider/provider.dart';

class CategoriesScreenDesktop extends StatelessWidget {
  const CategoriesScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var categoriesProvider = Provider.of<CategoriesProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Desktop Navbar
            DesktopNavbar(
              authProvider: authProvider,
              currentPage: 'Categories',
            ),
            const SizedBox(height: 75),

            // Row for Categories and Properties
            Row(
              children: [
                // Categories List
                Container(
                  width: 300, // fixed width for categories list
                  child: ListView.builder(
                    shrinkWrap: true, // prevents overflow
                    scrollDirection: Axis.vertical,
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

                // Spacer between Categories and Properties
                const SizedBox(width: 20),

                // Properties Grid
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('properties')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
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

                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: properties.length,
                        itemBuilder: (context, index) {
                          final property = properties[index];
                          final propertyData =
                              property.data() as Map<String, dynamic>;

                          return propertyData['category'] ==
                                  categoriesProvider.selectedCategory
                              ? Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Theme.of(context).cardColor,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          propertyData['imageLink'],
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: double.infinity,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          propertyData['name'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          propertyData['description'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox.shrink();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
