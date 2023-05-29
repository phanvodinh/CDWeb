package WebSpringMVC.Dao.admin;

import WebSpringMVC.Dao.BaseDao;
import WebSpringMVC.Entity.Category;
import WebSpringMVC.Entity.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class UserAdmin extends BaseDao {
    public User findByUsername(String username) {
        String sql = "SELECT * FROM user u WHERE u.user = ?";
        return template.queryForObject(sql, new Object[]{username}, getRow());
    }

    private RowMapper<User> getRow() {
        return new BeanPropertyRowMapper<User>(User.class);
    }
}
