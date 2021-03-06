import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:membership_card/pages/all_cards.dart';


/// This is the class defining all the card info
/// It is generally used in [AllCardsState] and [AllCardsPage]
/// [CardInfo] CONSTRUCTOR ORDER is {[_cardId], [_cardType], [_remark]}
/// ```dart
/// // This is the basic CardInfo constructing method
/// // ATTENTION for the order of the constructor params!!!
/// CardInfo cardInfo = CardInfo(cardId, cardType, remark);
/// ```
///
/// Moreover, you can create one CardInfo using [Map] created by [JsonDecoder]
/// ```dart
/// var jsonDecoder = JsonDecoder();
/// CardInfo cardInfo = CardInfo.fromJson(jsonDecoder.convert(jsonInput));
/// ```
class CardInfo extends ChangeNotifier{
  static const String CARD_ID_JSON   = "cardId";
  static const String CARD_TYPE_JSON = "kind";
  static const String REMARK_JSON    = "remark";

  String _cardId;
  String _cardType;
  String _remark;
  bool _isChosen = false;
  Key _cardKey = UniqueKey();

  String get cardId => _cardId;
  String get cardType => _cardType;
  String get remark => _remark;
  Key get cardKey => _cardKey;

  CardInfo([this._cardId, this._cardType, this._remark]);

  CardInfo.fromJson(Map<String, dynamic> json) {
    this._cardId = json[CARD_ID_JSON];
    this._cardType = json[CARD_TYPE_JSON];
    this._remark = json[REMARK_JSON];
  }

  factory CardInfo.getJson(Map<String, dynamic> json) {
    return CardInfo(json[CARD_ID_JSON], json[REMARK_JSON], json[CARD_TYPE_JSON]);
  }

  Map<String, dynamic> toJson() => {
    CARD_ID_JSON   : cardId,
    CARD_TYPE_JSON : cardType,
    REMARK_JSON    : remark,
  };

  // getter and setter for isChosen
  bool get isChosen => this._isChosen;
  set isChosen(bool isChosen) => this._isChosen = isChosen;

  void chooseOrNotChoose() {
    _isChosen = _isChosen? false : true;
  }
}