package WebSpringMVC.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController extends BaseController {


    @RequestMapping(value = {"/", "/trang-chu"})
    public ModelAndView index() {
        //    ModelAndView mv = new ModelAndView("user/index");
        mvShare.addObject("slides", _home.getDataSlides());
        mvShare.addObject("categorys", _home.getDataCategorys());
        mvShare.addObject("products", _home.getDataProducts());
        mvShare.setViewName("user/index");
       // mvShare.setViewName("user/cart/list_cart");
        return mvShare;
    }

    @RequestMapping(value = {"/quan-tri/product"})
    public ModelAndView product() {
     //   ModelAndView mv = new ModelAndView("user/products/product");
        ModelAndView mv = new ModelAndView("admin/index");
        return mv;
    }
}
