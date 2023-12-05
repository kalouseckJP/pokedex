
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pokedex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final images = [
    {'image': 'img/025.png', 'tipo': 'Electrico', 'nombre': 'Pikachu', 'numero':'025',},
    {'image': 'img/004.png', 'tipo': 'Fuego', 'nombre': 'Charmander', 'numero':'004'},
    {'image': 'img/007.png', 'tipo': 'Agua', 'nombre': 'Squirtle', 'numero':'007'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 460.0,
                autoPlay: true,
                ),
              items: [0, 1, 2].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Image.asset(images[i]['image']!),
                            const SizedBox(height: 20),
                            Text(
                              images[i]['nombre']!,
                              style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 300,
                              child: Row(
                                children: <Widget>[
                                  if(images[i]['tipo']=='Electrico')
                                    Container(
                                      width: 150,
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.all(Radius.circular(22)),
                                      ),
                                      child: Text(images[i]['tipo']!,style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  if(images[i]['tipo']=='Fuego')
                                    Container(
                                      width: 150,
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(Radius.circular(22)),
                                      ),
                                      child: Text(images[i]['tipo']!,style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  if(images[i]['tipo']=='Agua')
                                    Container(
                                      width: 150,
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Colors.cyan,
                                        borderRadius: BorderRadius.all(Radius.circular(22)),
                                      ),
                                      child: Text(images[i]['tipo']!,style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  Container(
                                    width: 150,
                                    child: Text('N.° ${images[i]['numero']!}', style: const TextStyle(
                                        fontSize: 22,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
