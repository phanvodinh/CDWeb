package WebSpringMVC.Controller.Admin;

import WebSpringMVC.Dao.admin.ProductAdmin;
import WebSpringMVC.Dto.ProductsDto;
import WebSpringMVC.Entity.Category;
import WebSpringMVC.Service.Admin.ProductAdminImpl;
import WebSpringMVC.Service.User.HomeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("admin/")
public class ProductAdController {
    @Autowired
    private ProductAdminImpl productAdmin;
    @Autowired
    private ProductAdmin adminDao;
    @Autowired
    private HomeImpl home;

//    @GetMapping("products")
//    public ModelAndView getAll() {
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("listProduct", productAdmin.getAllProduct());
//        mv.setViewName("admin/tableProduct");
//        return mv;
//    }

//    @GetMapping("pro")
//    public ResponseEntity<List<ProductsDto>> checkRestFul() {
//        List<ProductsDto> list = productAdmin.getAllProduct();
//        return ResponseEntity.ok(list);
//    }

    @GetMapping("delProduct/{id}")
    public String deleteProduct(@PathVariable long id) {
        productAdmin.deleteProductByID(id);
        //  return "redirect:/admin/products";
        return null;

    }

    @GetMapping("listProduct")
    public ModelAndView getList() {
        ModelAndView mv = new ModelAndView();
        List<ProductsDto> list = adminDao.getAllProduct();
        List<Category> categoryList = home.getDataCategorys();
        mv.setViewName("admin/tableProduct");
        mv.addObject("lsP", list);
        mv.addObject("lsC", categoryList);
//        mv.addObject("lsImageName", adminDao.nameImage());
//        mv.addObject("getNameImage", adminDao.getNameImage());
//        mv.addObject("getIDImage", adminDao.getIDImage());
//        mv.addObject("lsColor", adminDao.getAllColor());

        return mv;

    }

    @GetMapping("addPro")
    public ModelAndView addPro() {
        ModelAndView mv = new ModelAndView("admin/formAddProduct");
        mv.addObject("lsCate", home.getDataCategorys());

        return mv;
    }

    @PostMapping("addProduct")
    public ModelAndView addProduct(@RequestParam(value = "id_category", required = false) int id_category,
                                   @RequestParam("nameProduct") String nameProduct,
                                   @RequestParam("price") double price,
                                   @RequestParam("title") String title,
                                   @RequestParam("detail") String detail,
                                   @RequestParam("status") String status,
                                   @RequestParam("ImageUpload") MultipartFile file) throws IOException {
        productAdmin.addProduct(id_category, nameProduct, price, title, detail, status);
        productAdmin.addImage(file);

        return new ModelAndView("admin/formAddProduct");
    }

    @GetMapping("editProduct/{id}")
    public ModelAndView edit(@PathVariable long id) {
        ModelAndView mv = new ModelAndView("admin/edit/editProduct");
        mv.addObject("product", productAdmin.getProductByID(id));
        mv.addObject("lsCate", home.getDataCategorys());
        return mv;
    }

    @PostMapping("listProduct/{id}/update")
    public String updateProduct(@PathVariable long id, @RequestParam int id_category, @RequestParam String name,
                                @RequestParam double price, @RequestParam String status) {
        ProductsDto dto = new ProductsDto();
        dto.setId_product(id);
        dto.setId_category(id_category);
        dto.setName(name);
        dto.setPrice(price);
        dto.setStatus(status);
        productAdmin.updateProduct(dto);
        return "redirect:/admin/listProduct";
    }
}
