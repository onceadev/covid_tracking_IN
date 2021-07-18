import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/data/country_virus_data.dart';
import 'package:flutter_app/data/virus_data.dart';
import 'package:flutter_app/screens/states.dart';
import 'package:flutter_app/widgets/infoCard.dart';
import 'package:flutter_app/widgets/my_header.dart';
import 'package:flutter_app/widgets/widgetCard.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {this.locationVirusData,
      this.virusData,
      this.countriesData,
      this.statesData});
  final virusData;
  final locationVirusData;
  final countriesData;
  final statesData;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VirusData data;
  CountryVirusData locationData;
  int index = 0;
  List<CountryVirusData> countriesData = [];

  @override
  void initState() {
    updateUI(widget.virusData);
    updateLocationUI(widget.locationVirusData);
    updateCountriesUI(widget.countriesData);
    super.initState();
  }

  void updateUI(dynamic virusData) {
    setState(() {
      if (virusData == null) {
        data = VirusData(
          confirmedCases: 0,
          recovered: 0,
          deaths: 0,
        );
        return;
      }

      data = VirusData(
          confirmedCases: virusData['cases'],
          recovered: virusData['recovered'],
          deaths: virusData['deaths'],
          active: virusData['active']);
    });
  }

  void updateCountriesUI(dynamic virusData) {
    setState(() {
      if (virusData == null) {
        locationData = CountryVirusData(
          country: 'none',
          confirmedCases: 0,
          recovered: 0,
          deaths: 0,
        );
        print('null');
        return;
      }
      for (var eachData in virusData) {
        final countryData = CountryVirusData(
            country: eachData['country'],
            confirmedCases: eachData['cases'],
            recovered: eachData['recovered'],
            deaths: eachData['deaths'],
            flagUrl: eachData['countryInfo']['flag'],
            active: eachData['active']);
        countriesData.add(countryData);
      }
    });
  }

  void updateLocationUI(dynamic virusData) {
    setState(() {
      if (virusData == null) {
        locationData = CountryVirusData(
          country: 'none',
          confirmedCases: 0,
          recovered: 0,
          deaths: 0,
          active: 0,
        );
        return;
      }

      locationData = CountryVirusData(
          country: virusData['country'],
          confirmedCases: virusData['cases'],
          recovered: virusData['recovered'],
          deaths: virusData['deaths'],
          active: virusData['active']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        MyHeader(
          image: "assets/icons/Drcorona.svg",
          textTop: "All you need",
          textBottom: "is stay at home.",
          offset: 0,
          key: null,
        ),
        Container(
          padding: EdgeInsets.only(
            left: xMargin(2),
            right: xMargin(2),
          ),
          width: double.infinity,
          child: Wrap(
            spacing: xMargin(3),
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: yMargin(2),
            children: <Widget>[
              InfoCard(
                title: "Confirmed",
                color: Colors.red,
                effectedNum: locationData.confirmedCases,
              ),
              InfoCard(
                title: "Deaths",
                color: Colors.grey,
                effectedNum: locationData.deaths,
                spot: "death",
              ),
              InfoCard(
                title: "Recovered",
                color: Colors.green,
                effectedNum: locationData.recovered,
              ),
              InfoCard(
                title: "Active",
                color: Colors.blue,
                effectedNum: locationData.active,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 800),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    StatesInfoScreen(
                  stateVirusData: widget.statesData,
                ),
              ),
            );
          },
          child: WidgetCard(
            srcAsset: "assets/icons/india.svg",
            title: "Indian States",
          ),
        ),
      ],
    ));
  }
}
