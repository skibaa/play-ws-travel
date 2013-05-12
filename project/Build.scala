import sbt._
import Keys._
import play.Project._

object ApplicationBuild extends Build {

  val appName         = "play-travel"
  val appVersion      = "1.0-SNAPSHOT"

  val appDependencies = Seq(
    // Add your project dependencies here,
    javaCore,
    javaJdbc,
    //javaEbean
    javaJpa,
    "org.hibernate" % "hibernate-entitymanager" % "3.6.9.Final",
    "org.springframework" % "spring-asm" % "3.1.2.RELEASE",
    "org.springframework" % "spring-context" % "3.1.2.RELEASE"
  )


  val main = play.Project(appName, appVersion, appDependencies).settings(
    ebeanEnabled := false
  )

}
