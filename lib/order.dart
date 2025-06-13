import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final List<Map<String, String>> orders = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
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
            ListTile(title: Text("MARKETWATCH")),
            ListTile(title: Text("EXCHANGE FILES")),
            ListTile(title: Text("PORTFOLIO")),
            ListTile(title: Text("FUNDS")),
            ListTile(title: Text("Profile")),
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

          // Row: AAA002 with icon & Download
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 12, 10, 6),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    height: 50,
                    child: Row(
                      children: const [
                        Text("AAA002", style: TextStyle(fontSize: 16)),
                        Spacer(),
                        Icon(Icons.person_add_alt_1, size: 18),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.download),
                  label: Text("Download"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(140, 48),
                  ),
                ),
              ],
            ),
          ),

          // Row: Search box & Cancel button
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for a stock,future, option or index",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.block, color: Colors.white),
                  label: Text(
                    "Cancel all",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    minimumSize: Size(140, 48),
                  ),
                ),
              ],
            ),
          ),

          // Orders table
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 1000,
                child: ListView.builder(
                  itemCount: orders.length + 1,
                  itemBuilder: (context, index) {
                    final isHeader = index == 0;
                    final row =
                        isHeader
                            ? {
                              "time": "Time",
                              "client": "Client",
                              "ticker": "Ticker",
                              "side": "Side",
                              "product": "Product",
                              "qty": "Qty (Exec/Total)",
                              "price": "Price",
                            }
                            : orders[index - 1];

                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isHeader ? Color(0xFFE4E4E7) : Colors.white,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                      child: Row(
                        children: [
                          // Time
                          Expanded(
                            flex: 1,
                            child:
                                isHeader
                                    ? Row(
                                      children: [
                                        Text(
                                          row["time"]!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Icon(Icons.swap_vert, size: 18),
                                        SizedBox(width: 2),
                                        Icon(
                                          Icons.filter_alt_outlined,
                                          size: 16,
                                        ),
                                      ],
                                    )
                                    : Text(row["time"]!),
                          ),
                          // Client
                          Expanded(
                            flex: 1,
                            child:
                                isHeader
                                    ? Row(
                                      children: [
                                        Text(
                                          row["client"]!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Icon(Icons.swap_vert, size: 18),

                                        SizedBox(width: 2),
                                        Icon(
                                          Icons.filter_alt_outlined,
                                          size: 16,
                                        ),
                                      ],
                                    )
                                    : Text(row["client"]!),
                          ),
                          // Ticker
                          Expanded(
                            flex: 1,
                            child:
                                isHeader
                                    ? Row(
                                      children: [
                                        Text(
                                          row["ticker"]!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Icon(
                                          Icons.filter_alt_outlined,
                                          size: 16,
                                        ),
                                      ],
                                    )
                                    : Text(row["ticker"]!),
                          ),
                          // Side
                          Expanded(
                            flex: 1,
                            child:
                                isHeader
                                    ? Row(
                                      children: [
                                        Text(
                                          row["side"]!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Icon(Icons.swap_vert, size: 18),

                                        SizedBox(width: 2),
                                        Icon(
                                          Icons.filter_alt_outlined,
                                          size: 16,
                                        ),
                                      ],
                                    )
                                    : Text(row["side"]!),
                          ),
                          // Product
                          Expanded(
                            flex: 1,
                            child:
                                isHeader
                                    ? Row(
                                      children: [
                                        Text(
                                          row["product"]!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Icon(Icons.swap_vert, size: 18),

                                        SizedBox(width: 2),
                                        Icon(
                                          Icons.filter_alt_outlined,
                                          size: 16,
                                        ),
                                      ],
                                    )
                                    : Text(row["product"]!),
                          ),
                          // Qty
                          Expanded(
                            flex: 1,
                            child:
                                isHeader
                                    ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            row["qty"]!,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Icon(Icons.swap_vert, size: 18),

                                        SizedBox(width: 2),
                                        Icon(
                                          Icons.filter_alt_outlined,
                                          size: 16,
                                        ),
                                      ],
                                    )
                                    : Text(row["qty"]!),
                          ),
                          SizedBox(width: 10),
                          // Price
                          Expanded(
                            flex: 1,
                            child:
                                isHeader
                                    ? Row(
                                      children: [
                                        Text(
                                          row["price"]!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Icon(Icons.swap_vert, size: 18),

                                        SizedBox(width: 2),
                                        Icon(
                                          Icons.filter_alt_outlined,
                                          size: 16,
                                        ),
                                      ],
                                    )
                                    : Text(row["price"]!),
                          ),
                          // Actions (only for data rows)
                          if (!isHeader)
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(Icons.more_horiz),
                              ),
                            ),
                          if (isHeader)
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Actions",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Pagination
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.arrow_back_ios, size: 18),
                SizedBox(width: 2),
                Text("Previous", style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 97),
                Text("Page 1", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 97),
                Text("Next", style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 2),
                Icon(Icons.arrow_forward_ios, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
