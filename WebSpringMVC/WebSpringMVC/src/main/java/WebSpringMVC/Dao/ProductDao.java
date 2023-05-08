package WebSpringMVC.Dao;

import WebSpringMVC.Dto.ProductsDto;
import WebSpringMVC.Dto.ProductsDtoMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
public class ProductDao extends BaseDao {
    private final boolean NEWPRODUCT = false;
    private final boolean HIGHLIGHT = true;

    private StringBuffer sqlString() {
        // nên làm như vậy vì nếu câu lệnh sql dài ra thì chỉ cần append vào kh cần sửa lại nguyên cả câu tránh sai sót
        StringBuffer varname1 = new StringBuffer();
        varname1.append("SELECT p.id as id_product ");
        varname1.append(",p.id_category ");
        varname1.append(",p.sizes ");
        varname1.append(",p.name ");
        varname1.append(",p.price ");
        varname1.append(",p.sale ");
        varname1.append(",p.title ");
        varname1.append(",p.highlight ");
        varname1.append(",p.new_product ");
        varname1.append(",p.details ");
        varname1.append(",p.created_at ");
        varname1.append(",p.updated_at ");
        varname1.append(",c.id as id_color ");
        varname1.append(",c.name as name_color ");
        varname1.append(",c.code as code_color ");
        varname1.append(",c.img ");
        varname1.append("FROM products p JOIN colors c ");
        varname1.append("ON p.id= c.id_product ");
        return varname1;


    }

    private String sqlProduct(boolean newProduct, boolean highligh) {
        StringBuffer sql = sqlString();
        sql.append("WHERE 1 = 1 ");
        if (highligh) {
            sql.append("AND p.highlight = true ");
        }
        if (newProduct) {
            sql.append("AND p.new_product = true ");
        }
        sql.append("GROUP BY p.id, c.id_product ");
        sql.append("ORDER BY RAND() ");
        if (highligh) {
            sql.append("LIMIT 9 ");
        }
        if (newProduct) {
            sql.append("LIMIT 12 ");
        }
        return sql.toString();

    }

    private StringBuffer sqlProductsByID(int id) {
        StringBuffer sql = sqlString();
        sql.append("WHERE 1 = 1 ");
        sql.append("AND p.id_category = " + id + " ");

        return sql;

    }

    private String sqlProductByPaginate(int id, int start, int totalPage) {
        StringBuffer sql = sqlProductsByID(id);
        sql.append("LIMIT " + start + " , " + totalPage + " ");
        return sql.toString();

    }

    public List<ProductsDto> getProducts() {
        String sql = sqlProduct(NEWPRODUCT, HIGHLIGHT);
        List<ProductsDto> list = template.query(sql, new ProductsDtoMapper());
        return list;

    }

    public List<ProductsDto> getAllProductsByID(int id) {
        String sql = sqlProductsByID(id).toString();
        List<ProductsDto> list = template.query(sql, new ProductsDtoMapper());
        return list;

    }

    public List<ProductsDto> getProductsPaginate(int id, int start, int totalPage) {
        StringBuffer getDataByID = sqlProductsByID(id);
        List<ProductsDto> listProductByID = template.query(getDataByID.toString(), new ProductsDtoMapper());
        List<ProductsDto> list = new ArrayList<ProductsDto>();
        // nếu có dữ liệu id tương ứng thì lấy danh sách sản phẩm ra
        if (listProductByID.size() > 0) {
            String sql = sqlProductByPaginate(id, start, totalPage);
            list = template.query(sql, new ProductsDtoMapper());
        }

        return list;

    }

    private String sqlSingleProductByID(long id) {
        StringBuffer sql = sqlString();
        sql.append("WHERE 1 = 1 ");// đk 1=1 chỉ để and với nhiều điều kiện khác thôi
        sql.append("AND p.id = " + id + " ");
        sql.append("LIMIT 1");
        return sql.toString();

    }

    public List<ProductsDto> getProductByID(long id) {
        List<ProductsDto> list = new ArrayList<ProductsDto>();
        list = template.query(sqlSingleProductByID(id), new ProductsDtoMapper());
        return list;
    }

    public ProductsDto findProductByID(long id) {

        ProductsDto productsDto = template.queryForObject(sqlSingleProductByID(id), new ProductsDtoMapper());
        return productsDto;
    }


    public static void main(String[] args) {
        ProductDao productDao = new ProductDao();
        System.out.println(productDao.sqlString());
    }
}

//    public List<ProductsDto> getNewProducts() {
//        String sql = "SELECT p.id as id_product ,p.id_category ,p.sizes ,p.name ,p.price ,p.sale ,p.title ,p.highlight ,p.new_product ,p.details ,p.created_at ,p.updated_at ,c.id as id_color ,c.name as name_color ,c.code as code_color ,c.img FROM products p JOIN colors c ON p.id= c.id_product GROUP BY p.id, c.id_product ORDER BY p.id DESC LIMIT 12";
//        List<ProductsDto> list = template.query(sql, new ProductsDtoMapper());
//        return list;
//    }
