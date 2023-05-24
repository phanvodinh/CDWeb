package WebSpringMVC.Service.Admin;

import WebSpringMVC.Dao.admin.OrderAdmin;
import WebSpringMVC.Entity.Bills;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderAdminImpl implements IAdOrder {
    @Autowired
    private OrderAdmin orderAdmin;

    @Override
    public List<Bills> getAllOrder() {
        return orderAdmin.getAllOrder();
    }

    @Override
    public void deleteOrder(long id) {
        orderAdmin.deleteOrder(id);
    }


}
