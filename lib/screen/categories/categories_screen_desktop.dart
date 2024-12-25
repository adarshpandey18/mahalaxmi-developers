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
          children: [
            DesktopNavbar(
              authProvider: authProvider,
              currentPage: 'Categories',
            ),
            const SizedBox(height: 75),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
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
                ),
                Expanded(flex: 8, child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
