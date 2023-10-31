import 'dart:io';

import 'package:cursin/ad_ids.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// This example demonstrates anchored adaptive banner ads.
class AnchoredAdaptiveExample extends StatefulWidget {
  @override
  _AnchoredAdaptiveExampleState createState() =>
      _AnchoredAdaptiveExampleState();
}

class _AnchoredAdaptiveExampleState extends State<AnchoredAdaptiveExample> {
  BannerAd? _anchoredAdaptiveAd;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  Future<void> _loadAd() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

      adCursin ads = adCursin();

    _anchoredAdaptiveAd = BannerAd(
      // TODO: replace these test ad units with your own ad unit.
      adUnitId:  ads.banner,
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$ad loaded: ${ad.responseInfo}');
          setState(() {
            // When the ad is loaded, get the ad size and use it to set
            // the height of the ad container.
            _anchoredAdaptiveAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Anchored adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    return _anchoredAdaptiveAd!.load();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Anchored adaptive banner example'),
        ),
        body: Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemBuilder: (context, index) {
                    return Text(
                      'Placeholder text',
                      style: TextStyle(fontSize: 24),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(height: 40);
                  },
                  itemCount: 20),
              if (_anchoredAdaptiveAd != null && _isLoaded)
                Container(
                  color: Colors.green,
                  width: _anchoredAdaptiveAd!.size.width.toDouble(),
                  height: _anchoredAdaptiveAd!.size.height.toDouble(),
                  child: AdWidget(ad: _anchoredAdaptiveAd!),
                )
            ],
          ),
        ),
      );

  @override
  void dispose() {
    super.dispose();
    _anchoredAdaptiveAd?.dispose();
  }
}
