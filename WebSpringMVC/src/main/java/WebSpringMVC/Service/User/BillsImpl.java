package WebSpringMVC.Service.User;

import WebSpringMVC.Dao.BillDao;
import WebSpringMVC.Dto.CartDto;
import WebSpringMVC.Entity.BillDetail;
import WebSpringMVC.Entity.Bills;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class BillsImpl implements IBill {
    @Autowired
    private BillDao billDao;

    @Override
    public int addBill(Bills bill) {
        return billDao.addBill(bill);
    }

    @Override
    public void addBillDetail(HashMap<Long, CartDto> carts) {
        long idBills = billDao.getLastIDBill();
        for (Map.Entry<Long, CartDto> itemCart : carts.entrySet()) {
            BillDetail detail = new BillDetail();
            detail.setId(idBills);
            detail.setId_product(itemCart.getValue().getProductsDto().getId_product());
            detail.setQuantity(itemCart.getValue().getQuantity());
            detail.setTotal(itemCart.getValue().getTotalPrice());
            billDao.addBillDetail(detail);
        }
    }
}
