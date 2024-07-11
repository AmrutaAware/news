import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:news_page/models/category_model.dart';
// import 'package:telphanews/modules/NewsScreen/presentation/data.dart';
// import 'package:telphanews/modules/NewsScreen/presentation/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telphanews/modules/NewsScreen/presentation/pages/category_model.dart';
import 'package:telphanews/modules/NewsScreen/presentation/pages/data.dart';
import 'package:telphanews/modules/NewsScreen/presentation/pages/slider_data.dart';
import 'package:telphanews/modules/NewsScreen/presentation/pages/slider_model.dart';

// import '../models/slider_model.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const HomePage({required this.isDarkMode, required this.toggleTheme, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<SliderModel> slider = [];

  int activeIndex = 0;
  String selectedLanguage = 'English';

  @override
  void initState() {
    categories = getCategories();
    slider = getSliders();
    super.initState();
  }

  void _changeLanguage(String language) {
    setState(() {
      selectedLanguage = language;
      // Add your language change logic here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Top 10"),
            Text(
              " News",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          Switch(
            value: widget.isDarkMode,
            onChanged: (value) {
              widget.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categories[index].image,
                      categoryName: categories[index].categoryName,
                    );
                  },
                ),
              ),
              const SizedBox(height: 30.0),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Breaking News!",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              CarouselSlider.builder(
                itemCount: slider.length,
                itemBuilder: (context, index, realIndex) {
                  String? res = slider[index].image;
                  String? res1 = slider[index].name;
                  return buildImage(res!, index, res1!);
                },
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30.0),
              Center(child: buildIndicator()),
              const SizedBox(height: 30.0),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        "Sports News!",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              buildNewsItem(
                image: "asset/sports1.jpg",
                title: "Rui Coasta outsprints breakaway to win stage 15",
                description: "Then a final kick to beat lennard kamna",
              ),
              const SizedBox(height: 10.0),
              buildNewsItem(
                image: "asset/tennis.jpg",
                title: "Epic Tennis Showdown",
                description: "A thrilling tennis match that went down to the wire."
              ),
              const SizedBox(height: 10.0),
              buildNewsItem(
                image: "asset/football.jpg",
                title: "Football Championship Highlights",
                description: "Top moments from the football championship.",
              ),
              const SizedBox(height: 10.0),
              buildNewsItem(
                image: "asset/race.jpg",
                title: "Marathon Winner's Inspiring Story",
                description: "The journey of the marathon winner.",
              ),
              const SizedBox(height: 10.0),
              buildNewsItem(
                image: "asset/basket.jpg",
                title: "Basketball Finals Recap", 
                description: "An exciting recap of the basketball finals.",
              ),
              const SizedBox(height: 10.0),
              buildNewsItem(
                image: "asset/cricket.jpg",
                title: "Cricket World Cup Analysis",
                description: "A detailed analysis of the Cricket World Cup.",
              ),
              const SizedBox(height: 10.0),
              buildNewsItem(
                image: "asset/swim.jpg",
                title: "Swim Meet Results",
                description: "Highlights from the latest swim meet.",
              ),
              const SizedBox(height: 10.0),
              buildNewsItem(
                image: "asset/gym.jpg",
                title: "Gymnastics Competition Winners",
                description: "Top performers in the gymnastics competition.",
              ),
              const SizedBox(height: 10.0),
              buildNewsItem(
                image: "asset/golf.jpg",
                title: "Golf Tournament Highlights",
                description: "Key moments from the golf tournament.",
              ),
              const SizedBox(height: 10.0),
              buildNewsItem(
                image: "asset/cycle.jpg",
                title: "Cycling Race Update",
                description: "Latest updates from the cycling race.",
              ),
              const SizedBox(height: 20.0),
              buildLanguageSelector(),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNewsItem({required String image, required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 223, 78, 126),
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          description,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 167, 160, 160),
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Read More",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up),
                        onPressed: () {},
                        color: Colors.grey,
                      ),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                        color: Colors.grey,
                      ),
                      IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {},
                        color: Colors.grey,
                      ),
                      IconButton(
                        icon: const Icon(Icons.comment),
                        onPressed: () {},
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                height: 250,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.only(left: 40.0),
              margin: const EdgeInsets.only(top: 170.0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: slider.length,
        effect: const SlideEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Colors.blue,
        ),
      );

  Widget buildLanguageSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Select Language: ',
            style: TextStyle(
              color:Colors.blue,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          DropdownButton<String>(
            value: selectedLanguage,
            onChanged: (String? newValue) {
              if (newValue != null) {
                _changeLanguage(newValue);
              }
            },
            items: <String>['English', 'Hindi', 'Marathi','other']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('asset/images/telphatech_logo.png', height: 50),
                const SizedBox(height: 10),
                const Text(
                  'About Us',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.twitter),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Links',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Home'),
                Text('About'),
                Text('Services'),
                Text('Contact'),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Support',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('FAQ'),
                Text('Help Center'),
                Text('Privacy Policy'),
                Text('Terms of Service'),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Us',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Email: info@example.com'),
                Text('Phone: +1 234 567 890'),
                Text('Address: 123 Main Street, City, Country'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;
  CategoryTile({this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black38,
            ),
            child: Center(
              child: Text(
                categoryName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

