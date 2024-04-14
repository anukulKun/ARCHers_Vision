import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

class NFTCheckerScreen extends StatefulWidget {
  @override
  _NFTCheckerScreenState createState() => _NFTCheckerScreenState();
}

class _NFTCheckerScreenState extends State<NFTCheckerScreen> {
  final TextEditingController _walletAddressController =
      TextEditingController();
  final TextEditingController _contractAddressController =
      TextEditingController();
  String _result = '';
  List<String> _imageUrls = [
    'assets/images/nft1.jpeg',
    'assets/images/nft2.jpeg',
    'assets/images/nft3.jpeg',
    'assets/images/nft4.jpeg',
    'assets/images/nft5.jpeg',
    'assets/images/nft6.jpeg',
    'assets/images/nft7.jpeg',
    'assets/images/nft8.jpeg',
    'assets/images/nft9.jpeg',
    'assets/images/nft10.jpeg',
    'assets/images/nft11.jpeg',
    'assets/images/nft12.jpeg',
    'assets/images/nft13.jpeg',
    'assets/images/nft14.jpeg',
    'assets/images/nft15.jpeg',
    'assets/images/nft16.jpeg',
  ];

  Future<void> checkWalletHolderOfToken() async {
    String walletAddress = _walletAddressController.text;
    String contractAddress = _contractAddressController.text;
    String url =
        'https://api.verbwire.com/v1/nft/data/isWalletHolderOfToken?chain=ethereum&walletAddress=$walletAddress&contractAddress=$contractAddress';
    Uri uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'X-API-Key': 'pk_live_36c34507-470e-4132-b4ef-6e4a56c13284',
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        _result =
            'Is Holder: ${data['isHolder']}, Token Count: ${data['tokenCount']}, Token IDs: ${data['tokenIds']}';
      });
    } else {
      setState(() {
        _result = 'Failed to check';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NFT Checker',
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        backgroundColor: Colors.black, // Set the app bar color to black
      ),
      body: Container(
        color: Colors.black, // Set background color to black
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _walletAddressController,
                decoration: InputDecoration(labelText: 'Wallet Address'),
              ),
              TextField(
                controller: _contractAddressController,
                decoration: InputDecoration(labelText: 'Contract Address'),
              ),
              ElevatedButton(
                onPressed: checkWalletHolderOfToken,
                child: Text('Check Holder'),
              ),
              SizedBox(height: 16.0),
              Text(
                _result,
                style:
                    TextStyle(color: Colors.white), // Set text color to white
              ), // Display the result here
              SizedBox(height: 16.0),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 255, 224,
                      224), // Example color, replace with your desired color
                  child: CarouselSlider(
                    items: _imageUrls.map((imageUrl) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(
                            8.0), // Set border radius for images
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your action here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  ),
                  child: Text('Bid'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
