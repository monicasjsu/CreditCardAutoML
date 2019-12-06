# Online transaction fraud precition AutoML

## Prerequisites

- Java 1.8
- Scala 2.11.12
- Spark 2.3.2
- IntelliJ Idea 2017+ recommended
- TransmogrifAI 0.5.2


## Structure

The primary build file is in `build.gradle`.
This file defines dependencies on Scala, Spark, and TransmogrifAI, and also defines how the project will be built
and deployed.

The primary sources for your project live in `src/main/scala`.
The spark application that you should run whenever you want to train/score/evaluate/etc. is the Online fraud detection.
file in `src/main/scala/com/technocrats/datamining`.
Definitions for your features should reside in `src/main/scala/com/technocrats/datamining` as a case class, while the code that defines
where to get feature data from, what models to use, and any evaluation metrics lives in the application file.

## Workflow

You can run build commands by running `./gradlew` in this directory. Make sure that you have Spark installed, and that your
`SPARK_HOME` environment variable set to where you installed Spark.

### Building
To build the project, run `./gradlew build`. This will compile your sources and tell you of any compile errors.

### Training

Note: this platform runs on Spark, so you must download Spark 2.3.2 (prebuilt against hadoop 2.7), unpack and export `SPARK_HOME` before trying to run.

To train your project, run

```
./gradlew -q sparkSubmit -Dmain=com.technocrats.datamining.CreditCardModel -Dargs="--run-type=train --model-location /Users/moni/projects/creditcard-autoML/build/spark/model \
--read-location CreditCardModel=/Users/moni/projects/creditcard-autoML/CreditCardPCAAutoML.csv"
```

## Read More

- [TransmogrifAI](https://github.com/salesforce/TransmogrifAI)
- [Docs](https://docs.transmogrif.ai)
- [Hello World examples](https://github.com/salesforce/TransmogrifAI/tree/master/helloworld)
