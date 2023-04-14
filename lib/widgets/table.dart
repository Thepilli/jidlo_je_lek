import "package:flutter/material.dart";

class Table_Widget extends StatelessWidget {
  const Table_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Table(
            border: TableBorder.all(color: Color.fromARGB(255, 206, 153, 236)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              const TableRow(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 206, 153, 236),
                ),
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "BMI",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Hodnota Indexu",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              buildCustomTableRow("< 18,5", "Podváha"),
              buildCustomTableRow("18,5–24,9", "Optimální váha"),
              buildCustomTableRow("25,0–29,9", "Nadváha"),
              buildCustomTableRow("30,0 ≤	", "Obezita"),
            ],
          ),
        ),
      ),
    );
  }
}

TableRow buildCustomTableRow(String BMI_string, String index_string) {
  return TableRow(
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            BMI_string,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 20),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            index_string,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 20),
          ),
        ),
      ),
    ],
  );
}
