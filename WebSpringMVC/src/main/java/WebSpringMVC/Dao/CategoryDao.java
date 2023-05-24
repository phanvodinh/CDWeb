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
        String sql = "INSERT INTO categorys (id, name, description) VALUES (?,?,?)";
        int id = getNextId();
        template.update(sql, id, category.getName(), category.getDescription());
    }

    public void delete(int id) {
        String sql = "DELETE FROM categorys WHERE id = ?";
        Object[] args = {id};
        template.update(sql, args);
    }

    public Category getById(int id) {
        String sql = "SELECT * FROM categorys WHERE id = ?";
        Object[] args = {id};
        List<Category> categories = template.query(sql, args, getRow());
        return categories.isEmpty() ? null : categories.get(0);
    }

    private int getNextId() {
        String sql = "SELECT MAX(id) FROM categorys";
        Integer maxId = template.queryForObject(sql, Integer.class);
        return maxId != null ? maxId + 1 : 1;
    }

    public void updateCategory(Category category) {
        String sql = "UPDATE categorys SET name=?, description=? WHERE id=?";
        template.update(sql, category.getName(), category.getDescription(), category.getId());
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM categorys WHERE id=?";
        return template.queryForObject(sql, getRow(), id);
        //  return template.queryForObject(sql, new Object[]{id}, getRow());
    }

    private RowMapper<Category> getRow() {
        return new BeanPropertyRowMapper<Category>(Category.class);
    }


}
