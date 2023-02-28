package WebSpringMVC.Service.User;

import WebSpringMVC.Dto.ProductsDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IProducts {
  ProductsDto getProductByID(long id);

  List<ProductsDto>getSomeProductByCategoryID(int id);
}
