package WebSpringMVC.Service.User;

import WebSpringMVC.Dao.UserDao;
import WebSpringMVC.Entity.User;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountImpl implements IAccount {
    @Autowired
    UserDao userDao = new UserDao();

    public int addAccount(User user) {
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
        return userDao.addAccount(user);
    }

    public User checkAccount(User user) {
        String passBeforeEncrypt = user.getPassword();
        String passAfterEncrypt = userDao.getUserLogin(user).getPassword();
        if (user != null) {
            if( BCrypt.checkpw(passBeforeEncrypt, passAfterEncrypt)){
                return userDao.getUserLogin(user);
            }
        }
        return null;
    }


}
