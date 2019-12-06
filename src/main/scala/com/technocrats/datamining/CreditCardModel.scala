package com.technocrats.datamining

import com.salesforce.op._
import com.salesforce.op.features._
import com.salesforce.op.features.types._
import com.salesforce.op.stages.impl.classification._
import org.apache.spark.SparkConf
import org.apache.spark.sql.{Encoders, SparkSession}

case class CreditCardData
(
  isFraud: Double,
  p1: Double,
  p2: Double,
  p3: Double,
  p4: Double,
  p5: Double,
  p6: Double,
  p7: Double,
  p8: Double,
  p9: Double,
  p10: Double
)

object CreditCardModel extends App {

  implicit val spark: SparkSession = SparkSession.builder
      .master("local[*]")
      .config(new SparkConf())
      .getOrCreate()

  var creditCard = spark.read.format("csv")
    .option("delimiter",",")
    .option("header", "true")
    .schema(Encoders.product[CreditCardData].schema)
    .load("CreditCardPCAAutoML.csv")

  creditCard = creditCard.drop("TransactionID", "TransactionDT")

  // Extract response and predictor Features
  val (survived, predictors) = FeatureBuilder.fromDataFrame[RealNN](creditCard, response = "isFraud")

//   Automated feature engineering
  val featureVector: FeatureLike[OPVector] = predictors.transmogrify()

  // Automated feature validation and selection
  val checkedFeatures = survived.sanityCheck(featureVector, removeBadFeatures = true)

  // Automated model selection
  val pred = BinaryClassificationModelSelector().setInput(survived, featureVector).getOutput()

  // Setting up a TransmogrifAI workflow and training the model
  val model = new OpWorkflow().setInputDataset(creditCard).setResultFeatures(pred).train()

  println("Model summary:\n" + model.summaryPretty())
}


