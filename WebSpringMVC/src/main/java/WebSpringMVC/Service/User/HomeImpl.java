package WebSpringMVC.Service.User;

import WebSpringMVC.Dao.CategoryDao;
import WebSpringMVC.Dao.MenuDao;
import WebSpringMVC.Dao.ProductDao;
import WebSpringMVC.Dao.SlidesDao;
import WebSpringMVC.Dto.ProductsDto;
import WebSpringMVC.Entity.Category;
import WebSpringMVC.Entity.Menus;
import WebSpringMVC.Entity.Slides;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeImpl implements IHome {
    @Autowired
    private SlidesDao slidesDao;
    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private MenuDao menuDao;
    @Autowired
    private ProductDao productDao;

    @Override
    public List<Slides> getDataSlides() {
        return slidesDao.getDataSlides();
    }

    @Override
    public List<Category> getDataCategorys() {
        return categoryDao.getDataCategorys();
    }

    @Override
    public List<Menus> getDataMenu() {
        return menuDao.getDataMenu();
    }

    @Override
    public List<ProductsDto> getDataProducts() {
        return productDao.getProducts();
    }

    @Override
    public void delete(int id) {
        categoryDao.delete(id);
    }

    @Override
    public void saveCate(Category category) {
        categoryDao.saveCate(category);
    }

    @Override
    public void updateCategory(Category category) {
        categoryDao.updateCategory(category);
    }

    @Override
    public Category getCategoryById(int id) {
        return categoryDao.getCategoryById(id);
    }


}
