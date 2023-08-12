import '../../../ablelyf.dart';

class SearchAndFilter extends StatefulWidget {
  const SearchAndFilter({super.key});

  @override
  State<SearchAndFilter> createState() => _SearchAndFilterState();
}

class _SearchAndFilterState extends State<SearchAndFilter> {
  List<String> category = [
    'Word category',
    'Phrase category',
    'Difficulty level',
    'Length of Phrase',
    'Related words',
  ];
  List<String> wordcategory = [
    'Greetings',
    'Questions',
    'Emotions',
    'activities',
    'Food',
    'Places',
    'People',
    'Numbers',
    'Colors',
  ];
  List<String> phrasecategory = [
    'Greetings and Farewells',
    'Requests and Commands',
    'Apologies and Thanks',
    'Feelings Emotions',
    'Directions',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Search & Filter',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          const Text(
            'Reset',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: SizedBox(
                height: 46,
                width: 0.90.sw,
                child: TextField(
                  maxLines: 1,
                  style: const TextStyle(fontSize: 17),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.search,
                          color: Theme.of(context).iconTheme.color),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search words ',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 17)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: category.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  child: ExpansionTile(
                    iconColor: Colors.black,
                    title: Text(
                      category[index],
                      style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    children: [
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: [
                          for (var i = 0;
                              i <
                                  (index == 0
                                      ? wordcategory.length
                                      : phrasecategory.length);
                              i++)
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(35.0)),
                              child: Text(
                                index == 0
                                    ? wordcategory[i]
                                    : phrasecategory[i],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: (){
             Get.to(SearchResults()); 
            },
            child: Container(
                alignment: Alignment.center,
                width: 0.70.sw,
                height: 50,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black,
                ),
                child: const Text(
                  'Show results',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          
        ],
      ),
    );
  }
}
