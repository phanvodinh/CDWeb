package WebSpringMVC.Controller.User;

import WebSpringMVC.Service.User.HomeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;

@Controller
public class BaseController {
    @Autowired
    HomeImpl _home;// day la HomeServiceImpl trong youtube
    ModelAndView mvShare = new ModelAndView();

    @PostConstruct// giúp khởi chạy thì chạy method init() đầu tiên
    public ModelAndView init() {
        mvShare.addObject("menus", _home.getDataMenu());
        return mvShare;
    }


}
