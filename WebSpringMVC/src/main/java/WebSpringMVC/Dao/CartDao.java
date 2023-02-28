package WebSpringMVC.Dao;

import WebSpringMVC.Dto.CartDto;
import WebSpringMVC.Dto.ProductsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Repository
@Transactional
public class CartDao extends BaseDao {
    @Autowired
    ProductDao productDao = new ProductDao();

    public HashMap<Long, CartDto> addCart(long id, HashMap<Long, CartDto> cart) {
        CartDto itemCart = new CartDto();
        ProductsDto productsDto = productDao.findProductByID(id);
        if (productsDto != null && cart.containsKey(id)) {
            itemCart = cart.get(id);
            itemCart.setQuantity(itemCart.getQuantity() + 1);
            itemCart.setTotalPrice(itemCart.getQuantity() * itemCart.getProductsDto().getPrice());
        } else {
            itemCart.setProductsDto(productsDto);
            itemCart.setQuantity(1);
            itemCart.setTotalPrice(productsDto.getPrice());
        }
        cart.put(id, itemCart);
        return cart;

    }

    public HashMap<Long, CartDto> editCart(long id, int quantity, HashMap<Long, CartDto> cart) {

        CartDto itemCart = new CartDto();
        if (cart == null) {
            return cart;
        }
        if (cart.containsKey(id)) {
            itemCart = cart.get(id);
            itemCart.setQuantity(quantity);
            double totalPrice = itemCart.getProductsDto().getPrice() * quantity;
            itemCart.setTotalPrice(totalPrice);
        }

        cart.put(id, itemCart);
        return cart;
    }


    public HashMap<Long, CartDto> deleteCart(long id, HashMap<Long, CartDto> cart) {
        if (cart == null) {
            return cart;
        }
        cart.remove(id);
        return cart;
    }

    public int totalQuantity(HashMap<Long, CartDto> cart) {
        int totalQuantity = 0;
        for (Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
            totalQuantity += itemCart.getValue().getQuantity();
        }
        return totalQuantity;
    }

    public double totalPrice(HashMap<Long, CartDto> cart) {
        int Price = 0;
        for (Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
            Price += itemCart.getValue().getTotalPrice();
        }
        return Price;
    }
}
