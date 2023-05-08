package WebSpringMVC.Dao;


import WebSpringMVC.Entity.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;




@Repository
public class UserDao extends BaseDao {
    public RowMapper<User> getRow() {
        return new BeanPropertyRowMapper<User>(User.class);
    }

    public int addAccount(User user) {
        String sql = "INSERT INTO user ( user, password, display_name, address) " +
                "VALUES ('" + user.getUser() + "','" + user.getPassword() + "','" + user.getDisplayName() + "','" + user.getAddress() + "')";
        int insert = template.update(sql);
        return insert;

    }

    public User getUserLogin(User user) {
        String sql="SELECT * FROM user WHERE user= '"+user.getUser()+"'";
        User re = template.queryForObject(sql,getRow());
        return re;
    }
}
