package com.proj.main.board.vo;

public class SearchVO {
    
    // 검색 조건
    private String searchOption; // 검색 옵션 (예: 제목: title, 작성자: writer)
    private String searchWord;   // 검색 키워드

    // 페이징 관련 변수
    private int pageNo = 1;           // 현재 페이지 번호
    private int rowSizePerPage = 10;  // 한 페이지에 보여줄 게시글 수
    private int pageSize = 5;         // 페이지 네비게이션의 페이지 수
    private int boardCount;           // 총 게시글 수

    // 페이징 계산용 변수
    private int start;        // 페이지에 표시할 첫 게시글 번호
    private int end;          // 페이지에 표시할 마지막 게시글 번호
    private int firstPage;    // 페이지 네비게이션의 첫 번째 페이지 번호
    private int lastPage;     // 페이지 네비게이션의 마지막 페이지 번호
    private int finalPage;    // 전체 마지막 페이지 번호

    // 페이징 계산 메소드
    public void pageSetting() {
        this.start = (pageNo - 1) * rowSizePerPage + 1;
        this.end = pageNo * rowSizePerPage;

        // 전체 페이지 수 계산
        finalPage = (int) Math.ceil((double) boardCount / rowSizePerPage);

        // 네비게이션의 첫 번째 페이지 번호 계산
        firstPage = ((pageNo - 1) / pageSize) * pageSize + 1;
        lastPage = firstPage + pageSize - 1;

        // 마지막 페이지 번호가 실제 마지막 페이지보다 크면 수정
        if (lastPage > finalPage) {
            lastPage = finalPage;
        }
    }

    // 기본 생성자
    public SearchVO() {
    }

    // Getter & Setter
    public String getSearchOption() {
        return searchOption;
    }

    public void setSearchOption(String searchOption) {
        this.searchOption = searchOption;
    }

    public String getSearchWord() {
        return searchWord;
    }

    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getRowSizePerPage() {
        return rowSizePerPage;
    }

    public void setRowSizePerPage(int rowSizePerPage) {
        this.rowSizePerPage = rowSizePerPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getBoardCount() {
        return boardCount;
    }

    public void setBoardCount(int boardCount) {
        this.boardCount = boardCount;
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

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getFinalPage() {
        return finalPage;
    }

    public void setFinalPage(int finalPage) {
        this.finalPage = finalPage;
    }

    @Override
    public String toString() {
        return "SearchVO [searchOption=" + searchOption + ", searchWord=" + searchWord + 
               ", pageNo=" + pageNo + ", rowSizePerPage=" + rowSizePerPage + 
               ", pageSize=" + pageSize + ", boardCount=" + boardCount +
               ", start=" + start + ", end=" + end + 
               ", firstPage=" + firstPage + ", lastPage=" + lastPage + 
               ", finalPage=" + finalPage + "]";
    }
}
