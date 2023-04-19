<h1 align="center">KudaOpenAPI Integration in Flutter</h1>

<!-- Status -->

<h4 align="center">
	KudaOpenAPI for flutter for seemless banking via Kudaopenapi.
</h4>

<hr>

<p align="center">
  <a href="#dart-getting-started">Getting Started</a> &#xa0; | &#xa0;
  <a href="#dart-installation">Installation</a> &#xa0; | &#xa0;
  <a href="#sparkles-usage">Usage</a> &#xa0; | &#xa0;
  <a href="#memo-license">License</a> &#xa0; | &#xa0;
  <a href="https://github.com/giftbalogun" target="_blank">Author</a>
</p>

<br>

## :dart: Getting Started

Enable your product for local transactions with the KudaOpenAPI! With the KUDA Open APIs you can embed services unto your platform and connect your customers to a wide range of banking services.

Before you proceed, ensure you have a [Kuda Business account](https://business.kuda.com/)!. You can link this account to your profile to get approved for live. 

Get your token from the [Developer Dashboard](https://developer.kuda.com/)!.

## :dart: Installation

To use this plugin, add `kudaopenapi` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

Then initialize the plugin preferably in the `initState` of your widget.

``` dart
import 'package:kudaopenapi/kudaopenapi.dart';

class _MyHomePageState extends State<MyHomePage> {
	var baseurl = 'TEST_OR_LIVE_URL';
	var email = 'EMAIL';
	var apikey = 'APIKEY';
	@override
	void initState() {
		ApiService.initialize(baseurl, email, apikey);
		super.initState();
	}
}
```

No other configuration required&mdash;the plugin works out of the box.

## :sparkles: Usage

Make Request to the API using this

``` dart
String trackingReference = Random().nextInt(100000).toString();

Map<String, dynamic> data = {
  'ClientAccountNumber': "00000000000",
  'beneficiarybankCode': "000014",
  'beneficiaryAccount': "000000000000",
  'beneficiaryName': "GIFT IWOKURA BALOGUN",
  'amount': "5000",
  'narration': "Payment Flutter",
  'nameEnquirySessionID': "00000000000000000",
  'trackingReference': Random().nextInt(100000).toString(),
  'senderName': "Gift Balogun",
}; //Format for sending data through

String requestRef = Random().nextInt(100000).toString();
```

To get the list of banks with the kudaopenapi

``` dart
import 'package:kudaopenapi/kudaopenapi.dart';

@override
  Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
        appBar: AppBar(title: const Text("Kuda Get Bank API")),
        body: FutureBuilder<BankResponse>(
          future: KudaBank().getBankList(requestRef),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.data!.banks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.list),
                    trailing: Text(
                      snapshot.data!.data!.banks[index].bankCode.toString(),
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text(
                      snapshot.data!.data!.banks[index].bankName.toString(),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator();
          },
        )
      ),
  );
}
```

To get the details of an account

``` dart
import 'package:kudaopenapi/kudaopenapi.dart';

class _MyHomePageState extends State<MyHomePage> {
  var baseurl = '';
  var email = '';
  var apikey = '';

  @override
  void initState() {
    ApiService.initialize(baseurl, email, apikey);
    super.initState();
  }

  String trackingReference = Random().nextInt(100000).toString();

  // Set the request data
  Map<String, dynamic> data = {
    'beneficiaryAccountNumber': '1413800836',
    'beneficiaryBankCode': '000014',
    'SenderTrackingReference': '',
    'isRequestFromVirtualAccount': true,
  };

  String requestRef = Random().nextInt(100000).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kuda Name Inquiry API")),
      body: Center(
        child: FutureBuilder(
          future: KudaBank().name_inquiry(data, requestRef),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var something = snapshot.data.data!;
                return Text('sessionID: ${something.nameInquiry!.sessionID}');
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
```

To get retrieve virtual account details with the kudaopenapi

``` dart
import 'package:kudaopenapi/kudaopenapi.dart';

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("KudaOpenApi-Retrieve")),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            FutureBuilder(
              future: KudaBank().retrieve_virtual_account(data, requestRef),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    var something = snapshot.data.data!;
                    return Column(
                      children: [
                        Text('AccountNumber: ${something!.rvirtualAccount!.accountnumber!}'),
                        Text('Email.: ${something!.rvirtualAccount!.email}'),
                        Text('Phone Number.: ${something!.rvirtualAccount!.phonenumber}'),
                        Text('AccountName.: ${something!.rvirtualAccount!.accountname}'),
                        Text('Fullname.: ${something!.rvirtualAccount!.firstname}'),
                        Text('Tracking Ref.: ${something!.rvirtualAccount!.trackingref}'),
                      ],
                    );
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ]
        ),
      ),
    );
  }
}
```

To get list of GiftCards Offered by Kuda

```dart
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gift Cards')),
      body: FutureBuilder<GiftCardResponse>(
        future: KudaGiftCard().list_gift_cards(requestRef),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
            
          } else if (!snapshot.hasData || snapshot.data!.data.giftItems.isEmpty) {
            return Center(child: Text('No gift cards available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.data.giftItems.length,
              itemBuilder: (context, index) {
                final giftCard = snapshot.data!.data.giftItems[index];
                return ListTile(
                  leading: Image.network(giftCard.image),
                  title: Text(giftCard.package),
                  subtitle: Text('Category: ${giftCard.category}'),
                  trailing: Text(
                    'Country: ${giftCard.countries.length}',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    // Handle gift card item tap
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
```

## :memo: License

This project is under license from MIT. For more details, see the [LICENSE](LICENSE) file.

## Social Presense
Follow me on social media
[Medium](https://medium.com/@giftbalogun)!
[Twitter](https://twitter.com/am_de_one)!
[Instagram](https://www.instagram.com/am_thd_one/)!
[LinkedIn](https://www.linkedin.com/in/gift-balogun-907103160/)!
[Porfolio](https://giftbalogun.name.ng/)!

&#xa0;

<a href="#top">Back to top</a>