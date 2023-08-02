import Dependencies._

// Define the Scala version and project information
ThisBuild / scalaVersion     := "2.13.5"
ThisBuild / version          := "0.1.0"
ThisBuild / organization     := ""
ThisBuild / organizationName := ""

// Add the AWS Lambda SDK dependency
lazy val root = (project in file("."))
  .settings(
    name := "scala-test-api-repo",
    libraryDependencies ++= Seq(
      // Add other dependencies here
      "com.amazonaws" % "aws-lambda-java-core" % "1.2.1"
    )
  )
