package WebSpringMVC.Controller.User;

import WebSpringMVC.Entity.User;
import WebSpringMVC.Service.User.AccountImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//@RequestMapping(value = "/account")
@Controller
public class UserController extends BaseController {
    @Autowired
    AccountImpl account = new AccountImpl();

    @RequestMapping(value = {"/dang-ky"}, method = RequestMethod.GET)
    public ModelAndView loginAcc() {
        mvShare.addObject("signup", new User());
        mvShare.setViewName("user/account/register");
        return mvShare;
    }


    @RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
    public ModelAndView createAcc(@ModelAttribute("signup") User user) {
        int count = account.addAccount(user);
        if (count > 0) {
            mvShare.addObject("status", "đăng ký thành công");

        } else {
            mvShare.addObject("status", "đăng ký thất bại");

        }

        mvShare.setViewName("user/account/register");
        return mvShare;
    }

    @RequestMapping(value = "/dang-nhap", method = RequestMethod.POST)
    public ModelAndView login(HttpSession session, @ModelAttribute("signup") User user) {
        mvShare.setViewName("user/account/register");
        user = account.checkAccount(user);
        if (user != null) {
            //  mvShare.addObject("statuslogin", "đăng nhập thành công");
            mvShare.setViewName("redirect:trang-chu");
            session.setAttribute("loginInfo", user);
        }
        mvShare.addObject("statuslogin", "đăng nhập thất bại");


        return mvShare;
    }

    @RequestMapping(value = "/dang-xuat", method = RequestMethod.GET)
    public String logOut(HttpSession session, HttpServletRequest request) {
        session.removeAttribute("loginInfo");
        return "redirect:" + request.getHeader("Referer");

    }
}
