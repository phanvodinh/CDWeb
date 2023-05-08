package WebSpringMVC.Controller.Admin;


import WebSpringMVC.Entity.Category;
import WebSpringMVC.Service.User.HomeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("admin/")
public class Test {
    @Autowired
    HomeImpl home;
//    @Autowired
//    CateRepo repo;

    //    @GetMapping("admin/index")
//    public ModelAndView index() {
//
//        return new ModelAndView("admin/tableProduct");
//    }
//
//    @GetMapping("admin/order")
//    public ModelAndView order() {
//        return new ModelAndView("admin/tableOrder");
//    }
//
//    @GetMapping("admin/main")
//    public ModelAndView mainAdmin() {
//        return new ModelAndView("admin/mainAdmin");
//    }
//
    @GetMapping("category")
    public ModelAndView cate() {
        ModelAndView mv = new ModelAndView("admin/tableCategory");
        List<Category> list = home.getDataCategorys();
//        List<Category> list = repo.findAll();
        mv.addObject("lsCate", list);
        return mv;
        //   return new ModelAndView("admin/tableCategory");
    }

    @GetMapping ("deleteCate/{id}")
    public String delete(@PathVariable int id) {
        ModelAndView mv = new ModelAndView("admin/tableCategory");
        home.delete(id);
//        List<Category> list = home.getDataCategorys();
//        mv.addObject("lsCate", list);
//        return mv;
        return "admin/tableCategory";
    }
}
