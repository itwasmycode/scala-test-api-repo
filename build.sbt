import Dependencies._

ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.13.11"

lazy val root = (project in file("."))
  .settings(
    name := "scala-auth-backend-test-1",
    libraryDependencies ++= Seq(
      lambdaRuntimeInterfaceClient,
      scalaTest % Test
    )
  )
