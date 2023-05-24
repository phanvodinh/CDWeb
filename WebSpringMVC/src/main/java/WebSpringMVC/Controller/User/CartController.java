package WebSpringMVC.Controller.User;

import WebSpringMVC.Dto.CartDto;
import WebSpringMVC.Entity.Bills;
import WebSpringMVC.Entity.User;
import WebSpringMVC.Service.User.BillsImpl;
import WebSpringMVC.Service.User.CartImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


@Controller
@SessionAttributes("Cart")
public class CartController extends BaseController {
    @Autowired
    private CartImpl cartService = new CartImpl();
    @Autowired
    private BillsImpl billsService = new BillsImpl();

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

    @GetMapping("checkout")
    public ModelAndView checkout(HttpServletRequest request, HttpSession session) {
        mvShare.setViewName("user/bills/checkout");
        Bills bills = new Bills();
        User loginInfo = (User) session.getAttribute("loginInfo");
        if (loginInfo != null) {

            bills.setAddress(loginInfo.getAddress());
            bills.setDisplay_name(loginInfo.getDisplayName());
            bills.setUser(loginInfo.getUser());
        }
        mvShare.addObject("bills", bills);
        return mvShare;
    }

    @PostMapping("checkout")
    public String checkOutBills(HttpServletRequest request, HttpSession session, @ModelAttribute("bills") Bills bills) {
        bills.setQuantity((int) session.getAttribute("totalCartQuantity"));
        bills.setTotal((double) session.getAttribute("totalCartPrice"));
        if (billsService.addBill(bills) > 0) {
            HashMap<Long, CartDto> carts = (HashMap<Long, CartDto>) session.getAttribute("Cart");
            billsService.addBillDetail(carts);
        }
        session.removeAttribute("Cart");
        return "redirect:gio-hang";
    }
}
