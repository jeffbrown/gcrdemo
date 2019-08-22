package gcrdemo;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;

@Controller("/greeting")
public class GreetingController {

    @Get("/{name}")
    public String index(String name) {
        return "Hello " + name;
    }
}