package WebSpringMVC.Service.User;

import WebSpringMVC.Dto.ProductsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface ICategoryService {
    @Autowired
    List<ProductsDto> getAllProductsByID(int id);

   // List<ProductsDto> getDataProductPaginate(int id,int start, int totalPage);
}
