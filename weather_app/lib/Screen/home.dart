import 'package:flutter/material.dart';
import 'package:weather_app/Screen/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? cityName;
  final _cityController = TextEditingController();
  List<String> recentSearches = [];
  bool isVisible = false;
  @override
  void dispose() {        //clearing the textfield after screen navigation
    super.dispose();
    _cityController.dispose();
  }

  Future<void> getWeather() async {       //function that navigates to the weatherscreen
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherHome(
          cityName: _cityController.text,
        ),
      ),
    );
    _cityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'OpenWeather App',
                  style: TextStyle(fontSize: 34),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: TextField(
                      // onTapOutside: (value) {
                      //   setState(() {
                      //     isVisible = false;
                      //   });
                      // },
                      onTap: () {
                        setState(() {
                          isVisible = true;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          cityName = value;
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          recentSearches.add(value);
                          isVisible = false;
                        });
                      },
                      controller: _cityController,
                      style: const TextStyle(
                        color: Colors.white60,
                      ),
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                            fontSize: 17, color: Colors.white60),
                        hintText: 'Search your city',
                        suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white60,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisible = false;
                                recentSearches.add(_cityController.text);
                                cityName!.isEmpty ? null : getWeather();
                              });
                            }),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
                isVisible
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: ListView.builder(
                            itemCount: recentSearches.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cityName = recentSearches[index];
                                      _cityController.text =
                                          recentSearches[index];
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(recentSearches[index]),
                                  ));
                            }))
                    : const SizedBox.shrink(),
              ],
            ),
          )),
    );
  }
}
