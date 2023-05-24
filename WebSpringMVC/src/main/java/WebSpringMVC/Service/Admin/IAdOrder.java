package WebSpringMVC.Service.Admin;

import WebSpringMVC.Entity.Bills;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IAdOrder {
    public List<Bills> getAllOrder();
    public void deleteOrder(long id);
}
