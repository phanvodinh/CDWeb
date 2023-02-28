package WebSpringMVC.Dao;

import WebSpringMVC.Entity.Category;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
public class CategoryDao extends BaseDao {

    public List<Category> getDataCategorys() {
        List<Category> ls = new ArrayList<>();
        String sql = "SELECT * FROM categorys";
        //  ls = template.query(sql, new MapperCategory());
        ls = template.query(sql, getRow());
        return ls;

    }

    private RowMapper<Category> getRow() {
        return new BeanPropertyRowMapper<Category>(Category.class);
    }
}
