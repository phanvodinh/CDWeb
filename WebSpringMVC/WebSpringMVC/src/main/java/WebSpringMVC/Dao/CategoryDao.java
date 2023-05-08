package WebSpringMVC.Dao;

import WebSpringMVC.Entity.Category;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
@Component
public class CategoryDao extends BaseDao {

    public List<Category> getDataCategorys() {
        List<Category> ls = new ArrayList<>();
        String sql = "SELECT * FROM categorys";
        //  ls = template.query(sql, new MapperCategory());
        ls = template.query(sql, getRow());
        return ls;

    }

    public void saveCate(Category category) {
        String sql = "INSERT INTO categorys (name, description) VALUES (?,?)";
        template.update(sql, category.getName(), category.getDescription());
    }

    public void delete(int id) {
        String sql = "DELETE FROM categorys WHERE id = ?";
        Object[] args = {id};
        template.update(sql, args);
    }
    public Category getById(int id) {
        String sql = "SELECT * FROM categorys WHERE id = ?";
        Object[] args = { id };
        List<Category> categories = template.query(sql, args, getRow());
        return categories.isEmpty() ? null : categories.get(0);
    }
    private RowMapper<Category> getRow() {
        return new BeanPropertyRowMapper<Category>(Category.class);
    }


}
