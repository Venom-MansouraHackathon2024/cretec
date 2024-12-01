// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyRequestModel _$SurveyRequestModelFromJson(Map<String, dynamic> json) =>
    SurveyRequestModel(
      cement: (json['Cement'] as num).toInt(),
      blastFurnaceSlag: (json['Blast Furnace Slag'] as num).toInt(),
      fineAggregate: (json['Fine Aggregate'] as num).toInt(),
      flyAsh: (json['Fly Ash'] as num).toDouble(),
      water: (json['Water'] as num).toInt(),
      coarseAggregate: (json['Coarse Aggregate'] as num).toInt(),
      superplasticizer: (json['Superplasticizer'] as num).toInt(),
      age: (json['Age (day)'] as num).toInt(),
    );

Map<String, dynamic> _$SurveyRequestModelToJson(SurveyRequestModel instance) =>
    <String, dynamic>{
      'Cement': instance.cement,
      'Blast Furnace Slag': instance.blastFurnaceSlag,
      'Fly Ash': instance.flyAsh,
      'Water': instance.water,
      'Superplasticizer': instance.superplasticizer,
      'Coarse Aggregate': instance.coarseAggregate,
      'Fine Aggregate': instance.fineAggregate,
      'Age (day)': instance.age,
    };
