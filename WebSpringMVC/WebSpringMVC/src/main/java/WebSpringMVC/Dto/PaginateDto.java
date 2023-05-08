package WebSpringMVC.Dto;

public class PaginateDto {
    private int currentPage, limit, start, end, totalPage;

    public PaginateDto() {
    }

    public PaginateDto(int currentPage, int limit, int start, int end, int totalPage) {
        this.currentPage = currentPage;
        this.limit = limit;
        this.start = start;
        this.end = end;
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    @Override
    public String toString() {
        return "PaginateDto{" +
                "currentPage=" + currentPage +
                ", limit=" + limit +
                ", start=" + start +
                ", end=" + end +
                ", totalPage=" + totalPage +
                '}';
    }
}
