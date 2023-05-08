package WebSpringMVC.Entity;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperCategory implements RowMapper<Category> {
    public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
        Category category = new Category();
        category.setId(rs.getInt("id"));
        category.setName(rs.getString("name"));
        category.setDescription((rs.getString("description")));
        return category;
     //   return  new BeanPropertyRowMapper<Category>(Category.class);
    }

}
