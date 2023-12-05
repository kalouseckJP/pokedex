//Juan Pablo Rodríguez & Sebastian Leiva

import 'package:flutter/material.dart';

// el paquete que nos permite usar el carrusel. 
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
  // Los pokemons son creados como objetos, esto permite utilizar sus datos
  final images = [
    // image : ruta de la imagen
    // tipo : tipo del pokemon
    // nombre : nombre del pokemon
    // numero : numero en la pokedex
    {
      'image': 'img/025.png',
      'tipo': 'Electrico',
      'nombre': 'Pikachu',
      'numero': '025',
    },
    {
      'image': 'img/004.png',
      'tipo': 'Fuego',
      'nombre': 'Charmander',
      'numero': '004'
    },
    {
      'image': 'img/007.png',
      'tipo': 'Agua',
      'nombre': 'Squirtle',
      'numero': '007'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Se utiliza un SizedBox para poder central el texto del titlo
        title: SizedBox(
            width: double.infinity,
            child: Text(widget.title, textAlign: TextAlign.center)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Creacion del carrucel
            CarouselSlider(
              // Configuracion del carrucel
              options: CarouselOptions(
                height: 460.0,
                // Aautomaticamente desliza
                autoPlay: true,
              ),
              // Cantidad de slides
              items: [0, 1, 2].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        // Este es el elemnto que funcionara como slide
                        child: Card(
                          // Elementos al interio de la card
                          child: Column(
                            children: <Widget>[
                              // Imagen de los pokemons
                              Image.asset(images[i]['image']!),
                              const SizedBox(height: 20),
                              // Nombre del Pokemon
                              Text(
                                images[i]['nombre']!,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Tipo y numero de la pokedex
                              SizedBox(
                                // ancho que permite un margen en cada lado
                                width: 300,
                                // Se utiliza row para tener ambos en columnas
                                child: Row(
                                  children: <Widget>[
                                    // Se utiliza un if, este if lee el valor de 'tipo'
                                    // dependiendo del tipo les da un color distinto
                                    // 1
                                    if (images[i]['tipo'] == 'Electrico')
                                      // Contenedor que permite el cambio de color
                                      Container(
                                        // un ancho que utiliza la midad del ancho de la columna
                                        width: 150,
                                        // Cambio de color y borde redondeado
                                        decoration: const BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(22)),
                                        ),
                                        // Texto dentro del contenedor que tiene el tipo
                                        child: Text(
                                          images[i]['tipo']!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                          ),
                                          // Se alinea en el centro dentro del contenedor
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    // 2
                                    if (images[i]['tipo'] == 'Fuego')
                                      Container(
                                        width: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(22)),
                                        ),
                                        child: Text(
                                          images[i]['tipo']!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    // 3
                                    if (images[i]['tipo'] == 'Agua')
                                      Container(
                                        width: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.cyan,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(22)),
                                        ),
                                        child: Text(
                                          images[i]['tipo']!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    // segunda columna, numero en la pokedex
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        'N.° ${images[i]['numero']!}',
                                        style: const TextStyle(
                                          fontSize: 22,
                                        ),
                                        // alineacion a la derecha de la columna
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                    },
                  );
                }
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
