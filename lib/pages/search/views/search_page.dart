import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/pages/search/views/details/details_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/pages/search/views/widgets/business_list_tile.dart';
import 'package:traces/pages/search/views/widgets/business_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  bool _showBusinessCards = false;

  final List<Map<String, dynamic>> _businesses = [
    {
      "logoUrl": "assets/icons/amazon.png",
      "businessName": "Amazon.com, Inc",
      "country": "Sri Lanka",
      "category": "Ecommerce",
      "rating": 4.3,
    },
    {
      "logoUrl": "assets/icons/amazon.png",
      "businessName": "Amazon.com, Inc",
      "country": "Sri Lanka",
      "category": "Ecommerce",
      "rating": 4.3,
    },
    {
      "logoUrl": "assets/icons/amazon.png",
      "businessName": "Amazon.com, Inc",
      "country": "Sri Lanka",
      "category": "Ecommerce",
      "rating": 4.3,
    },
  ];

  List<Map<String, dynamic>> _filteredBusinesses = [];

  @override
  void initState() {
    super.initState();
    _filteredBusinesses = _businesses;
  }

  void _filterSearch(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      _showBusinessCards = _isSearching;

      if (query.isEmpty) {
        _filteredBusinesses = _businesses;
      } else {
        _filteredBusinesses = _businesses
            .where((business) => business["businessName"]
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
              child: Row(
                children: [
                  Expanded(child: buildSearchBar()),
                  const SizedBox(width: 14),
                  GestureDetector(
                    onTap: () {
                      _searchController.clear();
                      FocusScope.of(context).unfocus();
                      setState(() {
                        _isSearching = false;
                        _showBusinessCards = false;
                        _filteredBusinesses = _businesses;
                      });
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xFF0A84FF),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        height: 1.29,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_isSearching && _filteredBusinesses.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Text(
                    "No Results Found",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            if (!_isSearching) ...[
              BusinessListTile(
                icon: CupertinoIcons.building_2_fill,
                title: "Businesses",
                onTap: () => _showCategoryResults("Businesses"),
              ),
              BusinessListTile(
                icon: CupertinoIcons.cube_box,
                title: "Logistics",
                onTap: () => _showCategoryResults("Logistics"),
              ),
              BusinessListTile(
                icon: CupertinoIcons.arrow_2_circlepath,
                title: "Returns",
                onTap: () => _showCategoryResults("Returns"),
                trailingIcon: CupertinoIcons.line_horizontal_3_decrease,
              ),
              BusinessListTile(
                icon: CupertinoIcons.xmark,
                title: "Declined",
                onTap: () => _showCategoryResults("Declined"),
                trailingIcon: CupertinoIcons.line_horizontal_3_decrease,
              ),
            ],
            if (_showBusinessCards && _filteredBusinesses.isNotEmpty)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount: _filteredBusinesses.length,
                    itemBuilder: (context, index) {
                      var business = _filteredBusinesses[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => ModalBottomSheet(
                                  child: DetailsView(),
                                ),
                              );
                            },
                            child: BusinessCard(
                              logoUrl: business["logoUrl"],
                              businessName: business["businessName"],
                              country: business["country"],
                              category: business["category"],
                              rating: business["rating"],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      controller: _searchController,
      cursorColor: Colors.white70,
      onChanged: _filterSearch,
      decoration: InputDecoration(
        isCollapsed: true,
        filled: true,
        fillColor: const Color.fromRGBO(118, 118, 128, 0.24),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: "Search for Businesses, Shipments ...",
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          letterSpacing: -0.41,
          color: Color.fromRGBO(235, 235, 245, 0.6),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 12.0, right: 5.0),
          child: Icon(
            CupertinoIcons.search,
            color: Color.fromRGBO(235, 235, 245, 0.6),
            size: 20,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
      ),
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        letterSpacing: -0.41,
        color: Colors.white,
      ),
    );
  }

  void _showCategoryResults(String category) {
    setState(() {
      _isSearching = true;
      _showBusinessCards = category == "Businesses";

      if (_showBusinessCards) {
        _filteredBusinesses = _businesses;
      } else {
        _filteredBusinesses = [];
      }
    });
  }
}
