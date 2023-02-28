package WebSpringMVC.Service.User;

import WebSpringMVC.Dao.ProductDao;
import WebSpringMVC.Dto.ProductsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryImpl implements ICategoryService {
    @Autowired
    private ProductDao productDao;

    @Override
    public List<ProductsDto> getAllProductsByID(int id) {
        return productDao.getAllProductsByID(id);
    }

    public List<ProductsDto> getDataProductPaginate(int id, int start, int totalPage) {
        return productDao.getProductsPaginate(id, start, totalPage);
    }
}
