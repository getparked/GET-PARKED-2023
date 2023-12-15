import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:io';

Future<List<bool>> GetParkingData(String authorization) async {
  //Function for getting parking data from tago.io and converting to booleon string
  try {
    String url =
        "https://api.tago.io/data?variable=payload&query=last_value"; //this url also encodes which specific data we would like with the ?variable&query
    final response = await http.get(Uri.parse(url),
        //uses http.get to recieve parking data and uses uri to create objects from a string
        headers: {
          HttpHeaders.authorizationHeader:
          authorization,
          //device specific password required by tago.io
        });
    //print(response.body); //for testing
    if (response.statusCode == 200) {
      //if we recieve a valid response

      // Parse JSON and extract payload
      Map<String, dynamic> jsonResponse =
      json.decode(response.body); //map the contents of the string

      if (jsonResponse.containsKey("result") && //is this what we expected?
          jsonResponse["result"] is List &&
          jsonResponse["result"].isNotEmpty) {
        String hexPayload = jsonResponse["result"][0][
        "value"];
        //print(hexPayload);//we recieve a 'result' that has a 'value' we want the first one of that
        String binaryString = hexToBinary(
            hexPayload); //converts to a string of 1's and 0's from hex
        List<bool> realBinary = convertToBinary(
            binaryString); //converts the string to booleon equivilant

        // Set the payload to the state variable

        // Return the payload

        return realBinary;
      } else {
        print("else");
        throw Exception('No valid result in the response');
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print(e);
    throw e; // Rethrow the exception to handle it in the UI
  }
}


List<bool> convertToBinary(String stringPayload) {
  List<bool> updatedList = [true, false];
  updatedList = stringPayload //create list of type bool
      .split('') //split the string in to individual characters
      .map((char) => char == '1') //asks if char = 1 and
      .toList(); //if yes map that value to the list


  return updatedList;
}

String hexToBinary(String hex) {
  // Convert hexadecimal string to binary
  String binaryString = BigInt.parse(hex, radix: 16).toRadixString(2);

  // Calculate the number of leading zeros to pad
  int numLeadingZeros = hex.length * 4 - binaryString.length;

  // Pad with leading zeros
  String paddedBinaryString = '0' * numLeadingZeros + binaryString;

  return paddedBinaryString;
}

