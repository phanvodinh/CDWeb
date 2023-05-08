package WebSpringMVC.Service.User;

import WebSpringMVC.Dto.PaginateDto;
import org.springframework.stereotype.Service;

@Service
public class PaginateImpl implements IPaginate {
    @Override
    public PaginateDto getInfoPaginate(int totalData, int limit, int currentPage) {
        PaginateDto paginate = new PaginateDto();
        paginate.setTotalPage(setInforTotalPage(totalData, limit));
        paginate.setLimit(limit);
        paginate.setCurrentPage(checkCurrentPage(currentPage, paginate.getTotalPage()));
        int start = findStart(paginate.getCurrentPage(), limit);
        paginate.setStart(start);
        int end = findEnd(paginate.getStart(), limit, totalData);
        paginate.setEnd(end);
        return paginate;
    }

    /*
    findStart: tìm ra sản phẩm đầu tiên của page
    findEnd: tìm ra sản phẩm cuối cùng của page
    vd:
 page1   1 2 3 4 5 6 7 8 9
 page2   10 11 12 13 14 15 16 17 18 19
 page3   20 21 22 23 24 25 26 27 28 29
 page4   30 31 32 33 34 35 36 37 38 39
     */
    private int findEnd(int start, int limit, int totalData) {
        return start + limit > totalData ? totalData : (start + limit) - 1;
    }

    private int findStart(int currentPage, int limit) {
        return ((currentPage - 1) * limit + 1);
    }

    public int checkCurrentPage(int currentPage, int totalPage) {
        if (currentPage < 1) {
            return 1;
        }
        if (currentPage > totalPage) {
            return totalPage;
        }
        return currentPage;
    }

    private int setInforTotalPage(int totalData, int limit) {
        int totalPage = 0;
        totalPage = totalData / limit;
        totalPage = totalPage * limit < totalData ? totalPage + 1 : totalPage;
        return totalPage;
    }
}
