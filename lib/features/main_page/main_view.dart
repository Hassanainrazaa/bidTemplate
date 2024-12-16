import 'package:flutter/material.dart';
import 'package:my_flutter_web_project/utills/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> tabs = [
    "Request Received",
    "Pre-lim Review",
    "Bid Setup",
    "Preparation",
    "Submission",
    "Bid Clarification",
    "Closed",
  ];

  // Default to the first chip being selected
  String? selectedTab;

  @override
  void initState() {
    super.initState();
    selectedTab = tabs[0]; // Set the first tab as selected by default
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Chips Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tabs.map((tab) {
                    bool isSelected = selectedTab == tab;
                    return ChoiceChip(
                      label: Text(
                        tab,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      selected: isSelected,
                      backgroundColor: Colors.white,
                      selectedColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      side: BorderSide(
                        color: isSelected ? Colors.blue : Colors.grey,
                        width: 1.5,
                      ),
                      onSelected: (selected) {
                        setState(() {
                          selectedTab = selected ? tab : null;
                        });
                      },
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text("Log Out"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Tab Bar Section
          Expanded(
            child: DefaultTabController(
              length: 6,
              child: Column(
                children: [
                  TabBar(
                    indicator: const BoxDecoration(
                      //color: Colors.blue.shade100,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                    indicatorPadding: EdgeInsets.zero,
                    //labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black54,
                    tabs: [
                      _buildTabWithBorder("Overview"),
                      _buildTabWithBorder("Review"),
                      _buildTabWithBorder("Bid Setup"),
                      _buildTabWithBorder("Preparation"),
                      _buildTabWithBorder("Submission"),
                      _buildTabWithBorder("Clarification"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildTabContent("Overview"),
                        _buildTabContent("Review"),
                        _buildTabContent("Bid Setup"),
                        _buildTabContent("Preparation"),
                        _buildTabContent("Submission"),
                        _buildTabContent("Clarification"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create tabs with a border
  Widget _buildTabWithBorder(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper method to create content for tabs
  Widget _buildTabContent(String title) {
    if (title == "Overview") {
      return Padding(
        padding: const EdgeInsets.only(left: 50, top: 50),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // RFx Information Section
                const Text(
                  "RFx Information",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                _buildInfoRow("RFx ID", "RFX-000008"),
                _buildInfoRow("RFx Record Type", "New"),
                _buildInfoRow("RFx #", "EW-RFQ-2024--0132"),
                _buildInfoRow("RFx Type", "RFQ (Request For Quote)"),
                _buildInfoRow("Bid Type", "Firm"),

                const SizedBox(height: 30),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bid Information Section
                  // Text(
                  //   "Bid Information",
                  //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  // ),
                  const SizedBox(height: 30),
                  _buildInfoRow("BID ID", "BID 000010"),
                  _buildInfoRow("Previous Record Type", ""),
                  _buildInfoRow("Bid Validity Period", "60 Days"),
                  _buildInfoRow("", ""),
                  _buildInfoRow("Customer Framework Agreement", ""),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Text(
          "Content for $title",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      );
    }
  }

  // Helper method to create a row of information
  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 136, 134, 134),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            color: value == "RFX-000008"
                ? Colors.blue
                : (value.isNotEmpty ? Colors.black : Colors.grey),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
