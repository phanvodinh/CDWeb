package WebSpringMVC.Dao.admin;

import WebSpringMVC.Dao.BaseDao;
import WebSpringMVC.Entity.Bills;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class OrderAdmin extends BaseDao {
    public List<Bills> getAllOrder() {
        String sql = " SELECT b.id, b.display_name, b.address, b.quantity, b.total FROM bills b ";
        return template.query(sql, (rs, rowNum) -> {
            Bills bills = new Bills();
            bills.setId(rs.getLong("b.id"));
            bills.setDisplay_name(rs.getString("b.display_name"));
            bills.setAddress(rs.getString("b.address"));
            bills.setQuantity(rs.getInt("b.quantity"));
            bills.setTotal(rs.getDouble("b.total"));
            return bills;
        });
    }

    public void deleteOrder(long id) {
        String sql = " DELETE FROM bills WHERE id = ?";
        Object[] args = {id};
        template.update(sql, args);
    }
}
