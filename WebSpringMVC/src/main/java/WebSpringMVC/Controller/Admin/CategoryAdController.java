package WebSpringMVC.Controller.Admin;


import WebSpringMVC.Entity.Category;
import WebSpringMVC.Service.User.HomeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("admin/")
public class CategoryAdController {
    @Autowired
    HomeImpl home;


//    @GetMapping("order")
//    public ModelAndView index() {
//
//        return new ModelAndView("admin/tableProduct");
//    }



    @GetMapping("main")
    public ModelAndView mainAdmin() {
        return new ModelAndView("admin/mainAdmin");
    }

    @GetMapping("AddCate")
    public String addCate() {
        //  ModelAndView mv = new ModelAndView("admin/tableCategory");
        return "admin/formAddCategory";
    }

    @PostMapping("addCategory")
    public String add(@ModelAttribute("category") Category category) {
        home.saveCate(category);
        return "admin/formAddCategory";
    }

    @GetMapping("category")
    public ModelAndView cate() {
        ModelAndView mv = new ModelAndView("admin/tableCategory");
        List<Category> list = home.getDataCategorys();
//        List<Category> list = repo.findAll();
        mv.addObject("lsCate", list);
        //    mv.addObject("cateSingle", home.getCategoryById(id));
        return mv;

    }

    @GetMapping("deleteCate/{id}")
    public String delete(@PathVariable int id) {
        ModelAndView mv = new ModelAndView("admin/tableCategory");
        home.delete(id);
        return "redirect:/admin/category";
    }

    @GetMapping("category/{id}/editCate")
    public String getCategoryById(@PathVariable int id, Model model) {
        Category category = home.getCategoryById(id);
        model.addAttribute("category", category);
        return "admin/edit/editCategory";
    }

    @PostMapping("category/{id}/editCate")
    public String updateCategory(@PathVariable int id, @RequestParam String name, @RequestParam String description) {
        Category category = new Category();
        category.setId(id);
        category.setName(name);
        category.setDescription(description);
        home.updateCategory(category);
        return "redirect:/admin/category";
    }
}
