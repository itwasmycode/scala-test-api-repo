import java.util.{ Map => JavaMap }
import com.amazonaws.lambda.thirdparty.com.google.gson.GsonBuilder
import com.amazonaws.services.lambda.runtime.{Context, RequestHandler}


object LambdaHandler {
  def lambdaHandler(args: Array[String]) = {
    println("Hello, world")
  }
}
