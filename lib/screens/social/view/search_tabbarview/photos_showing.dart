import '../../../../ablelyf.dart';

class PhotoShowing extends StatefulWidget {
  const PhotoShowing({super.key});

  @override
  State<PhotoShowing> createState() => _PhotoShowingState();
}

class _PhotoShowingState extends State<PhotoShowing> {
  List<String> cakes = [
    'https://thumbs.dreamstime.com/b/birthday-cake-decorated-colorful-sprinkles-ten-candles-colorful-birthday-cake-sprinkles-ten-candles-blue-142412983.jpg',
    'https://d3cif2hu95s88v.cloudfront.net/live-site-2016/product-image/IMG/157858115529a-350x350.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRibJcWDd5vWQVWok0-nkU7G_FPMBReecODQ&usqp=CAU',
    'https://theobroma.in/cdn/shop/products/EgglessRedVelvetCake1.jpg?v=1632141306',
    'https://st4.depositphotos.com/10614052/25239/i/450/depositphotos_252391082-stock-photo-sweet-chocolate-cake-on-wooden.jpg',
    'https://st4.depositphotos.com/10614052/25239/i/450/depositphotos_252391082-stock-photo-sweet-chocolate-cake-on-wooden.jpg',
    'https://thumbs.dreamstime.com/b/birthday-cake-decorated-colorful-sprinkles-ten-candles-colorful-birthday-cake-sprinkles-ten-candles-blue-142412983.jpg',
    'https://d3cif2hu95s88v.cloudfront.net/live-site-2016/product-image/IMG/157858115529a-350x350.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRibJcWDd5vWQVWok0-nkU7G_FPMBReecODQ&usqp=CAU',
    'https://theobroma.in/cdn/shop/products/EgglessRedVelvetCake1.jpg?v=1632141306',
    'https://st4.depositphotos.com/10614052/25239/i/450/depositphotos_252391082-stock-photo-sweet-chocolate-cake-on-wooden.jpg',
    'https://st4.depositphotos.com/10614052/25239/i/450/depositphotos_252391082-stock-photo-sweet-chocolate-cake-on-wooden.jpg',
    'https://thumbs.dreamstime.com/b/birthday-cake-decorated-colorful-sprinkles-ten-candles-colorful-birthday-cake-sprinkles-ten-candles-blue-142412983.jpg',
    'https://d3cif2hu95s88v.cloudfront.net/live-site-2016/product-image/IMG/157858115529a-350x350.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRibJcWDd5vWQVWok0-nkU7G_FPMBReecODQ&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 10.0,
          runSpacing: 7.0,
          children: [
            for (var i = 0; i < cakes.length; i++)
              Container(
                height: i.isEven ? 0.30.sh : 160,
                width: 0.30.sw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                        image: NetworkImage(cakes[i]), fit: BoxFit.cover)),
              )
          ],
        ),
      ),
    );
  }
}
