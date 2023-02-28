package WebSpringMVC.Controller.User;

import WebSpringMVC.Service.User.ProductsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController extends BaseController {
    @Autowired
    ProductsImpl products;

    @RequestMapping(value = {"chi-tiet/{id}"})
    public ModelAndView product(@PathVariable long id) {
        mvShare.addObject("detailProduct", products.getProductByID(id));
        int IDCategory = products.getProductByID(id).getId_category();
        mvShare.addObject("someProductByCategoryID", products.getSomeProductByCategoryID(IDCategory));
        mvShare.addObject("categorys", _home.getDataCategorys());

        mvShare.setViewName("user/products/product");
        return mvShare;
    }

}
