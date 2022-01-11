import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_market/models/models.dart';
import 'package:http/http.dart' as http;

part 'user_service.dart';
part 'food_service.dart';
part 'transaction_service.dart';

String baseURL = 'http://192.168.19.100:8000/api';