package WebSpringMVC.Service.User;

import WebSpringMVC.Dto.CartDto;
import WebSpringMVC.Entity.Bills;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public interface IBill {
   int addBill(Bills bills);
   void addBillDetail(HashMap<Long, CartDto>carts);
}
