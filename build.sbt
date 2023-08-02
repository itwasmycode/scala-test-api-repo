lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization    := "com.example",
      scalaVersion    := "2.12.2"
    )),
    name := "hello-world",
    libraryDependencies ++= Seq(
      "org.scalatest"     %% "scalatest"         % "3.2.15"         % Test
    )
  )
enablePlugins(JavaAppPackaging)
enablePlugins(DockerPlugin)

mainClass in Compile := Some("Main")
