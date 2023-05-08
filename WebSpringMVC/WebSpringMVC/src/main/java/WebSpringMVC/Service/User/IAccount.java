package WebSpringMVC.Service.User;

import WebSpringMVC.Entity.User;
import org.springframework.stereotype.Service;

@Service
public interface IAccount {
    int addAccount(User user);

    User checkAccount(User user);
}
