import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:starvest/src/components/button_secondary_component.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xffDDDDDD)),
          ),
          elevation: 2,
          child: Column(children: [
            Column(
              children: [
                const SizedBox(height: 16),
                Text(
                  "Total Stock Value",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "0 USD",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(18),
              width: 300,
              height: 130,
              child: LineChart(
                LineChartData(
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: const FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        dotData: const FlDotData(
                          show: false,
                        ),
                        spots: [
                          const FlSpot(0, 1),
                          const FlSpot(1, 3),
                          const FlSpot(2, 10),
                          const FlSpot(3, 7),
                          const FlSpot(4, 12),
                          const FlSpot(5, 13),
                          const FlSpot(6, 17),
                          const FlSpot(7, 15),
                          const FlSpot(8, 20),
                        ],
                      ),
                    ]),
              ),
            ),
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SecondaryButtonComponent(
              color: Color(0xffD6D9F8),
              title: "1 Week",
              onTap: () {},
              width: 50,
              height: 30,
            ),
            SecondaryButtonComponent(
              color: Color(0xffD6D9F8),
              title: "1 Month",
              onTap: () {},
              width: 0,
              height: 30,
            ),
            SecondaryButtonComponent(
              color: Color(0xffD6D9F8),
              title: "1 Year",
              onTap: () {},
              width: 0,
              height: 30,
            ),
            SecondaryButtonComponent(
              color: Color(0xffD6D9F8),
              title: "All",
              onTap: () {},
              width: 30,
              height: 30,
            )
          ],
        )
      ],
    );
  }
}
