import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoveDB {
  int id;
  String img;
  String title;
  String timestamp;
  String discription;

  MoveDB(
      {required this.id,
      required this.img,
      required this.title,
      required this.timestamp,
      required this.discription});
}

class MoviWidget extends StatefulWidget {
  const MoviWidget({super.key});

  @override
  State<MoviWidget> createState() => _MoviWidgetState();
}

class _MoviWidgetState extends State<MoviWidget> {
  final List<MoveDB> db = [
    MoveDB(
      id: 0,
      img: 'assets/panda-kungfu.jpg',
      title: 'Кунг-фу Панда 4',
      timestamp: '2 марта 2024',
      discription:
          'По готовится стать духовным лидером своей Долины Мира, но ему также нужен кто-то, кто займет его место Воина Дракона. Таким образом, он будет обучать нового практикующего кунг-фу для этого места и столкнется со злодеем по имени Хамелеон, который вызывает злодеев из прошлого.',
    ),
    MoveDB(
      id: 1,
      img: 'assets/megaMind.jpg',
      title: 'Мегамозг против Синдиката Рока',
      timestamp: '1 марта 2024',
      discription:
          'Бывшая команда злодеев Мегамозга, Синдиката Рока, вернулась. Наш недавно коронованный синий герой теперь должен сохранять зловещий облик, пока не сможет собрать своих друзей (Роксану, Старину Чама и Кейко), чтобы помешать своим бывшим злым товарищам по команде запустить МетроСити на Луну.',
    ),
    MoveDB(
      id: 2,
      img: 'assets/zlo.jpg',
      title: 'Территория зла',
      timestamp: '25 января 2024',
      discription:
          'Рипер, оператор беспилотника, оказывает воздушную поддержку команде, которая попадает в ловушку, оставшись без оружия. Теперь их единственным средством связи и шансом на выживание становится беспилотник.',
    ),
    MoveDB(
      id: 3,
      img: 'assets/openHumer.jpg',
      title: 'Оппенгеймер',
      timestamp: '19 июля 2023',
      discription:
          'История жизни американского физика-теоретика Роберта Оппенгеймера, который во времена Второй мировой войны руководил Манхэттенским проектом — секретными разработками ядерного оружия.',
    ),
    MoveDB(
      id: 4,
      img: 'assets/VAnilHuina.jpg',
      title: 'Кто угодно, кроме тебя',
      timestamp: '21 декабря 2023',
      discription:
          'После потрясающего первого свидания пылкое влечение Би и Бена становится ледяным - до тех пор, пока они неожиданно не встречаются на свадьбе в Австралии. Тогда они поступают так, как и подобает двум взрослым людям: притворяются парой.',
    )
  ];

  final searchControler = TextEditingController();

  var filterMovies = <MoveDB>[];

  void serchMovies() {
    final query = searchControler.text;
    if (query.isNotEmpty) {
      filterMovies = db.where((MoveDB moveDB) {
        return moveDB.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filterMovies = db;
    }
    setState(() {});
  }

  void detailFunc(int index) {
    final id = db[index].id;
    Navigator.of(context)
        .pushNamed('/main_screen/deteil_movie_info', arguments: id);
  }

  @override
  void initState() {
    super.initState();
    filterMovies = db;
    searchControler.addListener(serchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(top: 70),
            itemBuilder: (context, index) {
              final movie = filterMovies[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 48, 48, 48),
                                offset: Offset(0, 2),
                                blurRadius: 6)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            width: 1,
                          )),
                      child: Row(
                        children: [
                          Image.asset(movie.img),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                                Text(
                                  movie.timestamp,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 128, 128, 128)),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  movie.discription,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          detailFunc(index);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: filterMovies.length,
            itemExtent: 163,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: TextField(
            controller: searchControler,
            decoration: InputDecoration(
                labelText: 'sech',
                filled: true,
                fillColor: Color.fromARGB(139, 158, 158, 158),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      ],
    );
  }
}
