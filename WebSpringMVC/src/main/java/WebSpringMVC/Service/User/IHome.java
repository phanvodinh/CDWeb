package WebSpringMVC.Service.User;

import WebSpringMVC.Dto.ProductsDto;
import WebSpringMVC.Entity.Category;
import WebSpringMVC.Entity.Menus;
import WebSpringMVC.Entity.Slides;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IHome {
    @Autowired
    List<Slides> getDataSlides();

    @Autowired
    List<Category> getDataCategorys();

    @Autowired
    List<Menus> getDataMenu();

    @Autowired
    List<ProductsDto> getDataProducts();

}
