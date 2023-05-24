package WebSpringMVC.Service.Admin;

import WebSpringMVC.Dao.ProductDao;
import WebSpringMVC.Dao.admin.ProductAdmin;
import WebSpringMVC.Dto.ProductsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class ProductAdminImpl implements IAdProduct {
    @Autowired
    private ProductDao productDao;//product bên user
    @Autowired
    private ProductAdmin productAdmin;// product bên admin

    @Override
    public List<ProductsDto> getAllProduct() {
        return productDao.getAllProduct();
    }

    @Override
    public void deleteProductByID(long id) {
        productAdmin.deleteProductByID(id);
    }

    @Override
    public void addProduct(int idCate, String name, double price, String title, String detail, String status) {
        productAdmin.addProduct(idCate, name, price, title, detail, status);
    }

    @Override
    public void addImage(MultipartFile file) {
        productAdmin.addImage(file);
    }

    @Override
    public ProductsDto getProductByID(long id) {
        return productAdmin.getProductByID(id);
    }

    @Override
    public void updateProduct(ProductsDto product) {
        productAdmin.updateProduct(product);
    }
}
