package WebSpringMVC.Dao;

import WebSpringMVC.Entity.Category;
import WebSpringMVC.Entity.MapperCategory;
import WebSpringMVC.Entity.MapperSlides;
import WebSpringMVC.Entity.Slides;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
public class SlidesDao extends BaseDao {

    public List<Slides> getDataSlides() {
        List<Slides> list = new ArrayList<Slides>();
        String sql = "select * from slides ";
        list = template.query(sql, new MapperSlides());
        return list;

    }

    public List<Category> listCate() {
        // List<Category> list = new ArrayList<>();
        String sql = "select * from categorys ";
        //  list = template.query(sql, new MapperCategory());
        return template.query(sql, new MapperCategory());

    }

    public static void main(String[] args) {
//        SlidesDao dao = new SlidesDao();
//        for (Category s : dao.listCate()) {
//            System.out.println(s.toString());
//        }

//        try {
//            Category  category;
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection con = DriverManager.getConnection(
//                    "jdbc:mysql://localhost:3306/diamond_shop", "root", "");
//            String sql = "select * from categorys ";
//            PreparedStatement ps= con.prepareStatement(sql);
//            ResultSet rs= ps.executeQuery();
//            while (rs.next()){
//                System.out.println(rs.getInt("id")+rs.getString("name"));
//            }
//        } catch (ClassNotFoundException | SQLException e) {
//            throw new RuntimeException(e);
//        }


    }
}
