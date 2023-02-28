package WebSpringMVC.Service.User;

import WebSpringMVC.Dao.ProductDao;
import WebSpringMVC.Dto.ProductsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductsImpl implements IProducts {
    @Autowired
    private ProductDao productDao;


    public ProductsDto getProductByID(long id) {
        return productDao.getProductByID(id).get(0);
    }

    @Override
    public List<ProductsDto> getSomeProductByCategoryID(int id) {
        return productDao.getAllProductsByID(id);
    }
}
