package WebSpringMVC.Service.Admin;

import WebSpringMVC.Dto.ProductsDto;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public interface IAdProduct {
    List<ProductsDto> getAllProduct();

    void deleteProductByID(long id);

    void addProduct(int idCate, String name, double price, String title, String detail, String status);

    void addImage(MultipartFile file);

    ProductsDto getProductByID(long id);

    void updateProduct(ProductsDto product);
}
