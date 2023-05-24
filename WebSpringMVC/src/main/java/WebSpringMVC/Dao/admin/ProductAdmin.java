package WebSpringMVC.Dao.admin;

import WebSpringMVC.Dao.BaseDao;
import WebSpringMVC.Dto.ProductsDto;
import WebSpringMVC.Entity.Color;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
@Transactional
public class ProductAdmin extends BaseDao {


    public void deleteProductByID(long id) {
        String sql = "DELETE FROM `products` WHERE id = ?";
        Object[] args = {id};
        template.update(sql, args);
    }

    public List<ProductsDto> getAllProduct() {

        String sql = "SELECT p.id, p.id_category, p.name, p.price, cl.img, p.status FROM products p JOIN colors cl on p.id= cl.id_product JOIN categorys c on p.id_category=c.id ";
        // return template.query(sql, getRow());
        return template.query(sql, new RowMapper<ProductsDto>() {
            @Override
            public ProductsDto mapRow(ResultSet rs, int rowNum) throws SQLException {
                ProductsDto productsDto = new ProductsDto();
                productsDto.setId_product(rs.getLong("p.id"));
                productsDto.setId_category(rs.getInt("p.id_category"));
                productsDto.setPrice(rs.getDouble("p.price"));
                productsDto.setName(rs.getString("p.name"));
                productsDto.setImg(rs.getString("cl.img"));
                productsDto.setStatus(rs.getString("p.status"));
                return productsDto;
            }
        });

    }

//    public List<Color> getAllColor() {
//        String sql = "SELECT * FROM colors";
//        return template.query(sql, getRowColor());
//
//    }
//
//    public List<ProductsDto> nameImage() {
//        String sql = "SELECT c.img FROM products p JOIN colors c ON p.id = c.id_product";
//        return template.query(sql, getRow());
//    }
//
//    public List<String> getNameImage() {
//        List<String> ls = new ArrayList<>();
//
//        for (ProductsDto p : nameImage()) {
//            ls.add(p.getImg());
//            return ls;
//        }
//        return null;
//    }
//
//    public List<Long> getIDImage() {
//        List<Long> ls = new ArrayList<>();
//        for (ProductsDto p : nameImage()) {
//            ls.add(p.getId_product());
//            return ls;
//        }
//        return null;
//    }

    public void addProduct(int idCate, String name, double price, String title, String detail, String status) {
        String sql = "insert into products (id_category,name, price,title,details,status) values (?,?,?,?,?,?) ";
        template.update(sql, idCate, name, price, title, detail, status);

    }

    public void addImage(MultipartFile file) {

        try {
            String imageName = file.getOriginalFilename();
            String imagePath = "../webapp/assets/user/img/" + imageName;
            File imageFile = new File(imagePath);
            file.transferTo(imageFile);

            long max = getMaxIDProduct();


            String sql1 = "SELECT COUNT(*) FROM products WHERE id = ?";
            long count = template.queryForObject(sql1, new Object[]{max}, Long.class);

            if (count > 0) {
                String sql = " INSERT INTO colors (id_product,img) VALUES (?,?)";
                template.update(sql, getMaxIDProduct(), imageName);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }

    public long getMaxIDProduct() {
        String sql = "SELECT MAX(id) FROM products";
        return template.queryForObject(sql, Long.class);
    }

    public ProductsDto getProductByID(long id) {
        String sql = " SELECT p.id, p.id_category, p.name, p.price,p.status FROM products p WHERE p.id = ?";
        //String sql = " SELECT *  FROM products p WHERE p.id = ?";
        // return template.queryForObject(sql, new Object[]{id}, getRow());
        return template.queryForObject(sql, new Object[]{id}, new RowMapper<ProductsDto>() {
            @Override
            public ProductsDto mapRow(ResultSet rs, int rowNum) throws SQLException {
                ProductsDto productsDto = new ProductsDto();
                productsDto.setId_product(rs.getLong("p.id"));
                productsDto.setId_category(rs.getInt("p.id_category"));
                productsDto.setName(rs.getString("p.name"));
                productsDto.setPrice(rs.getDouble("p.price"));
                productsDto.setStatus(rs.getString("p.status"));
                return productsDto;
            }
        });

    }

    public void updateProduct(ProductsDto product) {
        String sql = "UPDATE products SET id_category = ?,name = ?, price = ?, status = ? WHERE id = ?";
        template.update(sql, product.getId_category(), product.getName(),
                product.getPrice(), product.getStatus(), product.getId_product());
    }

    private RowMapper<ProductsDto> getRow() {
        return new BeanPropertyRowMapper<ProductsDto>(ProductsDto.class);
    }

    private RowMapper<Color> getRowColor() {
        return new BeanPropertyRowMapper<Color>(Color.class);
    }
}
