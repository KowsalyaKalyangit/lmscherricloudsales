// To parse this JSON data, do
//
//     final proposalTravelAmtModel = proposalTravelAmtModelFromJson(jsonString);

import 'dart:convert';

ProposalTravelAmtModel proposalTravelAmtModelFromJson(String str) => ProposalTravelAmtModel.fromJson(json.decode(str));

String proposalTravelAmtModelToJson(ProposalTravelAmtModel data) => json.encode(data.toJson());

class ProposalTravelAmtModel {
    int success;
    String status;
    String message;
    String from;
    List<Datum> data;

    ProposalTravelAmtModel({
        required this.success,
        required this.status,
        required this.message,
        required this.from,
        required this.data,
    });

    factory ProposalTravelAmtModel.fromJson(Map<String, dynamic> json) => ProposalTravelAmtModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        from: json["From"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "From": from,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String travelid;
    int stop;
    String stopid;
    int opening;
    String openingid;
    int subtotal;
    int taxamount;
    int total;

    Datum({
        required this.travelid,
        required this.stop,
        required this.stopid,
        required this.opening,
        required this.openingid,
        required this.subtotal,
        required this.taxamount,
        required this.total,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        travelid: json["travelid"],
        stop: json["stop"],
        stopid: json["stopid"],
        opening: json["opening"],
        openingid: json["openingid"],
        subtotal: json["subtotal"],
        taxamount: json["taxamount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "travelid": travelid,
        "stop": stop,
        "stopid": stopid,
        "opening": opening,
        "openingid": openingid,
        "subtotal": subtotal,
        "taxamount": taxamount,
        "total": total,
    };
}
