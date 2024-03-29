package WebSpringMVC.Controller.User;

import WebSpringMVC.Dto.CartDto;
import WebSpringMVC.Service.User.CartImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


@Controller
@SessionAttributes("Cart")
public class CartController extends BaseController {
    @Autowired
    private CartImpl cartService = new CartImpl();

    @RequestMapping(value = "gio-hang")
    public ModelAndView index() {
        //    ModelAndView mv = new ModelAndView("user/index");
        mvShare.addObject("slides", _home.getDataSlides());
        mvShare.addObject("categorys", _home.getDataCategorys());
        mvShare.addObject("products", _home.getDataProducts());
        // mvShare.setViewName("user/index");
        mvShare.setViewName("user/cart/list_cart");
        return mvShare;
    }

    @RequestMapping(value = "addcart/{id}")
    public String addCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
        HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
        if (cart == null) {
            cart = new HashMap<Long, CartDto>();
        }
        cart = cartService.addCart(id, cart);
        session.setAttribute("Cart", cart);
        session.setAttribute("totalCartQuantity", cartService.totalQuantity(cart));
        session.setAttribute("totalCartPrice", cartService.totalPrice(cart));

        //  return "redirect:/chi-tiet/" + id;
        return "redirect:" + request.getHeader("Referer");
    }

    @RequestMapping(value = "editcart/{id}/{quantity}")
    public String editCart(HttpServletRequest request, HttpSession session, @PathVariable long id, @PathVariable int quantity) {
        HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
        if (cart == null) {
            cart = new HashMap<Long, CartDto>();
        }
        cart = cartService.editCart(id, quantity, cart);
        session.setAttribute("Cart", cart);
        session.setAttribute("totalCartQuantity", cartService.totalQuantity(cart));
        session.setAttribute("totalCartPrice", cartService.totalPrice(cart));

        //  return "redirect:/chi-tiet/" + id;
        return "redirect:" + request.getHeader("Referer");
    }

    @RequestMapping(value = "deletecart/{id}")
    public String deleteCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
        HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
        if (cart == null) {
            cart = new HashMap<Long, CartDto>();
        }
        cart = cartService.deleteCart(id, cart);
        session.setAttribute("Cart", cart);
        session.setAttribute("totalCartQuantity", cartService.totalQuantity(cart));
        session.setAttribute("totalCartPrice", cartService.totalPrice(cart));

        //  return "redirect:/chi-tiet/" + id;
        return "redirect:" + request.getHeader("Referer");
    }
}
