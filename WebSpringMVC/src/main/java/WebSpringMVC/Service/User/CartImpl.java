package WebSpringMVC.Service.User;

import WebSpringMVC.Dao.CartDao;
import WebSpringMVC.Dto.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class CartImpl implements ICart {
    @Autowired
    private CartDao cartDao = new CartDao();


    public HashMap<Long, CartDto> addCart(long id, HashMap<Long, CartDto> cart) {
        return cartDao.addCart(id, cart);
    }


    public HashMap<Long, CartDto> editCart(long id, int quantity, HashMap<Long, CartDto> cart) {
        return cartDao.editCart(id, quantity, cart);
    }


    public HashMap<Long, CartDto> deleteCart(long id, HashMap<Long, CartDto> cart) {
        return cartDao.deleteCart(id, cart);
    }

    @Override
    public int totalQuantity(HashMap<Long, CartDto> cart) {
        return cartDao.totalQuantity(cart);
    }

    @Override
    public double totalPrice(HashMap<Long, CartDto> cart) {
        return cartDao.totalPrice(cart);
    }
}
