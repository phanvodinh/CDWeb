package WebSpringMVC.Controller.User;

import WebSpringMVC.Dto.PaginateDto;
import WebSpringMVC.Service.User.CategoryImpl;
import WebSpringMVC.Service.User.PaginateImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryController extends BaseController {
    @Autowired
    private CategoryImpl category;
    @Autowired
    private PaginateImpl paginate;
    private final int totalProductsOnOnePage = 9;

    @RequestMapping(value = "/san-pham/{id}")
    public ModelAndView category(@PathVariable String id) {
        mvShare.setViewName("user/products/category");
        int totalData = category.getAllProductsByID(Integer.parseInt(id)).size();
        PaginateDto paginateInfo = paginate.getInfoPaginate(totalData, totalProductsOnOnePage, 1);// lấy ra danh sách sản phẩm bắt đầu từ page 1
        mvShare.addObject("paginateInfo", paginateInfo);
        mvShare.addObject("idCategory", id);
        mvShare.addObject("productsPaginate", category.getDataProductPaginate(Integer.parseInt(id), paginateInfo.getStart(), totalProductsOnOnePage));

        return mvShare;
    }

    @RequestMapping(value = "/san-pham/{id}/{currentPage}")
    public ModelAndView category(@PathVariable String id, @PathVariable int currentPage) {
        mvShare.setViewName("user/products/category");
        int totalData = category.getAllProductsByID(Integer.parseInt(id)).size();
        PaginateDto paginateInfo = paginate.getInfoPaginate(totalData, totalProductsOnOnePage, currentPage);
        mvShare.addObject("paginateInfo", paginateInfo);
        mvShare.addObject("idCategory", id);
        mvShare.addObject("productsPaginate", category.getDataProductPaginate(Integer.parseInt(id), paginateInfo.getStart(), totalProductsOnOnePage));

        return mvShare;
    }


}
