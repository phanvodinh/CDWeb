package WebSpringMVC.Dao;

import WebSpringMVC.Entity.BillDetail;
import WebSpringMVC.Entity.Bills;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class BillDao extends BaseDao {
    public int addBill(Bills bill) {
        String sql = "INSERT INTO bills (user, phone, display_name, address, total, quantity, note) VALUES (?, ?, ?, ?, ?, ?, ?)";
        int index = template.update(sql, bill.getUser(), bill.getPhone(), bill.getDisplay_name(),
                bill.getAddress(), bill.getTotal(), bill.getQuantity(), bill.getNote());
        return index;
    }

    public long getLastIDBill() {
        String sql = "SELECT MAX(id) FROM bills";
        long index = template.queryForObject(sql, new Object[]{}, Long.class);
        return index;

    }

    public int addBillDetail(BillDetail detail) {
        String sql = "INSERT INTO billdetail ( id_product, id_bill, quatity, total) VALUES (?,?,?,?)";
        int index = template.update(sql, detail.getId_product(), detail.getId_bill(), detail.getQuantity(), detail.getTotal());
        return index;
    }

    private RowMapper<Bills> getRow() {
        return new BeanPropertyRowMapper<Bills>(Bills.class);
    }
}
