package WebSpringMVC.Dao;

import WebSpringMVC.Entity.Menus;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
public class MenuDao extends BaseDao {

    public List<Menus> getDataMenu() {
        List<Menus> ls = new ArrayList<>();
        String sql = "SELECT * FROM menus ";
        //  ls = template.query(sql, new MapperMenu());
        ls = template.query(sql, mapperMenus());
        return ls;

    }

    private RowMapper<Menus> mapperMenus() {
        return new BeanPropertyRowMapper<Menus>(Menus.class);
    }
}
