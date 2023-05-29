package WebSpringMVC.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;

@Controller
public class JavaMailController {
    @Autowired
    private MailSender mailSender;


}
