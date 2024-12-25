import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/provider/categories_provider.dart';
import 'package:mahalaxmi_developers/screen/categories/property%20details/property_details.dart';
import 'package:mahalaxmi_developers/widgets/cateogry_tile.dart';
import 'package:provider/provider.dart';

class CategoriesScreenMobile extends StatelessWidget {
  const CategoriesScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    var categoriesProvider = Provider.of<CategoriesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Categories List
          Container(
            padding: const EdgeInsets.all(16.0),
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesProvider.categories.length,
              itemBuilder: (context, index) {
                return CategoryTile(
                  iconData: categoriesProvider.categoriesImagesLink[index],
                  title: categoriesProvider.categories[index],
                  onTap: () {
                    categoriesProvider.changeCategory(index);
                  },
                  selectedCategory: categoriesProvider.selectedCategory,
                );
              },
            ),
          ),

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
                  return const Center(child: Text('Error occurred'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No properties available'));
                }

                final properties = snapshot.data!.docs;

                return Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
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
                          ? GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PropertyDetails(property: propertyData),
                                  )),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Theme.of(context).cardColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        propertyData['address'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : null;
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
