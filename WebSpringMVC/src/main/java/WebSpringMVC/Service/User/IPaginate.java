package WebSpringMVC.Service.User;

import WebSpringMVC.Dto.PaginateDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public interface IPaginate {

    PaginateDto getInfoPaginate(int totalData, int limit, int currentPage);
}
