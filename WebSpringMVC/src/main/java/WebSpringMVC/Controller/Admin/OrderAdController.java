package WebSpringMVC.Controller.Admin;

import WebSpringMVC.Service.Admin.OrderAdminImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("admin/")
public class OrderAdController {
    @Autowired
    private OrderAdminImpl orderImpl;

    @GetMapping("order")
    public ModelAndView order() {

        ModelAndView mv = new ModelAndView("admin/tableOrder");
        mv.addObject("lsOrder", orderImpl.getAllOrder());
        return mv;
    }

    @GetMapping("deleteOrder/{id}")
    public String deleteOrder(@PathVariable long id) {
        orderImpl.deleteOrder(id);
        return "redirect:/admin/order";
    }
}
