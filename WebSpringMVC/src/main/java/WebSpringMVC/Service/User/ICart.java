package WebSpringMVC.Service.User;

import WebSpringMVC.Dto.CartDto;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public interface ICart {

    HashMap<Long, CartDto> addCart(long id, HashMap<Long, CartDto> cart);

    HashMap<Long, CartDto> editCart(long id, int quantity, HashMap<Long, CartDto> cart);

    HashMap<Long, CartDto> deleteCart(long id, HashMap<Long, CartDto> cart);

    int totalQuantity(HashMap<Long, CartDto> cart);

    double totalPrice(HashMap<Long, CartDto> cart);
}
