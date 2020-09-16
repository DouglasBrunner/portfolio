package name.douglasbrunner.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.HashMap;

@RestController
@RequestMapping("/")
public class RootControllers {

    @RequestMapping(value="", method= RequestMethod.GET)
    public ModelAndView landing(Principal principal) {
        System.out.println("the landing was hit");
        return new ModelAndView("landing", new HashMap<String, Object>() {{
            put("principal", principal);
        }});
    }

}