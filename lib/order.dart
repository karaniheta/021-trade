import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Map<String, String>> orders = [
    {
      "time": "08:14:31",
      "client": "AAA001",
      "ticker": "RELIANCE",
      "side": "Buy",
      "product": "CNC",
      "qty": "50/100",
      "price": "250.50",
    },
    {
      "time": "08:14:31",
      "client": "AAA003",
      "ticker": "MRF",
      "side": "Buy",
      "product": "NRML",
      "qty": "10/20",
      "price": "2700.00",
    },
    {
      "time": "08:14:31",
      "client": "AAA002",
      "ticker": "ASIANPAINT",
      "side": "Buy",
      "product": "NRML",
      "qty": "10/30",
      "price": "1500.60",
    },
    {
      "time": "08:14:31",
      "client": "AAA002",
      "ticker": "TATAINVEST",
      "side": "Sell",
      "product": "INTRADAY",
      "qty": "10/10",
      "price": "2300.10",
    },
  ];

  String sortBy = 'time';
  bool ascending = true;

  void sortOrders(String key) {
    setState(() {
      if (sortBy == key) {
        ascending = !ascending;
      } else {
        sortBy = key;
        ascending = true;
      }
      orders.sort((a, b) {
        int cmp;
        if (key == 'qty') {
          int aQty = int.tryParse(a['qty']!.split('/')[0]) ?? 0;
          int bQty = int.tryParse(b['qty']!.split('/')[0]) ?? 0;
          cmp = aQty.compareTo(bQty);
        } else if (key == 'price') {
          double aPrice = double.tryParse(a['price']!) ?? 0;
          double bPrice = double.tryParse(b['price']!) ?? 0;
          cmp = aPrice.compareTo(bPrice);
        } else {
          cmp = a[key]!.compareTo(b[key]!);
        }
        return ascending ? cmp : -cmp;
      });
    });
  }

  void removeSort() {
    setState(() {
      sortBy = 'time';
      ascending = true;
      orders.sort((a, b) => a['time']!.compareTo(b['time']!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFE4E4E7),
                  radius: 38,
                  child: Text(
                    "JK",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListTile(title: Text("MARKETWATCH")),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListTile(title: Text("EXCHANGE FILES")),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListTile(title: Text("PORTFOLIO")),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListTile(title: Text("FUNDS")),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListTile(title: Text("Profile")),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: CircleAvatar(
            backgroundColor: Color(0xFFE4E4E7),
            radius: 18,
            child: ClipOval(
              child: Image.asset(
                'assets/021.jpg',
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: const Text("Open Orders", style: TextStyle(color: Colors.black)),
        actions: [
          Builder(
            builder:
                (context) => IconButton(
                  icon: Icon(Icons.menu, color: Colors.black),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  Text(
                    "SIGNORIA: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("0.00", style: TextStyle(color: Colors.green)),
                  SizedBox(width: 20),
                  Text(
                    "NIFTY BANK: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("52,323.30", style: TextStyle(color: Colors.green)),
                  SizedBox(width: 20),
                  Text(
                    "NIFTY FIN SERVICE: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("25,255.75", style: TextStyle(color: Colors.green)),
                  SizedBox(width: 20),
                  Text(
                    "RELCHEMQ: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("162.73", style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(19),
                    ),
                    height: 44,
                    child: Row(
                      children: const [
                        Text("AAA002", style: TextStyle(fontSize: 15)),
                        Spacer(),
                        Icon(Icons.person_add_alt_1, size: 18),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                SizedBox(
                  width: 120,
                  height: 44,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.download),
                    label: Text(
                      "Download",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE4E4E7),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      minimumSize: Size(120, 44),
                      maximumSize: Size(120, 44),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for a stock,future, option or index",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 8,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                SizedBox(
                  width: 120,
                  height: 44,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.block, color: Colors.white),
                    label: Text(
                      "Cancel all",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDC2626),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: Size(120, 44),
                      maximumSize: Size(120, 44),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Sorting filter bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    "Sort by:",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 8),
                  ChoiceChip(
                    label: Row(
                      children: [
                        Text("Client"),
                        if (sortBy == 'client')
                          Icon(
                            ascending
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            size: 14,
                          ),
                      ],
                    ),
                    selected: sortBy == 'client',
                    onSelected: (_) => sortOrders('client'),
                    selectedColor: Color(0xFFE4E4E7),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(width: 6),
                  ChoiceChip(
                    label: Row(
                      children: [
                        Text("Qty"),
                        if (sortBy == 'qty')
                          Icon(
                            ascending
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            size: 14,
                          ),
                      ],
                    ),
                    selected: sortBy == 'qty',
                    onSelected: (_) => sortOrders('qty'),
                    selectedColor: Color(0xFFE4E4E7),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(width: 6),
                  ChoiceChip(
                    label: Row(
                      children: [
                        Text("Price"),
                        if (sortBy == 'price')
                          Icon(
                            ascending
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            size: 14,
                          ),
                      ],
                    ),
                    selected: sortBy == 'price',
                    onSelected: (_) => sortOrders('price'),
                    selectedColor: Color(0xFFE4E4E7),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(width: 6),
                  if (sortBy != 'time')
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black87,
                        minimumSize: Size(10, 32),
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 0,
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: removeSort,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.close, size: 14),
                          SizedBox(width: 2),
                          Text("Remove", style: TextStyle(fontSize: 11)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          // Card-style list with compact horizontal layout
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Card(
                    elevation: 1,
                    color: const Color(0xFFF7F7F8), // very light grey
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 15,
                                color: Colors.grey[700],
                              ),
                              SizedBox(width: 5),
                              Text(
                                order["time"]!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Text(
                                order["side"]!,
                                style: TextStyle(
                                  color:
                                      order["side"] == "Buy"
                                          ? Colors.green
                                          : Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left column
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Client",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                        height: 1.1,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      order["client"]!,
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w500,
                                        height: 1.1,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "Product",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                        height: 1.1,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      order["product"]!,
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w500,
                                        height: 1.1,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                        height: 1.1,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      "₹ ${order["price"]!}",
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w500,
                                        height: 1.1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Right column
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Ticker",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                        height: 1.1,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      order["ticker"]!,
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w500,
                                        height: 1.1,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "Qty",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                        height: 1.1,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      order["qty"]!,
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w500,
                                        height: 1.1,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.more_horiz,
                                        color: Colors.grey[700],
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
